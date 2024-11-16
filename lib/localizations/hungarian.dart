import 'package:rrule_generator/localizations/text_delegate.dart';

class HungarianRRuleTextDelegate implements RRuleTextDelegate {
  const HungarianRRuleTextDelegate();

  @override
  String get locale => 'hu';

  @override
  String get repeat => 'Ismétlés';

  @override
  String get day => 'Nap';

  @override
  String get byDayInMonth => 'Ismételje meg';

  @override
  String get byNthDayInMonth => 'Ismételje meg a';

  @override
  String get every => 'Minden';

  @override
  String get of => 'a';

  @override
  String get months => 'Hónap(ok)';

  @override
  String get weeks => 'Puhítani';

  @override
  String get days => 'Hajnalra';

  @override
  String get date => 'Dátum';

  @override
  String get on => 'a';

  @override
  String get instances => 'alkalommal';

  @override
  String get end => 'Vége';

  @override
  String get neverEnds => 'Soha nem ér véget';

  @override
  String get endsAfter => 'Után véget ért';

  @override
  String get endsOnDate => 'A dátumon véget ért';

  @override
  String get excludeDate => 'Kizárja a dátumot';

  @override
  List<String> get daysInMonth => [
        'Első',
        'Második',
        'Harmadik',
        'Negyedik',
        'Utolsó',
      ];

  @override
  List<String> get periods => [
        'Évi',
        'Havi',
        'Heti',
        'Napi',
        'Soha',
      ];
}
