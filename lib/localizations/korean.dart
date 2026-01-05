import 'package:rrule_generator/localizations/text_delegate.dart';

class KoreanRRuleTextDelegate implements RRuleTextDelegate {
  const KoreanRRuleTextDelegate();

  @override
  String get locale => 'ko';

  @override
  String get repeat => '반복';

  @override
  String get day => '일';

  @override
  String get byDayInMonth => '월별 반복';

  @override
  String get byNthDayInMonth => '월별 반복';

  @override
  String get every => '매';

  @override
  String get of => '의';

  @override
  String get months => '개월';

  @override
  String get month => '월';

  @override
  String get weeks => '주';

  @override
  String get days => '일';

  @override
  String get date => '날짜';

  @override
  String get on => '에';

  @override
  String get instances => '회';

  @override
  String get end => '종료';

  @override
  String get neverEnds => '종료 없음';

  @override
  String get endsAfter => '다음 후 종료';

  @override
  String get endsOnDate => '다음 날짜에 종료';

  @override
  String get excludeDate => '날짜 제외';

  @override
  List<String> get daysInMonth => [
        '첫 번째',
        '두 번째',
        '세 번째',
        '네 번째',
        '마지막',
      ];

  @override
  List<String> get periods => [
        '매년',
        '매월',
        '매주',
        '매일',
        '종료 없음',
      ];
}
