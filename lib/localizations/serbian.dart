import 'package:rrule_generator/localizations/text_delegate.dart';

class SerbianRRuleTextDelegate implements RRuleTextDelegate {
  const SerbianRRuleTextDelegate();

  @override
  String get locale => 'sr';

  @override
  String get repeat => 'Ponovi';

  @override
  String get day => 'Dan';

  @override
  String get byDayInMonth => 'Ponovi na';

  @override
  String get byNthDayInMonth => 'Ponovi svaki';

  @override
  String get every => 'Svaki';

  @override
  String get of => 'od';

  @override
  String get months => 'Mjeseci';

  @override
  String get month => 'Mjesec';

  @override
  String get weeks => 'Tjedni';

  @override
  String get days => 'Dani';

  @override
  String get date => 'Datum';

  @override
  String get on => 'Na';

  @override
  String get instances => 'ponavljanja';

  @override
  String get end => 'Kraj';

  @override
  String get neverEnds => 'Nikad ne završava';

  @override
  String get endsAfter => 'Završava nakon';

  @override
  String get endsOnDate => 'Završava na datum';

  @override
  String get excludeDate => 'Isključi datum';

  @override
  List<String> get daysInMonth =>
      ['Prvi', 'Drugi', 'Treći', 'Četvrti', 'Zadnji'];

  @override
  List<String> get periods =>
      ['Dnevno', 'Tjedno', 'Mjesečno', 'Godišnje', 'Nikada'];
}
