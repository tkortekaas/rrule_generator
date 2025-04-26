import 'package:rrule_generator/localizations/text_delegate.dart';

class LatvianRRuleTextDelegate implements RRuleTextDelegate {
  const LatvianRRuleTextDelegate();

  @override
  String get locale => 'lv';

  @override
  String get repeat => 'Atkārtot';

  @override
  String get day => 'Diena';

  @override
  String get byDayInMonth => 'Atkārtot mēnesī';

  @override
  String get byNthDayInMonth => 'Atkārtot mēneša dienā';

  @override
  String get every => 'Katru';

  @override
  String get of => '';

  @override
  String get months => 'Mēnešus';

  @override
  String get weeks => 'Nedēļas';

  @override
  String get days => 'Dienas';

  @override
  String get date => 'Datums';

  @override
  String get on => 'Katru';

  @override
  String get instances => 'Reizes';

  @override
  String get end => 'Beigas';

  @override
  String get neverEnds => 'Nekad nebeidzas';

  @override
  String get endsAfter => 'Beidzas pēc';

  @override
  String get endsOnDate => 'Beidzas datā';

  @override
  String get timeOfDay => 'Dienas laiks';

  @override
  String get excludeDate => 'Izslēgt datumu';

  @override
  List<String> get daysInMonth => [
        'Pirmkārt',
        'Otrkārt',
        'Treškārt',
        'Ceturtkārt',
        'Pēdējais',
      ];

  @override
  List<String> get periods => [
        'Ik gadu',
        'Ikmēneša',
        'Iknedēļas',
        'Ikdienas',
        'Nekad',
      ];
}
