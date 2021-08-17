import 'package:flutter/material.dart';
import 'package:rrule_generator/localizations/text_delegate.dart';
import 'package:rrule_generator/src/periods/period.dart';

class Yearly extends StatelessWidget implements Period {
  final RRuleTextDelegate textDelegate;
  final Function onChange;
  final String initialRRule;

  final monthTypeNotifier = ValueNotifier(0);
  final monthDayNotifier = ValueNotifier(1);
  final weekdayNotifier = ValueNotifier(0);
  final monthNotifier = ValueNotifier(1);
  final dayNotifier = ValueNotifier(1);

  Yearly(this.textDelegate, this.onChange, this.initialRRule) {
    if (initialRRule.contains('YEARLY')) handleInitialRRule();
  }

  void handleInitialRRule() {
    if (initialRRule.contains('BYMONTHDAY')) {
      monthTypeNotifier.value = 0;
      int dayIndex = initialRRule.indexOf('BYMONTHDAY=') + 11;
      String day = initialRRule.substring(
          dayIndex, dayIndex + (initialRRule.length > dayIndex + 1 ? 2 : 1));
      if (day.length == 1 || day[1] != ';')
        dayNotifier.value = int.parse(day);
      else
        dayNotifier.value = int.parse(day[0]);
    } else {
      monthTypeNotifier.value = 1;

      int monthDayIndex = initialRRule.indexOf('BYSETPOS=') + 9;
      String monthDay =
          initialRRule.substring(monthDayIndex, monthDayIndex + 1);

      if (monthDay == '-')
        monthDayNotifier.value = 4;
      else
        monthDayNotifier.value = int.parse(monthDay) - 1;

      int weekdayIndex = initialRRule.indexOf('BYDAY=') + 6;
      String weekday = initialRRule.substring(weekdayIndex, weekdayIndex + 2);

      weekdayNotifier.value = weekdaysShort.indexOf(weekday);
    }

    int monthIndex = initialRRule.indexOf('BYMONTH=') + 8;
    String month = initialRRule.substring(monthIndex,
        monthIndex + (initialRRule.length > monthIndex + 1 ? 2 : 1));
    if (month.length == 1 || month[1] != ';') {
      monthNotifier.value = int.parse(month);
    } else {
      monthNotifier.value = int.parse(month[0]);
    }
  }

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
          DropdownButton(
            value: monthType,
            onChanged: (int? newMonthType) {
              monthTypeNotifier.value = newMonthType!;
              onChange();
            },
            items: [
              DropdownMenuItem(
                value: 0,
                child: Text(textDelegate.byDayInMonth),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text(textDelegate.byNthDayInMonth),
              ),
            ],
          )
        ]..addAll(
            monthType == 0
                ? [
                    ValueListenableBuilder(
                      valueListenable: monthNotifier,
                      builder: (BuildContext context, int month, _) =>
                          DropdownButton(
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
                    ValueListenableBuilder(
                      valueListenable: dayNotifier,
                      builder: (BuildContext context, int day, _) =>
                          DropdownButton(
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
                  ]
                : [
                    ValueListenableBuilder(
                      valueListenable: monthDayNotifier,
                      builder: (BuildContext context, int dayInMonth, _) =>
                          DropdownButton(
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
                    ValueListenableBuilder(
                      valueListenable: weekdayNotifier,
                      builder: (BuildContext context, int weekday, _) =>
                          DropdownButton(
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
                    Text(textDelegate.of),
                    ValueListenableBuilder(
                      valueListenable: monthNotifier,
                      builder: (BuildContext context, int month, _) =>
                          DropdownButton(
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
                  ],
          ),
      ),
    );
  }
}
