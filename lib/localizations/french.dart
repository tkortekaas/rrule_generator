import 'package:rrule_generator/localizations/text_delegate.dart';

class FrenchRRuleTextDelegate implements RRuleTextDelegate {
  const FrenchRRuleTextDelegate();

  @override
  String get byDayInMonth => 'Par jour du mois';

  @override
  String get byNthDayInMonth => 'Par jour spécifique du mois';

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
  String get instances => 'fois';

  @override
  String get neverEnds => 'Ne finit jamais';

  @override
  String get endsAfter => 'Se termine après';

  @override
  String get endsOnDate => 'Se termine le jour';

  @override
  List<String> get daysInMonth => [
        '1er',
        '2e',
        '3e',
        '4e',
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
