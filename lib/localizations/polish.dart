import 'package:rrule_generator/localizations/text_delegate.dart';

class PolishRRuleTextDelegate implements RRuleTextDelegate {
  const PolishRRuleTextDelegate();

  @override
  String get locale => 'pl';

  @override
  String get repeat => 'Powtarzaj';

  @override
  String get day => 'Dzień';

  @override
  String get byDayInMonth => 'Powtarzaj w miesiącu';

  @override
  String get byNthDayInMonth => 'Powtarzaj w dniu';

  @override
  String get every => 'Każdy';

  @override
  String get of => 'co';

  @override
  String get months => 'Miesięcy';

  @override
  String get month => 'Miesiąc';

  @override
  String get weeks => 'Tygodni';

  @override
  String get days => 'Dni';

  @override
  String get date => 'Data';

  @override
  String get on => 'Dnia';

  @override
  String get instances => 'wystąpieniach';

  @override
  String get end => 'Koniec';

  @override
  String get neverEnds => 'Nigdy się nie kończy';

  @override
  String get endsAfter => 'Kończy się po';

  @override
  String get endsOnDate => 'Kończy się w dniu';

  @override
  String get excludeDate => 'Wyklucz datę';

  @override
  List<String> get daysInMonth => [
        '1.',
        '2.',
        '3.',
        '4.',
        'Ostatni/-a',
      ];

  @override
  List<String> get periods => [
        'Rocznie',
        'Miesięcznie',
        'Tygodniowo',
        'Codziennie',
        'Nigdy',
      ];
}
