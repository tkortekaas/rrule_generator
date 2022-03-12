import 'package:rrule_generator/localizations/text_delegate.dart';

class BulgarianRRuleTextDelegate implements RRuleTextDelegate {
  const BulgarianRRuleTextDelegate();

  @override
  String get byDayInMonth => 'По ден в месеца';

  @override
  String get byNthDayInMonth => 'По определен ден в месеца';

  @override
  String get every => 'Всеки';

  @override
  String get of => '';

  @override
  String get months => 'Месец(и)';

  @override
  String get weeks => 'Седмица/и';

  @override
  String get days => 'Ден(а)';

  @override
  String get instances => 'случай/и';

  @override
  String get neverEnds => 'Никога не свършва';

  @override
  String get endsAfter => 'Приключва след';

  @override
  String get endsOnDate => 'Приключва на дата';

  @override
  List<String> get daysInMonth => [
    '1ви',
    '2ри',
    '3ти',
    '4ти',
    'последен',
  ];

  @override
  List<String> get allMonths => [
    'Януари',
    'Февруари',
    'Март',
    'Април',
    'Май',
    'Юни',
    'Юли',
    'Август',
    'Семтември',
    'Октомври',
    'Ноември',
    'Декември',
  ];

  @override
  List<String> get weekdays => [
    'Понеделник',
    'Вторник',
    'Сряда',
    'Четвъртък',
    'Петък',
    'Събота',
    'Неделя',
  ];

  @override
  List<String> get periods => [
    'Годишно',
    'Месечно',
    'Седмично',
    'Дневно',
    'Никога',
  ];
}
