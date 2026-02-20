import 'package:rrule_generator/localizations/text_delegate.dart';

class RomanianRRuleTextDelegate implements RRuleTextDelegate {
  const RomanianRRuleTextDelegate();

  @override
  String get locale => 'ro';

  @override
  String get repeat => 'Repetă';

  @override
  String get day => 'Zi';

  @override
  String get byDayInMonth => 'Repetă în';

  @override
  String get byNthDayInMonth => 'Repetă în';

  @override
  String get every => 'Fiecare';

  @override
  String get of => 'din';

  @override
  String get months => 'Lună(e)';

  @override
  String get month => 'Lună';

  @override
  String get weeks => 'Săptămână(i)';

  @override
  String get days => 'Zi(e)';

  @override
  String get date => 'Dată';

  @override
  String get on => 'pe';

  @override
  String get instances => 'instanță(e)';

  @override
  String get end => 'Sfârșit';

  @override
  String get neverEnds => 'Nu se termină niciodată';

  @override
  String get endsAfter => 'Se termină după';

  @override
  String get endsOnDate => 'Se termină pe';

  @override
  String get excludeDate => 'Exclude data';

  @override
  List<String> get daysInMonth => [
        'Primul',
        'Al doilea',
        'Al treilea',
        'Al patrulea',
        'Ultimul',
      ];

  @override
  List<String> get periods => [
        'Anual',
        'Lunar',
        'Săptămânal',
        'Zilnic',
        'Niciodată',
      ];
}
