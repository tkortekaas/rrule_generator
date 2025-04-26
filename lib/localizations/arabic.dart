import 'package:rrule_generator/localizations/text_delegate.dart';

class ArabicRRuleTextDelegate implements RRuleTextDelegate {
  const ArabicRRuleTextDelegate();

  @override
  String get locale => 'ar';

  @override
  String get repeat => 'كرر';

  @override
  String get day => 'يوم';

  @override
  String get byDayInMonth => 'يوم في الشهر';

  @override
  String get byNthDayInMonth => 'كرر في كل';

  @override
  String get every => 'كل';

  @override
  String get of => 'من';

  @override
  String get months => 'أشهر';

  @override
  String get weeks => 'أسابيع';

  @override
  String get days => 'أيام';

  @override
  String get date => 'تاريخ';

  @override
  String get on => 'في';

  @override
  String get instances => 'مرات';

  @override
  String get end => 'نهاية';

  @override
  String get neverEnds => 'لا تنتهي أبدًا';

  @override
  String get endsAfter => 'تنتهي بعد';

  @override
  String get endsOnDate => 'تنتهي في تاريخ';

  @override
  String get timeOfDay => 'وقت اليوم';

  @override
  String get excludeDate => 'استثناء التاريخ';

  @override
  List<String> get daysInMonth => [
        'الأول',
        'الثاني',
        'الثالث',
        'الرابع',
        'الأخير',
      ];

  @override
  List<String> get periods => [
        'سنويًا',
        'شهريًا',
        'أسبوعيًا',
        'يوميًا',
        'أبدًا',
      ];
}
