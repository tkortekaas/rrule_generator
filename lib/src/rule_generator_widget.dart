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
      {this.textDelegate = const EnglishRRuleTextDelegate(),
      this.onChange,
      this.initialRRule = ''}) {
    periodWidgets.addAll([
      Yearly(textDelegate, valueChanged, initialRRule),
      Monthly(textDelegate, valueChanged, initialRRule),
      Weekly(textDelegate, valueChanged, initialRRule),
      Daily(textDelegate, valueChanged, initialRRule)
    ]);

    if (initialRRule != '') handleInitialRRule();
  }

  void handleInitialRRule() {
    if (initialRRule.contains('MONTHLY'))
      frequencyNotifier.value = 1;
    else if (initialRRule.contains('WEEKLY'))
      frequencyNotifier.value = 2;
    else if (initialRRule.contains('DAILY')) frequencyNotifier.value = 3;

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
      int day = int.parse(initialRRule.substring(dateIndex + 6, dateIndex + 8));

      pickedDateNotifier.value = DateTime(year, month, day);
    }
  }

  void valueChanged() {
    if (onChange != null) onChange!(getRRule());
  }

  String getRRule() {
    if (countTypeNotifier.value == 0)
      return periodWidgets[frequencyNotifier.value].getRRule();
    else if (countTypeNotifier.value == 1)
      return periodWidgets[frequencyNotifier.value].getRRule() +
          ';COUNT=${instancesController.text}';
    DateTime pickedDate = pickedDateNotifier.value;
    return periodWidgets[frequencyNotifier.value].getRRule() +
        ';UNTIL=${pickedDate.year}${pickedDate.month}${pickedDate.day}';
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
                4,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(
                    textDelegate.periods[index],
                  ),
                ),
              ),
            ),
            periodWidgets[period],
            ValueListenableBuilder(
              valueListenable: countTypeNotifier,
              builder: (BuildContext context, int countType, Widget? child) =>
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
            ValueListenableBuilder(
              valueListenable: countTypeNotifier,
              builder: (BuildContext context, int countType, Widget? child) {
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
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                          );

                          if (picked != null && picked != pickedDate)
                            pickedDateNotifier.value = picked;
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
