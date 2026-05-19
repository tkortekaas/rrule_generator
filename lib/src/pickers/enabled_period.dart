import 'package:rrule_generator/rrule_generator.dart';

enum RRulePeriod {
  yearly,
  monthly,
  weekly,
  daily,
  never,
}

extension RRulePeriodExtension on RRulePeriod {
  String toText(RRuleTextDelegate textDelegate) {
    switch (this) {
      case RRulePeriod.never:
        return textDelegate.periods[4];
      case RRulePeriod.daily:
        return textDelegate.periods[3];
      case RRulePeriod.weekly:
        return textDelegate.periods[2];
      case RRulePeriod.monthly:
        return textDelegate.periods[1];
      case RRulePeriod.yearly:
        return textDelegate.periods[0];
    }
  }
}
