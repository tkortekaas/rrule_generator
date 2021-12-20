import 'package:rrule_generator/localizations/text_delegate.dart';

class TurkishRRuleTextDelegate implements RRuleTextDelegate {
  const TurkishRRuleTextDelegate();

  @override
  String get byDayInMonth => 'Ay içinde güne göre';

  @override
  String get byNthDayInMonth => 'Ayın n. gününe kadar';

  @override
  String get every => 'Her';

  @override
  String get of => ' ';

  @override
  String get months => 'Ay(lar)';

  @override
  String get weeks => 'Haftalar';

  @override
  String get days => 'Gün(ler)';

  @override
  String get instances => 'örnekler';

  @override
  String get neverEnds => 'Asla bitmez';

  @override
  String get endsAfter => 'Sonra biter';

  @override
  String get endsOnDate => 'Tarihte biter';

  @override
  List<String> get daysInMonth => [
    '1.',
    '2.',
    '3.',
    '4.',
    'Son',
  ];

  @override
  List<String> get allMonths => [
    'Ocak',
    'Februari',
    'Mart',
    'Nisan',
    'Mayıs',
    'Haziran',
    'Temmuz',
    'Ağustos',
    'Eylül',
    'Ekim',
    'Kasım',
    'Aralık',
  ];

  @override
  List<String> get weekdays => [
    'Pazartesi',
    'Salı',
    'Çarşamba',
    'Perşembe',
    'Cuma',
    'Cumartesi',
    'Pazar',
  ];

  @override
  List<String> get periods => [
    'Yıllık',
    'Aylık',
    'Haftalık',
    'Günlük',
  ];
}
