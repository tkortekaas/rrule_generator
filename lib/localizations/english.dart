import 'package:rrule_generator/localizations/text_delegate.dart';

class EnglishRRuleTextDelegate implements RRuleTextDelegate {
  const EnglishRRuleTextDelegate();

  @override
  String get byDayInMonth => 'By day in Month';

  @override
  String get byNthDayInMonth => 'By nth day in Month';

  @override
  String get every => 'Every';

  @override
  String get of => 'of';

  @override
  String get months => 'Month(s)';

  @override
  String get weeks => 'Week(s)';

  @override
  String get days => 'Day(s)';

  @override
  String get instances => 'instance(s)';

  @override
  String get neverEnds => 'Never ends';

  @override
  String get endsAfter => 'Ends after';

  @override
  String get endsOnDate => 'Ends on date';

  @override
  List<String> get daysInMonth => [
        '1st',
        '2nd',
        '3rd',
        '4rd',
        'Last',
      ];

  @override
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

  @override
  List<String> get weekdays => [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday',
      ];

  @override
  List<String> get periods => [
        'Yearly',
        'Monthly',
        'Weekly',
        'Daily',
      ];
}
