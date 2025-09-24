import 'package:rrule_generator/localizations/text_delegate.dart';

class SlovakRRuleTextDelegate implements RRuleTextDelegate {
  const SlovakRRuleTextDelegate();

  @override
  String get locale => 'sk';

  @override
  String get repeat => 'Opakovať';

  @override
  String get day => 'Deň';

  @override
  String get byDayInMonth => 'Opakovať';

  @override
  String get byNthDayInMonth => 'Opakovať v';

  @override
  String get every => 'Každý';

  @override
  String get of => 'z';

  @override
  String get months => 'Mesiac(e)';

  @override
  String get month => 'Mesiac';

  @override
  String get weeks => 'Týždeň(y)';

  @override
  String get days => 'Deň(y)';

  @override
  String get date => 'Dátum';

  @override
  String get on => 'Dňa';

  @override
  String get instances => 'prípad(y)';

  @override
  String get end => 'Koniec';

  @override
  String get neverEnds => 'Nikdy nekončí';

  @override
  String get endsAfter => 'Končí po';

  @override
  String get endsOnDate => 'Končí dňa';

  @override
  String get excludeDate => 'Vylúčiť dátum';

  @override
  List<String> get daysInMonth => [
        'Prvý',
        'Druhý',
        'Tretí',
        'Štvrtý',
        'Posledný',
      ];

  @override
  List<String> get periods => [
        'Ročne',
        'Mesačne',
        'Týždenne',
        'Denne',
        'Nikdy',
      ];
}
