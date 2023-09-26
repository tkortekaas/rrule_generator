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
                          'RRULE:FREQ=WEEKLY;INTERVAL=2;BYDAY=TU,TH;COUNT=10',
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
