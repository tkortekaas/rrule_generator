import 'package:rrule_generator/localizations/text_delegate.dart';

class AlbanianRRuleTextDelegate implements RRuleTextDelegate {
  const AlbanianRRuleTextDelegate();

  @override
  String get locale => 'sq';

  @override
  String get repeat => 'Përsërit';

  @override
  String get day => 'Ditë';

  @override
  String get byDayInMonth => 'Përsërit';

  @override
  String get byNthDayInMonth => 'Në çdo ditë të muajit';

  @override
  String get every => 'Çdo';

  @override
  String get of => 'në';

  @override
  String get months => 'Muaj(ë)';

  @override
  String get weeks => 'Javë(ë)';

  @override
  String get days => 'Ditë(ë)';

  @override
  String get date => 'Datë';

  @override
  String get on => '';

  @override
  String get instances => 'raste';

  @override
  String get end => 'Mbarim';

  @override
  String get neverEnds => 'Asnjëherë nuk përfundon';

  @override
  String get endsAfter => 'Mbaron pas';

  @override
  String get endsOnDate => 'Mbaron në datë';

  @override
  String get timeOfDay => 'Koha e ditës';

  @override
  String get excludeDate => 'Përjashto datën';

  @override
  List<String> get daysInMonth => [
    'pare',
    'dytë',
    'tretë',
    'katërt',
    'fundit',
  ];

  @override
  List<String> get periods => [
    'Vjetor',
    'Mujor',
    'Javor',
    'Ditor',
    'Kurrë',
  ];
}