import 'package:rrule_generator/localizations/text_delegate.dart';

class EstonianRRuleTextDelegate implements RRuleTextDelegate {
  const EstonianRRuleTextDelegate();

  @override
  String get repeat => 'Korda';

  @override
  String get day => 'Päeval';

  @override
  String get byDayInMonth => 'Korda';

  @override
  String get byNthDayInMonth => 'Korrake';

  @override
  String get every => 'Iga';

  @override
  String get of => '-';

  @override
  String get months => 'Kuud';

  @override
  String get weeks => 'Nädalad';

  @override
  String get days => 'Päevadel';

  @override
  String get date => 'Kuupäev';

  @override
  String get on => '';

  @override
  String get instances => 'korda';

  @override
  String get end => 'Lõpp';

  @override
  String get neverEnds => 'Ei lõppe kunagi';

  @override
  String get endsAfter => 'Lõpeb pärast';

  @override
  String get endsOnDate => 'Lõpeb kindlal päeval';

  @override
  String get excludeDate => 'Välja arvatud kuupäev';

  @override
  List<String> get daysInMonth => [
        'Esimene',
        'Teine',
        'Kolmas',
        'Neljas',
        'Viimane',
      ];

  @override
  List<String> get allMonths => [
        'Jaanuar',
        'Veebruar',
        'Märts',
        'Aprill',
        'Mai',
        'Juuni',
        'Juuli',
        'August',
        'Septembril',
        'Oktoober',
        'Novembril',
        'Detsember',
      ];

  @override
  List<String> get weekdays => [
        'Esmaspäev',
        'Teisipäev',
        'Kolmapäev',
        'Neljapäev',
        'Reede',
        'Laupäev',
        'Pühapäev',
      ];

  @override
  List<String> get periods => [
        'Iga-aastane',
        'Igakuine',
        'Iganädalane',
        'Igapäevane',
        'Mitte kunagi',
      ];
}
