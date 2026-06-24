import 'package:rrule_generator/localizations/text_delegate.dart';

class TigrinyaRRuleTextDelegate implements RRuleTextDelegate {
  const TigrinyaRRuleTextDelegate();

  @override
  String get locale => 'ti';

  @override
  String get repeat => 'ምድጋም';

  @override
  String get day => 'መዓልቲ';

  @override
  String get byDayInMonth => 'ኣብዚ ይድገም';

  @override
  String get byNthDayInMonth => 'ኣብዚ ይድገም';

  @override
  String get every => 'ነፍሲ ወከፍ';

  @override
  String get of => 'ናይ';

  @override
  String get months => 'ኣዋርሕ';

  @override
  String get month => 'ወርሒ';

  @override
  String get weeks => 'ሰሙናት';

  @override
  String get days => 'መዓልታት';

  @override
  String get date => 'ዕለት';

  @override
  String get on => 'ኣብ';

  @override
  String get instances => 'ድግግሞሽ';

  @override
  String get end => 'መወዳእታ';

  @override
  String get neverEnds => 'መወዳእታ የብሉን';

  @override
  String get endsAfter => 'ድሕሪኡ ይውዳእ';

  @override
  String get endsOnDate => 'በዚ ዕለት ይውዳእ';

  @override
  String get excludeDate => 'ዕለት ኣይተካትት';

  @override
  List<String> get daysInMonth => [
        'ቀዳማይ',
        'ካልኣይ',
        'ሳልሳይ',
        'ራብዓይ',
        'መወዳእታ',
      ];

  @override
  List<String> get periods => [
        'ዓመታዊ',
        'ወርሓዊ',
        'ሰሙናዊ',
        'መዓልታዊ',
        'ኣይድገምን',
      ];
}
