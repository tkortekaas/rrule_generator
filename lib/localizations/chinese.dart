import 'package:rrule_generator/localizations/text_delegate.dart';

class ChineseRRuleTextDelegate implements RRuleTextDelegate {
  const ChineseRRuleTextDelegate();

  @override
  String get repeat => '重复';

  @override
  String get day => '天';

  @override
  String get byDayInMonth => '重复';

  @override
  String get byNthDayInMonth => '在每月的特定日期重复';

  @override
  String get every => '每个';

  @override
  String get of => '';

  @override
  String get months => '几个月';

  @override
  String get weeks => '软化';

  @override
  String get days => '到黎明';

  @override
  String get date => '日期';

  @override
  String get on => '';

  @override
  String get instances => '次后';

  @override
  String get end => '结尾';

  @override
  String get neverEnds => '永不结束';

  @override
  String get endsAfter => '结束';

  @override
  String get endsOnDate => '结束日期';

  @override
  String get excludeDate => '排除日期';

  @override
  List<String> get daysInMonth => [
        '第一的',
        '第二',
        '第三',
        '第四',
        '最后的',
      ];

  @override
  List<String> get allMonths => [
        '一月',
        '二月',
        '行进',
        '四月',
        '可能',
        '六月',
        '七月',
        '八月',
        '九月',
        '十月',
        '十一月',
        '十二月',
      ];

  @override
  List<String> get weekdays => [
        '周一',
        '周二',
        '周三',
        '周四',
        '星期五',
        '周六',
        '周日',
      ];

  @override
  List<String> get periods => [
        '年度的',
        '每月',
        '每周',
        '日常的',
        '绝不',
      ];
}
