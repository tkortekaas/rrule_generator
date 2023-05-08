import 'package:flutter/material.dart';
import 'package:rrule_generator/rrule_generator.dart';

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
        body: Builder(builder: (context) {
          return Center(
            child: ElevatedButton(
              child: Text('Open'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: RRuleGenerator(
                      initialRRule:
                          'FREQ=MONTHLY;INTERVAL=1;BYDAY=TU;BYSETPOS=1;UNTIL=2021128',
                      textDelegate: const EnglishRRuleTextDelegate(),
                      onChange: print,
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
