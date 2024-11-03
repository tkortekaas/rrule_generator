# rrule_generator

RRuleGenerator is a widget for generating recurrence rules, such as described
in [the iCalendar RFC](https://datatracker.ietf.org/doc/html/rfc5545)

This widget is based on the [rrule](https://pub.dev/packages/rrule) and [teno_rrule](https://pub.dev/packages/teno_rrule) packages.

The widget is actively used in the [Calendar Clock](https://calendarclock.app) app.

![Example one](https://jelter.net/rrule_example.jpg)

## Installation

Add this to your `pubspec.yaml` dependencies:

```
rrule_generator: ^0.8.7
```

## How to use

Add the widget to your app like this:

```dart
RRuleGenerator(
  config: RRuleGeneratorConfig(),
  initialRRule: 'RRULE:FREQ=MONTHLY;INTERVAL=1;BYDAY=TU;BYSETPOS=1;COUNT=9',
  textDelegate: const EnglishRRuleTextDelegate(),
  withExcludeDates: true,
  onChange: print,
);
```

The current version of the widget has 23 text delegates that you can already use:
- English (default)
- Dutch
- Turkish
- French
- Danish
- Chinese
- Finnish
- Estonian
- Bulgarian
- German
- Greek
- Hungarian
- Spanish
- Slovenian
- Norwegian
- Italian
- Indonesian
- Czech
- Swedish
- Latvian
- Lithuanian
- Croatian
- Brazilian Portuguese
You can easily create your own ones as well!