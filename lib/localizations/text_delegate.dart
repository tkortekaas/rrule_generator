class RRuleTextDelegate {
  String get byDayInMonth => 'By day in Month';

  String get byNthDayInMonth => 'By nth day in Month';

  String get every => 'Every';

  String get of => 'of';

  String get months => 'Month(s)';

  String get weeks => 'Week(s)';

  String get days => 'Day(s)';

  String get instances => 'instance(s)';

  String get neverEnds => 'Never ends';

  String get endsAfter => 'Ends after';

  String get endsOnDate => 'Ends on date';

  List<String> get daysInMonth => [
        '1st',
        '2nd',
        '3rd',
        '4rd',
        'Last',
      ];

  List<String> get allMonths => [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ];

  List<String> get weekdays => [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday',
      ];

  List<String> get periods => [
        'Yearly',
        'Monthly',
        'Weekly',
        'Daily',
      ];
}
