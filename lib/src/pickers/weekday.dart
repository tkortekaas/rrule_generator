import 'package:flutter/material.dart';
import 'package:rrule_generator/localizations/text_delegate.dart';
import 'package:rrule_generator/src/rrule_generator_config.dart';

class WeekdayPicker extends StatelessWidget {
  const WeekdayPicker(
      this.weekdayNotifiers,
      this.textDelegate,
      this.onChange, {
        super.key,
        required this.config,
      });

  final RRuleTextDelegate textDelegate;
  final Function onChange;

  final RRuleGeneratorConfig config;

  final List<ValueNotifier<bool>> weekdayNotifiers;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: List.generate(
        7,
            (index) => ValueListenableBuilder(
          valueListenable: weekdayNotifiers[index],
          builder: (context, value, child) => Expanded(
            child: InkWell(
              child: Container(
                margin: const EdgeInsets.only(right: 2),
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                    color: value
                        ? config.weekdaySelectedBackgroundColor
                        : config.weekdayBackgroundColor,
                    borderRadius: BorderRadius.circular(5)),
                child: FittedBox(
                  child: Text(
                    textDelegate.weekdays[index].substring(0, 3),
                    style: config.textStyle.copyWith(
                        color: value
                            ? config.weekdaySelectedColor
                            : config.weekdayColor),
                  ),
                ),
              ),
              onTap: () {
                weekdayNotifiers[index].value = !value;
                onChange();
              },
            ),
          ),
        ),
      ),
    ),
  );
}
