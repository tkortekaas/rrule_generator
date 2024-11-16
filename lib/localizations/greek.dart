import 'package:rrule_generator/localizations/text_delegate.dart';

class GreekRRuleTextDelegate implements RRuleTextDelegate {
  const GreekRRuleTextDelegate();

  @override
  String get locale => 'el';

  @override
  String get repeat => 'Επανάλαβε';

  @override
  String get day => 'Ημέρα';

  @override
  String get byDayInMonth => 'Ημέρα του μήνα';

  @override
  String get byNthDayInMonth => 'Επανάλαβε πάντα την';

  @override
  String get every => 'Κάθε';

  @override
  String get of => 'του';

  @override
  String get months => 'Μήνες';

  @override
  String get weeks => 'Εβδομάδες';

  @override
  String get days => 'Ημέρες';

  @override
  String get date => 'Ημερομηνία';

  @override
  String get on => 'Στις';

  @override
  String get instances => 'Επαναλήψεις';

  @override
  String get end => 'Τέλος';

  @override
  String get neverEnds => 'Δεν λήγει ποτέ';

  @override
  String get endsAfter => 'Λήγει μετά';

  @override
  String get endsOnDate => 'Λήγει στην ημερομηνία';

  @override
  String get excludeDate => 'Εξαίρεση ημερομηνίας';

  @override
  List<String> get daysInMonth => [
        'Πρώτη',
        'Δεύτερη',
        'Τρίτη',
        'Τέταρτη',
        'Τελευταία',
      ];

  @override
  List<String> get periods => [
        'Ετη',
        'Μήνες',
        'Εβδομάδες',
        'Ημέρες',
        'Χωρίς επανάληψη',
      ];
}
