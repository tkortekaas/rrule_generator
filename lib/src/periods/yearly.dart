import 'package:flutter/material.dart';
import 'package:rrule_generator/localizations/text_delegate.dart';
import 'package:rrule_generator/src/periods/period.dart';
import 'package:rrule_generator/src/pickers/helpers.dart';

class Yearly extends StatelessWidget implements Period {
  @override
  final RRuleTextDelegate textDelegate;
  @override
  final Function onChange;
  @override
  final String initialRRule;
  @override
  final DateTime initialDate;

  final monthTypeNotifier = ValueNotifier(0);
  final monthDayNotifier = ValueNotifier(1);
  final weekdayNotifier = ValueNotifier(0);
  final monthNotifier = ValueNotifier(DateTime.now().month);
  final dayNotifier = ValueNotifier(DateTime.now().day);

  Yearly(this.textDelegate, this.onChange, this.initialRRule, this.initialDate,
      {Key? key})
      : super(key: key) {
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
      int dayIndex = initialRRule.indexOf('BYMONTHDAY=') + 11;
      String day = initialRRule.substring(
          dayIndex, dayIndex + (initialRRule.length > dayIndex + 1 ? 2 : 1));
      if (day.length == 1 || day[1] != ';') {
        dayNotifier.value = int.parse(day);
      } else {
        dayNotifier.value = int.parse(day[0]);
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

    if (initialRRule.contains('BYMONTH=')) {
      int monthIndex = initialRRule.indexOf('BYMONTH=') + 8;
      String month = initialRRule.substring(monthIndex,
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
      int byMonth = monthNotifier.value;
      int byMonthDay = dayNotifier.value;
      return 'FREQ=YEARLY;BYMONTH=$byMonth;BYMONTHDAY=$byMonthDay';
    } else {
      int byMonth = monthNotifier.value;
      String byDay = weekdaysShort[weekdayNotifier.value];
      int bySetPos =
          (monthDayNotifier.value < 4) ? monthDayNotifier.value + 1 : -1;
      return 'FREQ=YEARLY;BYMONTH=$byMonth;BYDAY=$byDay;BYSETPOS=$bySetPos';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: monthTypeNotifier,
      builder: (BuildContext context, int monthType, _) => Column(
        children: [
          buildToggleItem(
            onChanged: (bool selected) {
              monthTypeNotifier.value = selected ? 0 : 1;
            },
            title: textDelegate.byDayInMonth,
            value: monthType == 0,
            child: buildContainer(
              child: Row(
                children: [
                  Expanded(
                    child: buildElement(
                      title: textDelegate.months,
                      child: buildDropdown(
                        child: ValueListenableBuilder(
                          valueListenable: monthNotifier,
                          builder: (BuildContext context, int month, _) =>
                              DropdownButton(
                            isExpanded: true,
                            value: month,
                            onChanged: (int? newMonth) {
                              monthNotifier.value = newMonth!;
                              onChange();
                            },
                            items: List.generate(
                              12,
                              (index) => DropdownMenuItem(
                                value: index + 1,
                                child: Text(
                                  textDelegate.allMonths[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: buildElement(
                      title: textDelegate.day,
                      child: buildDropdown(
                        child: ValueListenableBuilder(
                          valueListenable: dayNotifier,
                          builder: (BuildContext context, int day, _) =>
                              DropdownButton(
                            isExpanded: true,
                            value: day,
                            onChanged: (int? newDay) {
                              dayNotifier.value = newDay!;
                              onChange();
                            },
                            items: List.generate(
                              31,
                              (index) => DropdownMenuItem(
                                value: index + 1,
                                child: Text(
                                  (index + 1).toString(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          buildToggleItem(
            onChanged: (bool selected) {
              monthTypeNotifier.value = selected ? 1 : 0;
            },
            title: textDelegate.byNthDayInMonth,
            value: monthType == 1,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: buildElement(
                        title: textDelegate.on,
                        child: buildDropdown(
                          child: ValueListenableBuilder(
                            valueListenable: monthDayNotifier,
                            builder:
                                (BuildContext context, int dayInMonth, _) =>
                                    DropdownButton(
                              isExpanded: true,
                              value: dayInMonth,
                              onChanged: (int? dayInMonth) {
                                monthDayNotifier.value = dayInMonth!;
                                onChange();
                              },
                              items: List.generate(
                                5,
                                (index) => DropdownMenuItem(
                                  value: index,
                                  child: Text(
                                    textDelegate.daysInMonth[index],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: buildElement(
                        title: textDelegate.day,
                        child: buildDropdown(
                          child: ValueListenableBuilder(
                            valueListenable: weekdayNotifier,
                            builder: (BuildContext context, int weekday, _) =>
                                DropdownButton(
                              isExpanded: true,
                              value: weekday,
                              onChanged: (int? newWeekday) {
                                weekdayNotifier.value = newWeekday!;
                                onChange();
                              },
                              items: List.generate(
                                7,
                                (index) => DropdownMenuItem(
                                  value: index,
                                  child: Text(
                                    textDelegate.weekdays[index].toString(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                buildElement(
                  title: textDelegate.of,
                  child: buildDropdown(
                    child: ValueListenableBuilder(
                      valueListenable: monthNotifier,
                      builder: (BuildContext context, int month, _) =>
                          DropdownButton(
                        isExpanded: true,
                        value: month,
                        onChanged: (int? newMonth) {
                          monthNotifier.value = newMonth!;
                          onChange();
                        },
                        items: List.generate(
                          12,
                          (index) => DropdownMenuItem(
                            value: index + 1,
                            child: Text(
                              textDelegate.allMonths[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
