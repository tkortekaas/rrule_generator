# rrule_generator

RRuleGenerator is a widget for generating recurrence rules, such as described
in [the iCalendar RFC](https://datatracker.ietf.org/doc/html/rfc5545)

![Example one](https://jelter.net/rrule_example.png)

## Installation

Add this to your `pubspec.yaml` dependencies:

```
rrule_generator: ^0.1.1
```

## How to use

Add the widget to your app like this:

```dart
RRuleGenerator(
  initialRRule: 'RRULE:FREQ=MONTHLY;INTERVAL=1;BYDAY=TU;BYSETPOS=1;COUNT=9',
  textDelegate: const EnglishRRuleTextDelegate(),
  onChange: (String newValue) => print(newValue),
);
```

The current version of the widget has 6 text delegates that you can already use. One in English, one in Dutch, one in
Turkish, French, Finnish, and one in Indonesian. You can easily create your own ones as well!