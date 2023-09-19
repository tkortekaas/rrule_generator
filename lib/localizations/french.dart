import 'package:rrule_generator/localizations/text_delegate.dart';

class FrenchRRuleTextDelegate implements RRuleTextDelegate {
  const FrenchRRuleTextDelegate();

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
  List<String> get daysInMonth => [
        'Premier',
        'Deuxième',
        'Troisième',
        'Quatrième',
        'Dernier',
      ];

  @override
  List<String> get allMonths => [
        'Janvier',
        'Février',
        'Mars',
        'Avril',
        'Mai',
        'Juin',
        'Juillet',
        'Août',
        'Septembre',
        'Octobre',
        'Novembre',
        'Décembre',
      ];

  @override
  List<String> get weekdays => [
        'Lundi',
        'Mardi',
        'Mercredi',
        'Jeudi',
        'Vendredi',
        'Samedi',
        'Dimanche',
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
