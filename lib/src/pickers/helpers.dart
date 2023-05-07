import 'package:flutter/material.dart';

Container buildDropdown({required Widget child}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(),
      borderRadius: BorderRadius.circular(8),
    ),
    width: double.maxFinite,
    padding: const EdgeInsets.all(8),
    child: DropdownButtonHideUnderline(
      child: child,
    ),
  );
}

Column buildElement({required Widget child, required String title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      child,
    ],
  );
}

Padding buildContainer({required Widget child}) {
  return Padding(
    child: child,
    padding: const EdgeInsets.all(8),
  );
}

Widget buildToggleItem({
  required Widget child,
  required Function(bool) onChanged,
  required String title,
  required bool value,
}) {
  if (!value)
    return buildContainer(
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  return buildContainer(
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Switch(value: value, onChanged: onChanged),
          ],
        ),
        child,
      ],
    ),
  );
}
