import 'package:rrule_generator/localizations/text_delegate.dart';

class NorwegianRRuleTextDelegate implements RRuleTextDelegate {
  const NorwegianRRuleTextDelegate();

  @override
  String get locale => 'no';

  @override
  String get repeat => 'Gjenta';

  @override
  String get day => 'Dag';

  @override
  String get byDayInMonth => 'Gjenta på';

  @override
  String get byNthDayInMonth => 'Gjenta på den';

  @override
  String get every => 'Hver';

  @override
  String get of => 'av';

  @override
  String get months => 'Måned(er)';

  @override
  String get weeks => 'Uke(r)';

  @override
  String get days => 'Dag(er)';

  @override
  String get date => 'Dato';

  @override
  String get on => 'På';

  @override
  String get instances => 'instans(er)';

  @override
  String get end => 'Slutt';

  @override
  String get neverEnds => 'Tar aldri slutt';

  @override
  String get endsAfter => 'Slutter etter';

  @override
  String get endsOnDate => 'Avsluttes';

  @override
  String get excludeDate => 'Ekskluder dato';

  @override
  List<String> get daysInMonth => [
        'Først',
        'Sekund',
        'Tredje',
        'Fjerde',
        'Siste',
      ];

  @override
  List<String> get periods => [
        'Årlig',
        'Månedlig',
        'Ukentlig',
        'Daglig',
        'Aldri',
      ];
}
