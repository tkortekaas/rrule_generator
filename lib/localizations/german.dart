import 'package:rrule_generator/localizations/text_delegate.dart';

class GermanRRuleTextDelegate implements RRuleTextDelegate {
  const GermanRRuleTextDelegate();

  @override
  String get byDayInMonth => 'Pro Tag im Monat';

  @override
  String get byNthDayInMonth => 'Pro bestimmten Tag im Monat';

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
  String get instances => 'mal(s)';

  @override
  String get neverEnds => 'Endet nicht';

  @override
  String get endsAfter => 'Endet nach';

  @override
  String get endsOnDate => 'Ended am Datum';

  @override
  List<String> get daysInMonth => [
        '1.',
        '2.',
        '3.',
        '4.',
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
