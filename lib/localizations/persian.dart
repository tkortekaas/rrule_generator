import 'package:rrule_generator/localizations/text_delegate.dart';

class PersianRRuleTextDelegate implements RRuleTextDelegate {
  const PersianRRuleTextDelegate();

  @override
  String get locale => 'fa';

  @override
  String get repeat => 'تکرار';

  @override
  String get day => 'روز';

  @override
  String get byDayInMonth => 'روز ماه';

  @override
  String get byNthDayInMonth => 'تکرار هر';

  @override
  String get every => 'هر';

  @override
  String get of => 'از';

  @override
  String get months => 'ماه';

  @override
  String get month => 'ماه';

  @override
  String get weeks => 'هفته';

  @override
  String get days => 'روز';

  @override
  String get date => 'تاریخ';

  @override
  String get on => 'در';

  @override
  String get instances => 'موارد';

  @override
  String get end => 'پایان';

  @override
  String get neverEnds => 'هرگز پایان نمی یابد';

  @override
  String get endsAfter => 'پایان پس از';

  @override
  String get endsOnDate => 'پایان در تاریخ';

  @override
  String get excludeDate => 'محروم کردن تاریخ';

  @override
  List<String> get daysInMonth => [
        'اول',
        'دوم',
        'سوم',
        'چهارم',
        'آخر',
      ];

  @override
  List<String> get periods => [
        'سالانه',
        'ماهانه',
        'هفتگی',
        'روزانه',
        'هرگز',
      ];
}
