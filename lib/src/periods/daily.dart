import 'package:flutter/material.dart';
import 'package:rrule_generator/localizations/text_delegate.dart';
import 'package:rrule_generator/src/pickers/helpers.dart';
import 'package:rrule_generator/src/pickers/interval.dart';
import 'package:rrule_generator/src/periods/period.dart';

import '../rrule_generator_config.dart';

class Daily extends StatelessWidget implements Period {
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

  final intervalController = TextEditingController(text: '1');

  Daily(this.config, this.textDelegate, this.onChange, this.initialRRule,
      this.initialDate,
      {Key? key})
      : super(key: key) {
    if (initialRRule.contains('DAILY')) handleInitialRRule();
  }

  @override
  void handleInitialRRule() {
    if (initialRRule.contains('INTERVAL=')) {
      final intervalIndex = initialRRule.indexOf('INTERVAL=') + 9;
      int intervalEnd = initialRRule.indexOf(';', intervalIndex);
      intervalEnd = intervalEnd == -1 ? initialRRule.length : intervalEnd;
      final interval = initialRRule.substring(
          intervalIndex, intervalEnd == -1 ? initialRRule.length : intervalEnd);
      intervalController.text = interval;
    }
  }

  @override
  String getRRule() {
    final interval = int.tryParse(intervalController.text) ?? 0;
    return 'FREQ=DAILY;INTERVAL=${interval > 0 ? interval : 1}';
  }

  @override
  Widget build(BuildContext context) => buildContainer(
        child: buildElement(
          title: textDelegate.every,
          style: config.textStyle,
          child: Row(
            children: [
              Expanded(
                  child: IntervalPicker(
                intervalController,
                onChange,
                config: config,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(textDelegate.days),
              ),
            ],
          ),
        ),
      );
}
