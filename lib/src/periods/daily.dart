import 'package:flutter/material.dart';
import 'package:rrule_generator/localizations/text_delegate.dart';
import 'package:rrule_generator/src/pickers/helpers.dart';
import 'package:rrule_generator/src/pickers/interval.dart';
import 'package:rrule_generator/src/periods/period.dart';

class Daily extends StatelessWidget implements Period {
  @override
  final RRuleTextDelegate textDelegate;
  @override
  final Function onChange;
  @override
  final String initialRRule;
  @override
  final DateTime initialDate;

  final intervalController = TextEditingController(text: '1');

  Daily(this.textDelegate, this.onChange, this.initialRRule, this.initialDate,
      {Key? key})
      : super(key: key) {
    if (initialRRule.contains('DAILY')) handleInitialRRule();
  }

  @override
  void handleInitialRRule() {
    int intervalIndex = initialRRule.indexOf('INTERVAL=') + 9;
    int intervalEnd = initialRRule.indexOf(';', intervalIndex);
    String interval = initialRRule.substring(
        intervalIndex, intervalEnd == -1 ? initialRRule.length : intervalEnd);
    intervalController.text = interval;
  }

  @override
  String getRRule() {
    int interval = int.tryParse(intervalController.text) ?? 0;
    return 'FREQ=DAILY;INTERVAL=${interval > 0 ? interval : 1}';
  }

  @override
  Widget build(BuildContext context) => buildContainer(
    child: buildElement(
          title: textDelegate.every,
          child: Row(
            children: [
              Expanded(child: IntervalPicker(intervalController, onChange)),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(textDelegate.days),
              ),
            ],
          ),
        ),
  );
}
