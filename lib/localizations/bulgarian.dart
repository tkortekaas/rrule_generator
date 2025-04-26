import 'package:rrule_generator/localizations/text_delegate.dart';

class BulgarianRRuleTextDelegate implements RRuleTextDelegate {
  const BulgarianRRuleTextDelegate();

  @override
  String get locale => 'bg';

  @override
  String get repeat => 'Повтори';

  @override
  String get day => 'Ден';

  @override
  String get byDayInMonth => 'Повтори на';

  @override
  String get byNthDayInMonth => 'Повтори на ден';

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
  String get date => 'Дата';

  @override
  String get on => 'На';

  @override
  String get instances => 'случай/и';

  @override
  String get end => 'Край';

  @override
  String get neverEnds => 'Никога не свършва';

  @override
  String get endsAfter => 'Приключва след';

  @override
  String get endsOnDate => 'Приключва на';

  @override
  String get timeOfDay => 'Час от деня';

  @override
  String get excludeDate => 'Изключи дата';

  @override
  List<String> get daysInMonth => [
        'Първи',
        'Второ',
        'Трети',
        'Четвърто',
        'Последен',
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
