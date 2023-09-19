import 'package:rrule_generator/localizations/text_delegate.dart';

class SpanishRRuleTextDelegate implements RRuleTextDelegate {
  const SpanishRRuleTextDelegate();

  @override
  String get repeat => 'Repetir';

  @override
  String get day => 'Fecha';

  @override
  String get byDayInMonth => 'Repetir en';

  @override
  String get byNthDayInMonth => 'Repetir en el';

  @override
  String get every => 'Cada';

  @override
  String get of => 'de la';

  @override
  String get months => 'Mes(es)';

  @override
  String get weeks => 'Semana(s)';

  @override
  String get days => 'Día(s)';

  @override
  String get date => 'Fecha';

  @override
  String get on => 'En';

  @override
  String get instances => 'veces';

  @override
  String get end => 'Fin';

  @override
  String get neverEnds => 'Nunca termina';

  @override
  String get endsAfter => 'Termina después';

  @override
  String get endsOnDate => 'Termina en fecha';

  @override
  List<String> get daysInMonth => [
        'Primero',
        'Segundo',
        'Tercero',
        'Cuatro',
        'Último',
      ];

  @override
  List<String> get allMonths => [
        'Enero',
        'Febrero',
        'Marzo',
        'Abril',
        'Puede',
        'Junio',
        'Julio',
        'Agosto',
        'Septiembre',
        'Octubre',
        'Noviembre',
        'Diciembre',
      ];

  @override
  List<String> get weekdays => [
        'Lunes',
        'Martes',
        'Miércoles',
        'Jueves',
        'Viernes',
        'Sábado',
        'Domingo',
      ];

  @override
  List<String> get periods => [
        'Anual',
        'Mensual',
        'Semanal',
        'Diario',
        'Nunca',
      ];
}
