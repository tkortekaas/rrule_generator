import 'package:flutter/material.dart';
import 'package:rrule_generator/localizations/text_delegate.dart';

class WeekdayPicker extends StatelessWidget {
  final RRuleTextDelegate textDelegate;
  final Function onChange;

  final List<ValueNotifier<bool>> weekdayNotifiers;


  WeekdayPicker(this.weekdayNotifiers, this.textDelegate, this.onChange);

  @override
  Widget build(BuildContext context) => Column(
        children: List.generate(
          7,
          (index) => ValueListenableBuilder(
            valueListenable: weekdayNotifiers[index],
            builder: (BuildContext context, bool value, Widget? child) =>
                CheckboxListTile(
              value: value,
              onChanged: (bool? newValue) {
                weekdayNotifiers[index].value = newValue!;
                onChange();
              },
              title: Text(
                textDelegate.weekdays[index],
              ),
            ),
          ),
        ),
      );
}
