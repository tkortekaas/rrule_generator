import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rrule_generator/src/rrule_generator_config.dart';

Container buildDropdown({
  required Widget child,
  required BoxDecoration dropdownMenuStyle,
}) {
  return Container(
    decoration: dropdownMenuStyle,
    child: DropdownButtonHideUnderline(
      child: child,
    ),
  );
}

Column buildElement({
  String? title,
  required Widget child,
  required TextStyle style,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      if (title != null)
        Text(
          title,
          style: style,
        )
      else
        Container(),
      child,
    ],
  );
}

Padding buildContainer({required Widget child}) {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: child,
  );
}

Widget buildToggleItem({
  required Widget child,
  required void Function(bool) onChanged,
  required String title,
  required bool value,
  required RRuleSwitchStyle switchStyle,
}) {
  return buildContainer(
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(title, style: switchStyle.switchTextStyle),
            ),
            switchStyle.isCupertinoStyle
                ? CupertinoSwitch(
                    value: value,
                    onChanged: onChanged,
                    activeTrackColor: switchStyle.activeTrackColor,
                    inactiveTrackColor: switchStyle.inactiveTrackColor,
                    thumbColor: value ? switchStyle.thumbColor : null,
                  )
                : SwitchTheme(
                    data: SwitchThemeData(
                      thumbIcon:
                          WidgetStateProperty.resolveWith<Icon?>((states) {
                        return Icon(
                          Icons.circle,
                          size: states.contains(WidgetState.disabled)
                              ? switchStyle.inactiveThumbSize
                              : switchStyle.thumbSize,
                          color: switchStyle.thumbColor,
                        );
                      }),
                      thumbColor:
                          WidgetStateProperty.all(switchStyle.thumbColor),
                      trackColor: WidgetStateProperty.resolveWith((states) {
                        return states.contains(WidgetState.selected)
                            ? switchStyle.activeTrackColor
                            : switchStyle.inactiveTrackColor;
                      }),
                      trackOutlineWidth: WidgetStateProperty.resolveWith(
                        (states) {
                          return states.contains(WidgetState.selected)
                              ? switchStyle.trackOutlineWidth
                              : 0.0;
                        },
                      ),
                      trackOutlineColor: WidgetStateProperty.resolveWith(
                        (states) {
                          return states.contains(WidgetState.disabled)
                              ? switchStyle.trackOutlineColor
                              : Colors.transparent;
                        },
                      ),
                    ),
                    child: Switch(value: value, onChanged: onChanged),
                  ),
          ],
        ),
        if (value) child,
      ],
    ),
  );
}
