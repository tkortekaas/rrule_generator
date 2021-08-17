import 'package:flutter/material.dart';
import 'package:rrule_generator/localizations/text_delegate.dart';
import 'package:rrule_generator/src/periods/period.dart';

class Yearly extends StatelessWidget implements Period {
  final RRuleTextDelegate textDelegate;
  final Function onChange;

  final monthTypeNotifier = ValueNotifier(0);
  final monthDayNotifier = ValueNotifier(1);
  final weekdayNotifier = ValueNotifier(0);
  final monthNotifier = ValueNotifier(0);
  final dayNotifier = ValueNotifier(1);

  Yearly(this.textDelegate, this.onChange);

  String getRRule() {
    if (monthTypeNotifier.value == 0) {
      int byMonth = monthNotifier.value + 1;
      int byMonthDay = dayNotifier.value;
      return 'FREQ=YEARLY;BYMONTH=$byMonth;BYMONTHDAY=$byMonthDay';
    } else {
      int byMonth = monthNotifier.value + 1;
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
                            value: index,
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
                            value: index,
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
                            value: index,
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
