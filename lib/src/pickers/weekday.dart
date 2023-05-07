import 'package:flutter/material.dart';
import 'package:rrule_generator/localizations/text_delegate.dart';

class WeekdayPicker extends StatelessWidget {
  final RRuleTextDelegate textDelegate;
  final Function onChange;

  final List<ValueNotifier<bool>> weekdayNotifiers;

  const WeekdayPicker(this.weekdayNotifiers, this.textDelegate, this.onChange,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
          children: List.generate(
            7,
            (index) => ValueListenableBuilder(
              valueListenable: weekdayNotifiers[index],
              builder: (BuildContext context, bool value, Widget? child) =>
                  Expanded(
                child: InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(right: 2),
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        color: value
                            ? const Color(0xFF0359DA)
                            : const Color(0xFF0359DA).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      textDelegate.weekdays[index].substring(0, 3),
                      style: TextStyle(color: Colors.white),
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
