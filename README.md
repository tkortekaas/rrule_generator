# rrule_generator

RRuleGenerator is a widget for generating recurring rules, such as described
in [the iCalendar RFC](https://datatracker.ietf.org/doc/html/rfc5545)



## Installation

Add this to your `pubspec.yaml` dependencies:

```
rrule_generator: ^0.0.1
```

## How to use

Add the widget to your app like this:

```dart
RRuleGenerator(
  textDelegate: const EnglishRRuleTextDelegate(),
  onChange: (String newValue) => print(newValue),
);
```

The current version of the widget has 2 text delegates that you can already use. One in English and one in Dutch. You can easily create your own ones as well