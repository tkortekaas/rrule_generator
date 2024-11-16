import 'package:rrule_generator/localizations/text_delegate.dart';

class FrenchRRuleTextDelegate implements RRuleTextDelegate {
  const FrenchRRuleTextDelegate();

  @override
  String get locale => 'fr';

  @override
  String get repeat => 'Répéter';

  @override
  String get day => 'Jour';

  @override
  String get byDayInMonth => 'Répéter sur';

  @override
  String get byNthDayInMonth => 'Répéter sur le';

  @override
  String get every => 'Tous';

  @override
  String get of => 'de';

  @override
  String get months => 'Mois';

  @override
  String get weeks => 'Semaines';

  @override
  String get days => 'Jours';

  @override
  String get date => 'Date';

  @override
  String get on => 'Le';

  @override
  String get instances => 'fois';

  @override
  String get end => 'Fin';

  @override
  String get neverEnds => 'Ne finit jamais';

  @override
  String get endsAfter => 'Se termine après';

  @override
  String get endsOnDate => 'Se termine le jour';

  @override
  String get excludeDate => 'Exclure la date';

  @override
  List<String> get daysInMonth => [
        'Premier',
        'Deuxième',
        'Troisième',
        'Quatrième',
        'Dernier',
      ];

  @override
  List<String> get periods => [
        'Jamais',
        'Annuel',
        'Mensuel',
        'Hebdomadaire',
        'Quotidien',
      ];
}
