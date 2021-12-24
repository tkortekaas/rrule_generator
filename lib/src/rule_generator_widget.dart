import 'package:flutter/material.dart';
import 'package:rrule_generator/localizations/english.dart';
import 'package:rrule_generator/localizations/text_delegate.dart';
import 'package:rrule_generator/src/periods/period.dart';
import 'package:rrule_generator/src/periods/pickers/interval.dart';
import 'package:rrule_generator/src/periods/yearly.dart';
import 'package:rrule_generator/src/periods/monthly.dart';
import 'package:rrule_generator/src/periods/weekly.dart';
import 'package:rrule_generator/src/periods/daily.dart';
import 'package:intl/intl.dart';

class RRuleGenerator extends StatelessWidget {
  final RRuleTextDelegate textDelegate;
  final Function(String newValue)? onChange;
  final String initialRRule;

  final frequencyNotifier = ValueNotifier(0);
  final countTypeNotifier = ValueNotifier(0);
  final pickedDateNotifier = ValueNotifier(DateTime.now());
  final instancesController = TextEditingController(text: '1');
  final List<Period> periodWidgets = [];

  RRuleGenerator(
      {Key? key,
      this.textDelegate = const EnglishRRuleTextDelegate(),
      this.onChange,
      this.initialRRule = ''})
      : super(key: key) {
    periodWidgets.addAll([
      Yearly(textDelegate, valueChanged, initialRRule),
      Monthly(textDelegate, valueChanged, initialRRule),
      Weekly(textDelegate, valueChanged, initialRRule),
      Daily(textDelegate, valueChanged, initialRRule)
    ]);

    handleInitialRRule();
  }

  void handleInitialRRule() {
    if (initialRRule.contains('MONTHLY')) {
      frequencyNotifier.value = 1;
    } else if (initialRRule.contains('WEEKLY')) {
      frequencyNotifier.value = 2;
    } else if (initialRRule.contains('DAILY')) {
      frequencyNotifier.value = 3;
    } else if (initialRRule == '') {
      frequencyNotifier.value = 4;
    }

    if (initialRRule.contains('COUNT')) {
      countTypeNotifier.value = 1;
      instancesController.text = initialRRule.substring(
          initialRRule.indexOf('COUNT=') + 6, initialRRule.length);
    } else if (initialRRule.contains('UNTIL')) {
      countTypeNotifier.value = 2;
      int dateIndex = initialRRule.indexOf('UNTIL=') + 6;
      int year = int.parse(initialRRule.substring(dateIndex, dateIndex + 4));
      int month =
          int.parse(initialRRule.substring(dateIndex + 4, dateIndex + 6));
      int day =
          int.parse(initialRRule.substring(dateIndex + 6, initialRRule.length));

      pickedDateNotifier.value = DateTime(year, month, day);
    }
  }

  void valueChanged() {
    Function(String newValue)? fun = onChange;
    if (fun != null) fun(getRRule());
  }

  String getRRule() {
    if (frequencyNotifier.value == 4)  {
      return '';
    }

    if (countTypeNotifier.value == 0) {
      return 'RRULE:' + periodWidgets[frequencyNotifier.value].getRRule();
    } else if (countTypeNotifier.value == 1) {
      return 'RRULE:' +
          periodWidgets[frequencyNotifier.value].getRRule() +
          ';COUNT=${instancesController.text}';
    }
    DateTime pickedDate = pickedDateNotifier.value;

    String day =
        pickedDate.day > 9 ? '${pickedDate.day}' : '0${pickedDate.day}';
    String month =
        pickedDate.month > 9 ? '${pickedDate.month}' : '0${pickedDate.month}';

    return 'RRULE:' +
        periodWidgets[frequencyNotifier.value].getRRule() +
        ';UNTIL=${pickedDate.year}$month$day';
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: frequencyNotifier,
        builder: (BuildContext context, int period, Widget? child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: period,
              onChanged: (int? newPeriod) {
                frequencyNotifier.value = newPeriod!;
                valueChanged();
              },
              items: List.generate(
                5,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(
                    textDelegate.periods[index],
                  ),
                ),
              ),
            ),
            period == 4 ? Container() : periodWidgets[period],
            period == 4
                ? Container()
                : ValueListenableBuilder(
                    valueListenable: countTypeNotifier,
                    builder:
                        (BuildContext context, int countType, Widget? child) =>
                            DropdownButton(
                      value: countType,
                      onChanged: (int? newCountType) {
                        countTypeNotifier.value = newCountType!;
                        valueChanged();
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text(textDelegate.neverEnds),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text(textDelegate.endsAfter),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text(textDelegate.endsOnDate),
                          value: 2,
                        ),
                      ],
                    ),
                  ),
            period == 4
                ? Container()
                : ValueListenableBuilder(
                    valueListenable: countTypeNotifier,
                    builder:
                        (BuildContext context, int countType, Widget? child) {
                      switch (countType) {
                        case 1:
                          return Column(
                            children: [
                              IntervalPicker(instancesController, valueChanged),
                              Text(textDelegate.instances)
                            ],
                          );
                        case 2:
                          return ValueListenableBuilder(
                            valueListenable: pickedDateNotifier,
                            builder: (BuildContext context, DateTime pickedDate,
                                    Widget? child) =>
                                ElevatedButton(
                              onPressed: () async {
                                DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: pickedDate,
                                  firstDate:
                                      DateTime.fromMillisecondsSinceEpoch(0),
                                  lastDate: DateTime(2025),
                                );

                                if (picked != null && picked != pickedDate) {
                                  pickedDateNotifier.value = picked;
                                  valueChanged();
                                }
                              },
                              child: Text(
                                DateFormat.yMd(Intl.getCurrentLocale()).format(
                                  pickedDate,
                                ),
                              ),
                            ),
                          );
                        default:
                          return Container();
                      }
                    },
                  )
          ],
        ),
      );
}
