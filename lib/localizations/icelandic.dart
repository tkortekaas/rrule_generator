import 'package:rrule_generator/localizations/text_delegate.dart';

class IcelandicRRuleTextDelegate implements RRuleTextDelegate {
  const IcelandicRRuleTextDelegate();

  @override
  String get locale => 'is';

  @override
  String get repeat => 'Endurtekning';

  @override
  String get day => 'Dagur';

  @override
  String get byDayInMonth => 'Dagur mánaðar';

  @override
  String get byNthDayInMonth => 'Endurtekning á';

  @override
  String get every => 'Á hverjum';

  @override
  String get of => 'af';

  @override
  String get months => 'Mánuðir';

  @override
  String get weeks => 'Vikur';

  @override
  String get days => 'Dagar';

  @override
  String get date => 'Dagsetning';

  @override
  String get on => 'Á';

  @override
  String get instances => 'Tilfelli';

  @override
  String get end => 'Endir';

  @override
  String get neverEnds => 'Aldrei endar';

  @override
  String get endsAfter => 'Endar eftir';

  @override
  String get endsOnDate => 'Endar á dagsetningu';

  @override
  String get timeOfDay => 'Tími dagsins';

  @override
  String get excludeDate => 'Undanskil dagsetningu';

  @override
  List<String> get daysInMonth => [
        'Fyrsti',
        'Annar',
        'Þriðji',
        'Fjórði',
        'Síðasti',
      ];

  @override
  List<String> get periods => [
        'Árlega',
        'Mánaðarlega',
        'Vikulega',
        'Daglega',
        'Aldrei',
      ];
}
