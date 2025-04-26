import 'package:rrule_generator/localizations/text_delegate.dart';

class DutchRRuleTextDelegate implements RRuleTextDelegate {
  const DutchRRuleTextDelegate();

  @override
  String get locale => 'nl';

  @override
  String get repeat => 'Herhaal';

  @override
  String get day => 'Dag';

  @override
  String get byDayInMonth => 'Herhaal op';

  @override
  String get byNthDayInMonth => 'Herhaal op de';

  @override
  String get every => 'Elke';

  @override
  String get of => 'van';

  @override
  String get months => 'Maand(en)';

  @override
  String get weeks => 'Weken';

  @override
  String get days => 'Dag(en)';

  @override
  String get date => 'Datum';

  @override
  String get on => 'Op';

  @override
  String get instances => 'keren';

  @override
  String get end => 'Einde';

  @override
  String get neverEnds => 'Eindigt nooit';

  @override
  String get endsAfter => 'Eindigt na';

  @override
  String get endsOnDate => 'Herhaal t/m';

  @override
  String get timeOfDay => 'Tijd van de dag';

  @override
  String get excludeDate => 'Sluit datum uit';

  @override
  List<String> get daysInMonth => [
        'Eerste',
        'Tweede',
        'Derde',
        'Vierde',
        'Laatste',
      ];

  @override
  List<String> get periods => [
        'Jaarlijks',
        'Maandelijks',
        'Wekelijks',
        'Dagelijks',
        'Nooit',
      ];
}
