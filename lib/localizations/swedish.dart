import 'package:rrule_generator/localizations/text_delegate.dart';

class SwedishRRuleTextDelegate implements RRuleTextDelegate {
  const SwedishRRuleTextDelegate();

  @override
  String get locale => 'sv';

  @override
  String get repeat => 'Upprepa';

  @override
  String get day => 'Dag';

  @override
  String get byDayInMonth => 'Upprepa';

  @override
  String get byNthDayInMonth => 'Upprepa';

  @override
  String get every => 'Varje';

  @override
  String get of => 'av';

  @override
  String get months => 'Månader';

  @override
  String get weeks => 'Veckor';

  @override
  String get days => 'Dagar';

  @override
  String get date => 'Datum';

  @override
  String get on => 'på';

  @override
  String get instances => 'gånger';

  @override
  String get end => 'Slutet';

  @override
  String get neverEnds => 'Slutar aldrig';

  @override
  String get endsAfter => 'Slutar efter';

  @override
  String get endsOnDate => 'Slutar på datum';

  @override
  String get excludeDate => 'Exkludera datum';

  @override
  List<String> get daysInMonth => [
        'Första',
        'Andra',
        'Tredje',
        'Fjärde',
        'Sista',
      ];

  @override
  List<String> get periods => [
        'Årligen',
        'Månadsvis',
        'Veckovis',
        'Dagligen',
        'Aldrig',
      ];
}
