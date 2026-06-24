import 'package:rrule_generator/localizations/text_delegate.dart';

class SomaliRRuleTextDelegate implements RRuleTextDelegate {
  const SomaliRRuleTextDelegate();

  @override
  String get locale => 'so';

  @override
  String get repeat => 'Ku celi';

  @override
  String get day => 'Maalin';

  @override
  String get byDayInMonth => 'Ku celi maalinta';

  @override
  String get byNthDayInMonth => 'Ku celi maalinta';

  @override
  String get every => 'Kasta';

  @override
  String get of => 'ee';

  @override
  String get months => 'Bilood';

  @override
  String get month => 'Bil';

  @override
  String get weeks => 'Toddobaadyo';

  @override
  String get days => 'Maalmood';

  @override
  String get date => 'Taariikh';

  @override
  String get on => 'Ku';

  @override
  String get instances => 'Jeer';

  @override
  String get end => 'Dhammaad';

  @override
  String get neverEnds => 'Weligiis ma dhammaado';

  @override
  String get endsAfter => 'Ku dhammaada kadib';

  @override
  String get endsOnDate => 'Ku dhammaada taariikhda';

  @override
  String get excludeDate => 'Ka reeb taariikhda';

  @override
  List<String> get daysInMonth => [
        'Koowaad',
        'Labaad',
        'Saddexaad',
        'Afarraad',
        'Ugu dambaysa',
      ];

  @override
  List<String> get periods => [
        'Sannadle',
        'Bille',
        'Toddobaadle',
        'Maalinle',
        'Marnaba',
      ];
}
