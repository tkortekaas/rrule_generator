import 'package:flutter/material.dart';
import 'package:rrule_generator/localizations/text_delegate.dart';
import 'package:rrule_generator/src/pickers/interval.dart';
import 'package:rrule_generator/src/periods/period.dart';
import 'package:rrule_generator/src/pickers/weekday.dart';

import '../pickers/helpers.dart';

class Weekly extends StatelessWidget implements Period {
  @override
  final RRuleTextDelegate textDelegate;
  @override
  final Function onChange;
  @override
  final String initialRRule;
  @override
  final DateTime initialDate;

  final intervalController = TextEditingController(text: '1');
  final weekdayNotifiers = List.generate(
    7,
    (index) => ValueNotifier(false),
  );

  Weekly(this.textDelegate, this.onChange, this.initialRRule, this.initialDate,
      {Key? key})
      : super(key: key) {
    if (initialRRule.contains('WEEKLY'))
      handleInitialRRule();
    else {
      weekdayNotifiers[initialDate.weekday - 1].value = true;
    }
  }

  @override
  void handleInitialRRule() {
    int intervalIndex = initialRRule.indexOf('INTERVAL=') + 9;
    int intervalEnd = initialRRule.indexOf(';', intervalIndex);
    String interval = initialRRule.substring(
        intervalIndex, intervalEnd == -1 ? initialRRule.length : intervalEnd);
    intervalController.text = interval;

    if (initialRRule.contains('BYDAY=')) {
      int weekdayIndex = initialRRule.indexOf('BYDAY=') + 6;
      int weekdayEnd = initialRRule.indexOf(';', weekdayIndex);
      String weekdays = initialRRule.substring(
          weekdayIndex, weekdayEnd == -1 ? initialRRule.length : weekdayEnd);
      for (int i = 0; i < 7; i++) {
        if (weekdays.contains(weekdaysShort[i])) {
          weekdayNotifiers[i].value = true;
        }
      }
    }
  }

  @override
  String getRRule() {
    int interval = int.tryParse(intervalController.text) ?? 0;
    List<String> weekdayList = [];
    for (int i = 0; i < 7; i++) {
      if (weekdayNotifiers[i].value) weekdayList.add(weekdaysShort[i]);
    }

    return weekdayList.isEmpty
        ? 'FREQ=WEEKLY;INTERVAL=${interval > 0 ? interval : 1}'
        : 'FREQ=WEEKLY;INTERVAL=${interval > 0 ? interval : 1};'
            'BYDAY=${weekdayList.join(",")}';
  }

  @override
  Widget build(BuildContext context) => buildContainer(
        child: buildElement(
          title: textDelegate.every,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: IntervalPicker(intervalController, onChange),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(textDelegate.weeks),
                  ),
                ],
              ),
              WeekdayPicker(weekdayNotifiers, textDelegate, onChange),
            ],
          ),
        ),
      );
}
