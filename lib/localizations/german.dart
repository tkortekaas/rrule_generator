import 'package:rrule_generator/localizations/text_delegate.dart';

class GermanRRuleTextDelegate implements RRuleTextDelegate {
  const GermanRRuleTextDelegate();

  @override
  String get repeat => 'Wiederhole';

  @override
  String get day => 'Tag';

  @override
  String get byDayInMonth => 'Wiederhole am';

  @override
  String get byNthDayInMonth => 'Wiederhole am der';

  @override
  String get every => 'Jeden';

  @override
  String get of => 'im';

  @override
  String get months => 'Monat(e)';

  @override
  String get weeks => 'Woche(n)';

  @override
  String get days => 'Tage(n)';

  @override
  String get date => 'Date';

  @override
  String get on => 'Am';

  @override
  String get instances => 'mal(s)';

  @override
  String get end => 'Ende';

  @override
  String get neverEnds => 'Endet nicht';

  @override
  String get endsAfter => 'Endet nach';

  @override
  String get endsOnDate => 'Ended am Datum';

  @override
  List<String> get daysInMonth => [
        'Erste',
        'Zweite',
        'Dritte',
        'Vierte',
        'Letzten  ',
      ];

  @override
  List<String> get allMonths => [
        'Januar',
        'Februar',
        'März',
        'April',
        'Mai',
        'Juni',
        'Juli',
        'August',
        'September',
        'Oktober',
        'November',
        'Dezember',
      ];

  @override
  List<String> get weekdays => [
        'Montag',
        'Dienstag',
        'Mittwoch',
        'Donnerstag',
        'Freitag',
        'Samstag',
        'Sonntag',
      ];

  @override
  List<String> get periods => [
        'Jährlich',
        'Montlich',
        'Wöchentlich',
        'Täglich',
        'Keine Wiederholung',
      ];
}
