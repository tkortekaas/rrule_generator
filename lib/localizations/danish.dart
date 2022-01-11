import 'package:rrule_generator/localizations/text_delegate.dart';

class DanishRRuleTextDelegate implements RRuleTextDelegate {
  const DanishRRuleTextDelegate();

  @override
  String get byDayInMonth => 'Per dag i Måneden';

  @override
  String get byNthDayInMonth => 'Efter en bestemt dag i Måneden';

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
  String get instances => 'gange';

  @override
  String get neverEnds => 'Slutter aldrig';

  @override
  String get endsAfter => 'Slutter efter';

  @override
  String get endsOnDate => 'Slutter på dato';

  @override
  List<String> get daysInMonth => [
        '1.',
        '2.',
        '3.',
        '4.',
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
