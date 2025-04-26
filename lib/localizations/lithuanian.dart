import 'package:rrule_generator/localizations/text_delegate.dart';

class LithuanianRRuleTextDelegate implements RRuleTextDelegate {
  const LithuanianRRuleTextDelegate();

  @override
  String get locale => 'lt';

  @override
  String get repeat => 'Kartoti';

  @override
  String get day => 'Diena';

  @override
  String get byDayInMonth => 'Mėnesio diena';

  @override
  String get byNthDayInMonth => 'Mėnesio dienos numeris';

  @override
  String get every => 'Kiekvieną';

  @override
  String get of => '';

  @override
  String get months => 'Mėnesių';

  @override
  String get weeks => 'Kad suminkštėtų';

  @override
  String get days => 'Dieną';

  @override
  String get date => 'Data';

  @override
  String get on => 'Kiekvieną';

  @override
  String get instances => 'Kartą';

  @override
  String get end => 'Pabaiga';

  @override
  String get neverEnds => 'Niekada nesibaigia';

  @override
  String get endsAfter => 'Baigiasi po';

  @override
  String get endsOnDate => 'Baigiasi data';

  @override
  String get timeOfDay => 'Dienos laikas';

  @override
  String get excludeDate => 'Išskirti datą';

  @override
  List<String> get daysInMonth => [
        'Pirmas',
        'Antras',
        'Trečias',
        'Ketvirtas',
        'Paskutinis',
      ];

  @override
  List<String> get periods => [
        'Metinis',
        'Kas mėnesį',
        'Kas savaitę',
        'Kasdien',
        'Niekada',
      ];
}
