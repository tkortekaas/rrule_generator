import 'package:rrule_generator/localizations/text_delegate.dart';

class FinnishRRuleTextDelegate implements RRuleTextDelegate {
  const FinnishRRuleTextDelegate();

  @override
  String get locale => 'fi';

  @override
  String get repeat => 'Toistaa';

  @override
  String get day => 'Päivä';

  @override
  String get byDayInMonth => 'Toistaa';

  @override
  String get byNthDayInMonth => 'Toista kohdassa';

  @override
  String get every => 'Joka';

  @override
  String get of => '';

  @override
  String get months => 'Kuukausi';

  @override
  String get weeks => 'Viikko';

  @override
  String get days => 'Päivä';

  @override
  String get date => 'Datum';

  @override
  String get on => 'Dag';

  @override
  String get instances => 'kertaa';

  @override
  String get end => 'Loppu';

  @override
  String get neverEnds => 'Ei lopu koskaan';

  @override
  String get endsAfter => 'Päättyy';

  @override
  String get endsOnDate => 'Päättyy päivämäärään';

  @override
  String get timeOfDay => 'Päivän aika';

  @override
  String get excludeDate => 'Poissulje päivämäärä';

  @override
  List<String> get daysInMonth => [
        'Ensimmäinen',
        'Toinen',
        'Kolmanneksi',
        'Neljäs',
        'Viimeinen',
      ];

  @override
  List<String> get periods => [
        'Vuotuinen',
        'Kuukausittain',
        'Viikoittain',
        'Päivittäin',
        'Ei koskaan',
      ];
}
