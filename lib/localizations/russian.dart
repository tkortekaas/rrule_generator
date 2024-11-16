import 'package:rrule_generator/localizations/text_delegate.dart';

class RussianRRuleTextDelegate implements RRuleTextDelegate {
  const RussianRRuleTextDelegate();

  @override
  String get locale => 'ru';

  @override
  String get repeat => 'Повторять';

  @override
  String get day => 'День';

  @override
  String get byDayInMonth => 'Повторять';

  @override
  String get byNthDayInMonth => 'Повторять';

  @override
  String get every => 'Каждый';

  @override
  String get of => 'в';

  @override
  String get months => 'Месяц(ы)';

  @override
  String get weeks => 'Неделя(и)';

  @override
  String get days => 'День(и)';

  @override
  String get date => 'Дата';

  @override
  String get on => 'в';

  @override
  String get instances => 'раз(а)';

  @override
  String get end => 'Конец';

  @override
  String get neverEnds => 'Никогда не заканчивается';

  @override
  String get endsAfter => 'Заканчивается после';

  @override
  String get endsOnDate => 'Заканчивается на дату';

  @override
  String get excludeDate => 'Исключить дату';

  @override
  List<String> get daysInMonth => [
        'Первый',
        'Второй',
        'Третий',
        'Четвёртый',
        'Последний',
      ];

  @override
  List<String> get periods => [
        'Год',
        'Месяц',
        'Неделя',
        'День',
        'Никогда',
      ];
}
