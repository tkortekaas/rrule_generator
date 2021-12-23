import 'package:rrule_generator/localizations/text_delegate.dart';

class DutchRRuleTextDelegate implements RRuleTextDelegate {
  const DutchRRuleTextDelegate();

  @override
  String get byDayInMonth => 'Per dag in Maand';

  @override
  String get byNthDayInMonth => 'Per nde dag in Maand';

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
  String get instances => 'keren';

  @override
  String get neverEnds => 'Eindigt nooit';

  @override
  String get endsAfter => 'Eindigt na';

  @override
  String get endsOnDate => 'Eindigt op datum';

  @override
  List<String> get daysInMonth => [
        '1ste',
        '2de',
        '3de',
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
        'Nooit',
      ];
}
