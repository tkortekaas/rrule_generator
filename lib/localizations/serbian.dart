import 'package:rrule_generator/localizations/text_delegate.dart';

class SerbianRRuleTextDelegate implements RRuleTextDelegate {
  const SerbianRRuleTextDelegate();

  @override
  String get locale => 'sr';

  @override
  String get repeat => 'Понови';

  @override
  String get day => 'Дан';

  @override
  String get byDayInMonth => 'Понови';

  @override
  String get byNthDayInMonth => 'На сваки';

  @override
  String get every => 'Сваког';

  @override
  String get of => 'у';

  @override
  String get months => 'Месец(и)';

  @override
  String get weeks => 'Недеља/е';

  @override
  String get days => 'Дан(а)';

  @override
  String get date => 'Датум';

  @override
  String get on => '';

  @override
  String get instances => 'пут(а)';

  @override
  String get end => 'Край';

  @override
  String get neverEnds => 'Никад не завршава';

  @override
  String get endsAfter => 'Завршава после';

  @override
  String get endsOnDate => 'Завршава на датум';

  @override
  String get timeOfDay => 'Време у току дана';

  @override
  String get excludeDate => 'Искључи датум';

  @override
  List<String> get daysInMonth => [
    'Први',
    'Други',
    'Трећи',
    'Четврти',
    'Последњи'
  ];

  @override
  List<String> get periods => [
    'Годишње',
    'Месечно',
    'Недељно',
    'Дневно',
    'Никада'
  ];
}