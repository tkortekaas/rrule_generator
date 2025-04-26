import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Scaffold(
        appBar: AppBar(),
        body: Builder(builder: (context) {
          return Center(
            child: ElevatedButton(
              child: const Text('Open'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: SingleChildScrollView(
                      child: RRuleGenerator(
                        config: RRuleGeneratorConfig(),
                        initialRRule:
                            'RRULE:FREQ=MONTHLY;BYMONTHDAY=-1;INTERVAL=1;UNTIL=20231211;BYHOUR=15;BYMINUTE=20;EXDATE=20240322T000000',
                        textDelegate: const EnglishRRuleTextDelegate(),
                        withExcludeDates: true,
                        onChange: print,
                      ),
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
