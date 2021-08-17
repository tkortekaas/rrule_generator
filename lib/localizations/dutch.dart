import 'package:rrule_generator/localizations/text_delegate.dart';

class DutchRRuleTextDelegate implements RRuleTextDelegate {
  const DutchRRuleTextDelegate();

  String get byDayInMonth => 'Per dag in Maand';

  String get byNthDayInMonth => 'Per nde dag in Maand';

  String get every => 'Elke';

  String get of => 'van';

  String get months => 'Maand(en)';

  String get weeks => 'Weken';

  String get days => 'Dag(en)';

  String get instances => 'keren';

  String get neverEnds => 'Eindigt nooit';

  String get endsAfter => 'Eindigt na';

  String get endsOnDate => 'Eindigt op datum';

  @override
  List<String> get daysInMonth => [
        '1e',
        '2e',
        '3e',
        '4e',
        'Laatste',
      ];

  @override
  List<String> get allMonths => [
        'Januari',
        'Februari',
        'Maart',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Augustus',
        'September',
        'Oktober',
        'November',
        'December',
      ];

  @override
  List<String> get weekdays => [
        'Maandag',
        'Dinsdag',
        'Woensdag',
        'Donderdag',
        'Vrijdag',
        'Zaterdag',
        'Zondag',
      ];

  @override
  List<String> get periods => [
        'Jaarlijks',
        'Maandelijks',
        'Wekelijks',
        'Dagelijks',
      ];
}
