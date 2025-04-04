import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rrule_generator/localizations/text_delegate.dart';
import 'package:rrule_generator/src/periods/period.dart';
import 'package:rrule_generator/src/pickers/helpers.dart';

import '../rrule_generator_config.dart';

class Yearly extends StatelessWidget implements Period {
  @override
  final RRuleGeneratorConfig config;
  @override
  final RRuleTextDelegate textDelegate;
  @override
  final void Function() onChange;
  @override
  final String initialRRule;
  @override
  final DateTime initialDate;

  final monthTypeNotifier = ValueNotifier(0);
  final monthDayNotifier = ValueNotifier(1);
  final weekdayNotifier = ValueNotifier(0);
  final monthNotifier = ValueNotifier(DateTime.now().month);
  final dayNotifier = ValueNotifier(DateTime.now().day);

  Yearly(this.config, this.textDelegate, this.onChange, this.initialRRule,
      this.initialDate,
      {super.key}) {
    if (initialRRule.contains('YEARLY')) {
      handleInitialRRule();
    } else {
      dayNotifier.value = initialDate.day;
      weekdayNotifier.value = initialDate.weekday - 1;
      monthNotifier.value = initialDate.month;
    }
  }

  @override
  void handleInitialRRule() {
    if (initialRRule.contains('BYMONTHDAY')) {
      monthTypeNotifier.value = 0;
      final dayIndex = initialRRule.indexOf('BYMONTHDAY=') + 11;
      final day = initialRRule.substring(
          dayIndex, dayIndex + (initialRRule.length > dayIndex + 1 ? 2 : 1));
      if (day.length == 1 || day[1] != ';') {
        dayNotifier.value = int.parse(day);
      } else {
        dayNotifier.value = int.parse(day[0]);
      }
    } else {
      monthTypeNotifier.value = 1;

      if (initialRRule.contains('BYSETPOS=')) {
        final monthDayIndex = initialRRule.indexOf('BYSETPOS=') + 9;
        final monthDay =
            initialRRule.substring(monthDayIndex, monthDayIndex + 1);

        if (monthDay == '-') {
          monthDayNotifier.value = 4;
        } else {
          monthDayNotifier.value = int.parse(monthDay) - 1;
        }
      }

      if (initialRRule.contains('BYDAY=')) {
        final weekdayIndex = initialRRule.indexOf('BYDAY=') + 6;
        final weekday = initialRRule.substring(weekdayIndex, weekdayIndex + 2);

        weekdayNotifier.value = weekdaysShort.indexOf(weekday);
      }
    }

    if (initialRRule.contains('BYMONTH=')) {
      final monthIndex = initialRRule.indexOf('BYMONTH=') + 8;
      final month = initialRRule.substring(monthIndex,
          monthIndex + (initialRRule.length > monthIndex + 1 ? 2 : 1));
      if (month.length == 1 || month[1] != ';') {
        monthNotifier.value = int.parse(month);
      } else {
        monthNotifier.value = int.parse(month[0]);
      }
    }
  }

  @override
  String getRRule() {
    if (monthTypeNotifier.value == 0) {
      final byMonth = monthNotifier.value;
      final byMonthDay = dayNotifier.value;
      return 'FREQ=YEARLY;BYMONTH=$byMonth;BYMONTHDAY=$byMonthDay';
    } else {
      final byMonth = monthNotifier.value;
      final byDay = weekdaysShort[weekdayNotifier.value];
      final bySetPos =
          (monthDayNotifier.value < 4) ? monthDayNotifier.value + 1 : -1;
      return 'FREQ=YEARLY;BYMONTH=$byMonth;BYDAY=$byDay;BYSETPOS=$bySetPos';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: monthTypeNotifier,
      builder: (context, monthType, _) => Column(
        children: [
          buildToggleItem(
            onChanged: (selected) {
              monthTypeNotifier.value = selected ? 0 : 1;
              onChange();
            },
            title: textDelegate.byDayInMonth,
            switchStyle: config.switchStyle,
            value: monthType == 0,
            child: _buildMonthDateRow(),
          ),
          const Divider(),
          buildToggleItem(
            onChanged: (selected) {
              monthTypeNotifier.value = selected ? 1 : 0;
              onChange();
            },
            title: textDelegate.byNthDayInMonth,
            switchStyle: config.switchStyle,
            value: monthType == 1,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: buildElement(
                        title: textDelegate.on,
                        style: config.labelStyle,
                        child: _buildDayInMonthDropdown(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: buildElement(
                        title: textDelegate.day,
                        style: config.labelStyle,
                        child: _buildWeekdayDropdown(),
                      ),
                    ),
                  ],
                ),
                buildElement(
                  title: textDelegate.of,
                  style: config.labelStyle,
                  child: _buildMonthDropdownForNthDay(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthDropdown() {
    return buildDropdown(
      child: ValueListenableBuilder(
        valueListenable: monthNotifier,
        builder: (context, month, _) => DropdownButton(
          isExpanded: true,
          value: month,
          onChanged: (newMonth) {
            monthNotifier.value = newMonth!;
            onChange();
          },
          items: List.generate(
            12,
            (index) {
              final date = DateTime(2023, index + 1, 1);
              final month = DateFormat.MMMM(textDelegate.locale).format(date);
              return DropdownMenuItem(
                value: index + 1,
                child: Text(
                  month,
                  style: config.dropdownStyle.dropdownMenuItemTextStyle,
                ),
              );
            },
          ),
        ),
      ),
      dropdownMenuStyle: config.dropdownStyle.dropdownMenuStyle,
    );
  }

  Widget _buildDateDropdown() {
    return ValueListenableBuilder(
      valueListenable: monthNotifier,
      builder: (context, month, _) => buildDropdown(
        child: ValueListenableBuilder(
          valueListenable: dayNotifier,
          builder: (context, day, _) {
            final daysInMonth =
                DateTime(DateTime.now().year, monthNotifier.value + 1, 0).day;

            if (day > daysInMonth) {
              dayNotifier.value = daysInMonth;
            }

            return DropdownButton(
              isExpanded: true,
              value: day > daysInMonth ? daysInMonth : day,
              onChanged: (newDay) {
                dayNotifier.value = newDay!;
                onChange();
              },
              items: List.generate(
                daysInMonth,
                (index) => DropdownMenuItem(
                  value: index + 1,
                  child: Text(
                    '${index + 1}',
                    style: config.dropdownStyle.dropdownMenuItemTextStyle,
                  ),
                ),
              ),
            );
          },
        ),
        dropdownMenuStyle: config.dropdownStyle.dropdownMenuStyle,
      ),
    );
  }

  Widget _buildMonthDateRow() {
    return buildContainer(
      child: Row(
        children: [
          ...(() {
            final pattern = DateFormat.yMd(textDelegate.locale).pattern;
            final isMonthFirst = pattern?.contains('M') == true &&
                pattern!.indexOf('M') < pattern.indexOf('d');

            final widgets = [
              Expanded(
                child: buildElement(
                  title: textDelegate.month,
                  style: config.labelStyle,
                  child: _buildMonthDropdown(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: buildElement(
                  title: textDelegate.date,
                  style: config.labelStyle,
                  child: _buildDateDropdown(),
                ),
              ),
            ];

            return isMonthFirst ? widgets : widgets.reversed.toList();
          })(),
        ],
      ),
    );
  }

  Widget _buildDayInMonthDropdown() {
    return buildDropdown(
      child: ValueListenableBuilder(
        valueListenable: monthDayNotifier,
        builder: (context, dayInMonth, _) => DropdownButton(
          isExpanded: true,
          value: dayInMonth,
          onChanged: (dayInMonth) {
            monthDayNotifier.value = dayInMonth!;
            onChange();
          },
          items: List.generate(
            5,
            (index) => DropdownMenuItem(
              value: index,
              child: Text(
                textDelegate.daysInMonth[index],
                style: config.dropdownStyle.dropdownMenuItemTextStyle,
              ),
            ),
          ),
        ),
      ),
      dropdownMenuStyle: config.dropdownStyle.dropdownMenuStyle,
    );
  }

  Widget _buildWeekdayDropdown() {
    return buildDropdown(
      child: ValueListenableBuilder(
        valueListenable: weekdayNotifier,
        builder: (context, weekday, _) => DropdownButton(
          isExpanded: true,
          value: weekday,
          onChanged: (newWeekday) {
            weekdayNotifier.value = newWeekday!;
            onChange();
          },
          items: List.generate(
            7,
            (index) {
              final date = DateTime(2023, 1, 2 + index);
              final weekday = DateFormat.EEEE(textDelegate.locale).format(date);
              return DropdownMenuItem(
                value: index,
                child: Text(
                  weekday,
                  style: config.dropdownStyle.dropdownMenuItemTextStyle,
                ),
              );
            },
          ),
        ),
      ),
      dropdownMenuStyle: config.dropdownStyle.dropdownMenuStyle,
    );
  }

  Widget _buildMonthDropdownForNthDay() {
    return buildDropdown(
      child: ValueListenableBuilder(
        valueListenable: monthNotifier,
        builder: (context, month, _) => DropdownButton(
          isExpanded: true,
          value: month,
          onChanged: (newMonth) {
            monthNotifier.value = newMonth!;
            onChange();
          },
          items: List.generate(
            12,
            (index) => DropdownMenuItem(
              value: index + 1,
              child: Text(
                DateFormat.MMMM(textDelegate.locale)
                    .format(DateTime(2023, index + 1, 1)),
                style: config.labelStyle,
              ),
            ),
          ),
        ),
      ),
      dropdownMenuStyle: config.dropdownStyle.dropdownMenuStyle,
    );
  }
}
