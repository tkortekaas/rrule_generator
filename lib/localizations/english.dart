import 'package:rrule_generator/localizations/text_delegate.dart';

class EnglishRRuleTextDelegate implements RRuleTextDelegate {
  const EnglishRRuleTextDelegate();

  @override
  String get locale => 'en';

  @override
  String get repeat => 'Repeat';

  @override
  String get day => 'Day';

  @override
  String get byDayInMonth => 'Repeat on';

  @override
  String get byNthDayInMonth => 'Repeat on the';

  @override
  String get every => 'Every';

  @override
  String get of => 'of';

  @override
  String get months => 'Month(s)';

  @override
  String get month => 'Month';

  @override
  String get weeks => 'Week(s)';

  @override
  String get days => 'Day(s)';

  @override
  String get date => 'Date';

  @override
  String get on => 'On';

  @override
  String get instances => 'instance(s)';

  @override
  String get end => 'End';

  @override
  String get neverEnds => 'Never ends';

  @override
  String get endsAfter => 'Ends after';

  @override
  String get endsOnDate => 'Ends on';

  @override
  String get excludeDate => 'Exclude date';

  @override
  List<String> get daysInMonth => [
        'First',
        'Second',
        'Third',
        'Fourth',
        'Last',
      ];

  @override
  List<String> get periods => [
        'Yearly',
        'Monthly',
        'Weekly',
        'Daily',
        'Never',
      ];
}
