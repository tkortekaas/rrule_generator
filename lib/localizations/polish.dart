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
  String get months => 'Miesiące';

  @override
  String get weeks => 'Tygodnie';

  @override
  String get days => 'Dni';

  @override
  String get date => 'Data';

  @override
  String get on => 'Dnia';

  @override
  String get instances => 'instancji';

  @override
  String get end => 'Koniec';

  @override
  String get neverEnds => 'Nigdy nie kończy się';

  @override
  String get endsAfter => 'Kończy się po';

  @override
  String get endsOnDate => 'Kończy się w dniu';

  @override
  String get excludeDate => 'Wyklucz datę';

  @override
  List<String> get daysInMonth => [
        '1szy',
        '2gi',
        '3ci',
        '4ty',
        'Ostatni',
      ];

  @override
  List<String> get allMonths => [
        'Styczeń',
        'Luty',
        'Marzec',
        'Kwiecień',
        'Maj',
        'Czerwiec',
        'Lipiec',
        'Sierpień',
        'Wrzesień',
        'Październik',
        'Listopad',
        'Grudzień',
      ];

  @override
  List<String> get weekdays => [
        'Poniedziałek',
        'Wtorek',
        'Środa',
        'Czwartek',
        'Piątek',
        'Sobota',
        'Niedziela',
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
