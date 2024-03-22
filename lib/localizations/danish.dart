import 'package:rrule_generator/localizations/text_delegate.dart';

class DanishRRuleTextDelegate implements RRuleTextDelegate {
  const DanishRRuleTextDelegate();

  @override
  String get repeat => 'Gentage';

  @override
  String get day => 'Ден';

  @override
  String get byDayInMonth => 'Gentag videre';

  @override
  String get byNthDayInMonth => 'Gentag på';

  @override
  String get every => 'Hver';

  @override
  String get of => 'i';

  @override
  String get months => 'Måned(er)';

  @override
  String get weeks => 'Uge(r)';

  @override
  String get days => 'Dag(e)';

  @override
  String get date => 'Dato';

  @override
  String get on => 'Den';

  @override
  String get instances => 'gange';

  @override
  String get end => 'Ende';

  @override
  String get neverEnds => 'Slutter aldrig';

  @override
  String get endsAfter => 'Slutter efter';

  @override
  String get endsOnDate => 'Slutter på dato';

  @override
  String get excludeDate => 'Ekskluder dato';

  @override
  List<String> get daysInMonth => [
        'Først',
        'Anden',
        'Tredje',
        'Fjerde',
        'Sidste',
      ];

  @override
  List<String> get allMonths => [
        'Januar',
        'Februar',
        'Marts',
        'April',
        'Kan',
        'Juni',
        'Juli',
        'August',
        'September',
        'Oktober',
        'November',
        'December',
      ];

  @override
  List<String> get weekdays => [
        'Mandag',
        'Tirsdag',
        'Onsdag',
        'Torsdag',
        'Fredag',
        'Lørdag',
        'Søndag',
      ];

  @override
  List<String> get periods => [
        'Årligt',
        'Månedlige',
        'Ugentlig',
        'Daglige',
        'Aldrig',
      ];
}
