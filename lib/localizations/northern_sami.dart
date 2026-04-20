import 'package:rrule_generator/localizations/text_delegate.dart';

class NorthernSamiRRuleTextDelegate implements RRuleTextDelegate {
  const NorthernSamiRRuleTextDelegate();

  @override
  String get locale => 'se';

  @override
  String get repeat => 'Geardduhit';

  @override
  String get day => 'Beaivi';

  @override
  String get byDayInMonth => 'Geargga';

  @override
  String get byNthDayInMonth => 'Geargga fas';

  @override
  String get every => 'Juohke';

  @override
  String get of => '';

  @override
  String get months => 'Mánnu(t)';

  @override
  String get month => 'Mánotbadji';

  @override
  String get weeks => 'Vahkku(t)';

  @override
  String get days => 'Beaivi(t)';

  @override
  String get date => 'Beaivemearri';

  @override
  String get on => 'On';

  @override
  String get instances => 'ovdamearkka(t)';

  @override
  String get end => 'Loahppa';

  @override
  String get neverEnds => 'Ii goassege noga';

  @override
  String get endsAfter => 'Nohká maŋŋel';

  @override
  String get endsOnDate => 'Loahpahuvvo';

  @override
  String get excludeDate => 'Váldde eret beaivvi';

  @override
  List<String> get daysInMonth => [
        'Vuosttas',
        'Nubbi',
        'Goalmmát',
        'Njealját',
        'Maŋimus',
      ];

  @override
  List<String> get periods => [
        'Jahkásaččat',
        'Mánnui',
        'Vahkkosaš',
        'Beaivválaš',
        'Ii goassige',
      ];
}
