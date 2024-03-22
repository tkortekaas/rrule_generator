import 'package:rrule_generator/localizations/text_delegate.dart';

class ItalianRRuleTextDelegate implements RRuleTextDelegate {
  const ItalianRRuleTextDelegate();

  @override
  String get repeat => 'Ripetere';

  @override
  String get day => 'Data';

  @override
  String get byDayInMonth => 'Ripeti';

  @override
  String get byNthDayInMonth => 'Ripeti il';

  @override
  String get every => 'Ogni';

  @override
  String get of => 'di';

  @override
  String get months => 'Mesi';

  @override
  String get weeks => 'Settimane';

  @override
  String get days => 'Giorni';

  @override
  String get date => 'Data';

  @override
  String get on => 'Il';

  @override
  String get instances => 'istanze';

  @override
  String get end => 'Fine';

  @override
  String get neverEnds => 'Non finisce mai';

  @override
  String get endsAfter => 'Finisce dopo';

  @override
  String get endsOnDate => 'Termina in data';

  @override
  String get excludeDate => 'Escludi data';

  @override
  List<String> get daysInMonth => [
        'Primo',
        'Secondo',
        'Terzo',
        'Il quarto',
        'Ultimo',
      ];

  @override
  List<String> get allMonths => [
        'Gennaio',
        'Febbraio',
        'Marzo',
        'Aprile',
        'Maggio',
        'Giugno',
        'Luglio',
        'Agosto',
        'Settembre',
        'Ottobre',
        'Novembre',
        'Dicembre',
      ];

  @override
  List<String> get weekdays => [
        'Lunedi',
        'Martedì',
        'Mercoledì',
        'Giovedì',
        'Venerdì',
        'Sabato',
        'Domenica',
      ];

  @override
  List<String> get periods => [
        'Annuale',
        'Mensile',
        'Settimanalmente',
        'Quotidiano',
        'Mai',
      ];
}
