import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntervalPicker extends StatefulWidget {
  final Function onChange;
  final TextEditingController controller;

  const IntervalPicker(this.controller, this.onChange, {Key? key})
      : super(key: key);

  @override
  State<IntervalPicker> createState() => _IntervalPickerState();
}

class _IntervalPickerState extends State<IntervalPicker> {
  @override
  Widget build(BuildContext context) => TextField(
        controller: widget.controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (_) => widget.onChange(),
      );
}
