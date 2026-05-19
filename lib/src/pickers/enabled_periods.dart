import 'package:rrule_generator/localizations/text_delegate.dart';

enum EnabledPeriod {
  never,
  daily,
  weekly,
  monthly,
  yearly,
}

extension EnabledPeriodExtension on EnabledPeriod {
  String toText(RRuleTextDelegate textDelegate) {
    switch (this) {
      case EnabledPeriod.never:
        return textDelegate.periods[4];
      case EnabledPeriod.daily:
        return textDelegate.periods[3];
      case EnabledPeriod.weekly:
        return textDelegate.periods[2];
      case EnabledPeriod.monthly:
        return textDelegate.periods[1];
      case EnabledPeriod.yearly:
        return textDelegate.periods[0];
    }
  }
}
