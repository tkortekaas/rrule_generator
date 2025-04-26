import 'package:rrule_generator/localizations/text_delegate.dart';

class PortugueseRRuleTextDelegate implements RRuleTextDelegate {
  const PortugueseRRuleTextDelegate();

  @override
  String get locale => 'pt-BR';

  @override
  String get repeat => 'Repetir';

  @override
  String get day => 'Dia';

  @override
  String get byDayInMonth => 'Repetir em';

  @override
  String get byNthDayInMonth => 'Repetir no';

  @override
  String get every => 'Todo';

  @override
  String get of => 'de';

  @override
  String get months => 'Mês(es)';

  @override
  String get weeks => 'Semana(s)';

  @override
  String get days => 'Dia(s)';

  @override
  String get date => 'Data';

  @override
  String get on => 'Em';

  @override
  String get instances => 'instância(s)';

  @override
  String get end => 'Fim';

  @override
  String get neverEnds => 'Nunca termina';

  @override
  String get endsAfter => 'Termina após';

  @override
  String get endsOnDate => 'Termina em';

  @override
  String get timeOfDay => 'Hora do dia';

  @override
  String get excludeDate => 'Excluir data';

  @override
  List<String> get daysInMonth => [
        'Primeiro',
        'Segundo',
        'Terceiro',
        'Quarto',
        'Último',
      ];

  @override
  List<String> get periods => [
        'Anual',
        'Mensal',
        'Semanal',
        'Diário',
        'Nunca',
      ];
}
