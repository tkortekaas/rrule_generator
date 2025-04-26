import 'package:rrule_generator/localizations/text_delegate.dart';

class GermanRRuleTextDelegate implements RRuleTextDelegate {
  const GermanRRuleTextDelegate();

  @override
  String get locale => 'de';

  @override
  String get repeat => 'Wiederhole';

  @override
  String get day => 'Tag';

  @override
  String get byDayInMonth => 'Tag im Monat';

  @override
  String get byNthDayInMonth => 'Wiederhole immer am';

  @override
  String get every => 'Alle';

  @override
  String get of => 'im';

  @override
  String get months => 'Monate';

  @override
  String get weeks => 'Wochen';

  @override
  String get days => 'Tage';

  @override
  String get date => 'Date';

  @override
  String get on => 'Am';

  @override
  String get instances => 'Wiederholungen';

  @override
  String get end => 'Ende';

  @override
  String get neverEnds => 'Endet nicht';

  @override
  String get endsAfter => 'Endet nach';

  @override
  String get endsOnDate => 'Endet am';

  @override
  String get timeOfDay => 'Tageszeit';

  @override
  String get excludeDate => 'Datum ausschließen';

  @override
  List<String> get daysInMonth => [
        'Ersten',
        'Zweiten',
        'Dritten',
        'Vierten',
        'Letzten',
      ];

  @override
  List<String> get periods => [
        'Jährlich',
        'Monatlich',
        'Wöchentlich',
        'Täglich',
        'Keine Wiederholung',
      ];
}
