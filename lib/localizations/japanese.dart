import 'package:rrule_generator/localizations/text_delegate.dart';

class JapaneseRRuleTextDelegate implements RRuleTextDelegate {
  const JapaneseRRuleTextDelegate();

  @override
  String get locale => 'ja';

  @override
  String get repeat => '繰り返し';

  @override
  String get day => '日';

  @override
  String get byDayInMonth => '月ごとに繰り返す';

  @override
  String get byNthDayInMonth => '月ごとに繰り返す';

  @override
  String get every => '毎';

  @override
  String get of => 'の';

  @override
  String get months => 'ヶ月';

  @override
  String get month => '月';

  @override
  String get weeks => '週';

  @override
  String get days => '日';

  @override
  String get date => '日付';

  @override
  String get on => 'に';

  @override
  String get instances => '回';

  @override
  String get end => '終了';

  @override
  String get neverEnds => '終了しない';

  @override
  String get endsAfter => '次の後に終了';

  @override
  String get endsOnDate => '次の日付で終了';

  @override
  String get excludeDate => '日付を除外';

  @override
  List<String> get daysInMonth => [
        '最初',
        '2番目',
        '3番目',
        '4番目',
        '最後',
      ];

  @override
  List<String> get periods => [
        '毎年',
        '毎月',
        '毎週',
        '毎日',
        '終了しない',
      ];
}
