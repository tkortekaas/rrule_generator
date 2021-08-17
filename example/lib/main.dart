import 'package:flutter/material.dart';
import 'package:rrule_generator/rrule_generator.dart';
import 'package:rrule_generator/localizations/english.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: RRuleGenerator(
            initialRRule: 'FREQ=MONTHLY;INTERVAL=1;BYDAY=TU;BYSETPOS=1;COUNT=9',
            textDelegate: const EnglishRRuleTextDelegate(),
            onChange: (String newValue) => print(newValue),
          ),
        ),
      ),
    );
  }
}
