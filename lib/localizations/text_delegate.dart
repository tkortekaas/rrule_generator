class RRuleTextDelegate {
  String get locale => 'en';

  String get repeat => 'Repeat';

  String get day => 'Day';

  String get byDayInMonth => 'Repeat on';

  String get byNthDayInMonth => 'Repeat on the';

  String get every => 'Every';

  String get of => 'of';

  String get months => 'Month(s)';

  String get month => 'Month';

  String get weeks => 'Week(s)';

  String get days => 'Day(s)';

  String get date => 'Date';

  String get on => 'On';

  String get instances => 'instance(s)';

  String get end => 'End';

  String get neverEnds => 'Never ends';

  String get endsAfter => 'Ends after';

  String get endsOnDate => 'Ends on date';

  String get excludeDate => 'Exclude date';

  List<String> get daysInMonth => [
        '1st',
        '2nd',
        '3rd',
        '4rd',
        'Last',
      ];

  List<String> get periods => [
        'Yearly',
        'Monthly',
        'Weekly',
        'Daily',
        'Never',
      ];
}
