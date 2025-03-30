import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rrule_generator/localizations/text_delegate.dart';
import 'package:rrule_generator/src/periods/period.dart';
import 'package:rrule_generator/src/pickers/helpers.dart';
import 'package:rrule_generator/src/pickers/interval.dart';

import '../rrule_generator_config.dart';

class Monthly extends StatelessWidget implements Period {
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
  final dayNotifier = ValueNotifier(1);
  final intervalController = TextEditingController(text: '1');

  Monthly(this.config, this.textDelegate, this.onChange, this.initialRRule,
      this.initialDate,
      {super.key}) {
    if (initialRRule.contains('MONTHLY')) {
      handleInitialRRule();
    } else {
      dayNotifier.value = initialDate.day;
      weekdayNotifier.value = initialDate.weekday - 1;
    }
  }

  @override
  void handleInitialRRule() {
    if (initialRRule.contains('BYMONTHDAY')) {
      monthTypeNotifier.value = 0;
      int dayIndex = initialRRule.indexOf('BYMONTHDAY=') + 11;
      String day = initialRRule.substring(
          dayIndex, dayIndex + (initialRRule.length > dayIndex + 1 ? 2 : 1));
      if (day.length == 1 || day[1] != ';') {
        dayNotifier.value = int.parse(day);
      } else {
        dayNotifier.value = int.parse(day[0]);
      }

      if (initialRRule.contains('INTERVAL=')) {
        final intervalIndex = initialRRule.indexOf('INTERVAL=') + 9;
        int intervalEnd = initialRRule.indexOf(';', intervalIndex);
        intervalEnd = intervalEnd == -1 ? initialRRule.length : intervalEnd;
        String interval = initialRRule.substring(intervalIndex,
            intervalEnd == -1 ? initialRRule.length : intervalEnd);
        intervalController.text = interval;
      }
    } else {
      monthTypeNotifier.value = 1;

      if (initialRRule.contains('BYSETPOS=')) {
        int monthDayIndex = initialRRule.indexOf('BYSETPOS=') + 9;
        String monthDay =
            initialRRule.substring(monthDayIndex, monthDayIndex + 1);

        if (monthDay == '-') {
          monthDayNotifier.value = 4;
        } else {
          monthDayNotifier.value = int.parse(monthDay) - 1;
        }
      }

      if (initialRRule.contains('BYDAY=')) {
        int weekdayIndex = initialRRule.indexOf('BYDAY=') + 6;
        String weekday = initialRRule.substring(weekdayIndex, weekdayIndex + 2);
        weekdayNotifier.value = weekdaysShort.indexOf(weekday);
      }
    }
  }

  @override
  String getRRule() {
    if (monthTypeNotifier.value == 0) {
      final byMonthDay =
          dayNotifier.value == 32 ? -1 : dayNotifier.value; // Handle "Last day"
      final interval = int.tryParse(intervalController.text) ?? 0;
      return 'FREQ=MONTHLY;BYMONTHDAY=$byMonthDay;INTERVAL=${interval > 0 ? interval : 1}';
    } else {
      final byDay =
          weekdaysShort[weekdayNotifier.value]; // e.g., "MO" for Monday
      final bySetPos = (monthDayNotifier.value < 4)
          ? monthDayNotifier.value + 1
          : -1; // Week position
      final interval = int.tryParse(intervalController.text) ?? 0;
      return 'FREQ=MONTHLY;INTERVAL=${interval > 0 ? interval : 1};'
          'BYDAY=$byDay;BYSETPOS=$bySetPos';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildContainer(
          child: buildElement(
            title: textDelegate.every,
            style: config.labelStyle,
            child: Row(
              children: [
                Expanded(
                    child: IntervalPicker(
                  intervalController,
                  onChange,
                  config: config,
                )),
                Padding(
                  padding: EdgeInsets.zero,
                  child: Text(
                    textDelegate.months,
                    style: config.labelStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ValueListenableBuilder(
          valueListenable: monthTypeNotifier,
          builder: (context, monthType, child) => Column(
            children: [
              buildToggleItem(
                title: textDelegate.byDayInMonth,
                switchTextStyle: config.switchStyle.switchTextStyle,
                value: monthType == 0,
                onChanged: (selected) {
                  monthTypeNotifier.value = selected ? 0 : 1;
                  onChange();
                },
                child: buildElement(
                  title: textDelegate.on,
                  style: config.labelStyle,
                  child: buildDropdown(
                    child: ValueListenableBuilder(
                      valueListenable: dayNotifier,
                      builder: (context, day, _) => DropdownButton(
                        isExpanded: true,
                        value: day,
                        onChanged: (newDay) {
                          dayNotifier.value = newDay!;
                          onChange();
                        },
                        items: List.generate(
                          32, // One extra item for the "Last" option
                          (index) {
                            if (index == 31) {
                              return DropdownMenuItem(
                                value: -1,
                                // Use a distinct value for "Last"
                                child: Text(
                                  textDelegate.daysInMonth.last,
                                  style: config.labelStyle,
                                ),
                              );
                            } else {
                              return DropdownMenuItem(
                                value: index + 1,
                                child: Text(
                                  '${index + 1}',
                                  style: config
                                      .dropdownStyle.dropdownMenuItemTextStyle,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    dropdownMenuStyle: config.dropdownStyle.dropdownMenuStyle,
                  ),
                ),
              ),
              config.divider,
              buildToggleItem(
                title: textDelegate.byNthDayInMonth,
                switchTextStyle: config.switchStyle.switchTextStyle,
                value: monthType == 1,
                onChanged: (selected) {
                  monthTypeNotifier.value = selected ? 1 : 0;
                  onChange();
                },
                child: Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: monthDayNotifier,
                      builder: (context, dayInMonth, _) => Row(
                        children: [
                          Expanded(
                            child: buildElement(
                              title: textDelegate.on,
                              style: config.labelStyle,
                              child: buildDropdown(
                                child: DropdownButton(
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
                                        style: config.dropdownStyle
                                            .dropdownMenuItemTextStyle,
                                      ),
                                    ),
                                  ),
                                ),
                                dropdownMenuStyle:
                                    config.dropdownStyle.dropdownMenuStyle,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: buildElement(
                              title: textDelegate.day,
                              style: config.labelStyle,
                              child: buildDropdown(
                                child: ValueListenableBuilder(
                                  valueListenable: weekdayNotifier,
                                  builder: (context, weekday, _) =>
                                      DropdownButton(
                                    isExpanded: true,
                                    value: weekday,
                                    onChanged: (newWeekday) {
                                      weekdayNotifier.value = newWeekday!;
                                      onChange();
                                    },
                                    items: List.generate(
                                      7,
                                      (index) {
                                        // Start with Monday as per ISO-8601 (Monday = 1, Sunday = 7)
                                        final date =
                                            DateTime(2023, 1, 2 + index);
                                        final weekday =
                                            DateFormat.EEEE(textDelegate.locale)
                                                .format(date);
                                        return DropdownMenuItem(
                                          value: index,
                                          child: Text(
                                            weekday,
                                            style: config.dropdownStyle
                                                .dropdownMenuItemTextStyle,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                dropdownMenuStyle:
                                    config.dropdownStyle.dropdownMenuStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
