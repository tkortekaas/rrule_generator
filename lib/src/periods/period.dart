import 'package:flutter/material.dart';
import 'package:rrule_generator/localizations/text_delegate.dart';

import '../rrule_generator_config.dart';

final weekdaysShort = [
  'MO',
  'TU',
  'WE',
  'TH',
  'FR',
  'SA',
  'SU',
];

abstract class Period extends Widget {
  final RRuleGeneratorConfig config;
  final RRuleTextDelegate textDelegate;
  final void Function() onChange;
  final String initialRRule;
  final DateTime initialDate;

  const Period(this.config, this.textDelegate, this.onChange, this.initialRRule,
      this.initialDate,
      {super.key});

  String getRRule() => throw UnimplementedError();

  void handleInitialRRule() => throw UnimplementedError();

  @override
  Element createElement() => throw UnimplementedError();
}
