# rrule_generator

RRuleGenerator is a widget for generating recurrence rules, such as described
in [the iCalendar RFC](https://datatracker.ietf.org/doc/html/rfc5545)

This widget is based on the [rrule](https://pub.dev/packages/rrule) and [teno_rrule](https://pub.dev/packages/teno_rrule) packages.

The widget is actively used in the [Calendar Clock](https://calendarclock.app) app.

![Default](https://github.com/duy84/rrule_generator/blob/master/example/screenshots/default.png?raw=true)

## Installation

Add this to your `pubspec.yaml` dependencies:

```
rrule_generator: ^0.9.3
```

## How to use

#### Add the widget to your app like this:

```dart
RRuleGenerator(
  config: RRuleGeneratorConfig(),
  initialRRule: 'RRULE:FREQ=MONTHLY;INTERVAL=1;BYDAY=TU;BYSETPOS=1;COUNT=9',
  withExcludeDates: true,
  onChange: print,
);
```

#### Support language:

![Language](/example/screenshots/custom_language.png)
```dart
RRuleGenerator(
  config: RRuleGeneratorConfig(),
  initialRRule: 'RRULE:FREQ=MONTHLY;INTERVAL=1;BYDAY=TU;BYSETPOS=1;COUNT=9',
  locale: RRuleLocale.de_DE, // <- Choose your language
  withExcludeDates: true,
  onChange: print,
);
```

#### Define your language with localeBuilder:

```dart
RRuleGenerator(
  config: RRuleGeneratorConfig(),
  initialRRule: 'RRULE:FREQ=MONTHLY;INTERVAL=1;BYDAY=TU;BYSETPOS=1;COUNT=9',
  localeBuilder: (locale) {
    // Make your locale by implements RRuleTextDelegate class
    return YourLocale();
  },
  withExcludeDates: true,
  onChange: print,
);
```
#### Custom your style:

![Language](/example/screenshots/custom_style.png)
```dart
RRuleGenerator(
  config: RRuleGeneratorConfig(
    headerStyle: const RRuleHeaderStyle(
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    ),
    switchStyle: RRuleSwitchStyle(
      isCupertinoStyle: true,
      activeTrackColor: Colors.blue,
      inactiveTrackColor: Colors.grey,
    ),
    datePickerStyle: RRuleDatePickerStyle(
      datePickerButtonStyle: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        side: WidgetStateProperty.all(
          BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),
      ),
      datePickerTextStyle: TextStyle(
        fontSize: 13,
        color: Colors.blue,
      ),
    ),
    divider: Divider(
      thickness: 0.5,
      color: Colors.blue,
    ),
  ),
  initialRRule: 'RRULE:FREQ=MONTHLY;INTERVAL=1;BYDAY=TU;BYSETPOS=1;COUNT=9',
  onChange: print,
);
```

#### Check out the [example](https://github.com/tkortekaas/rrule_generator/tree/master/example) for more details.

#### The current version of the widget has 30 text delegates that you can already use:
- English (default)
- Dutch
- Turkish
- French
- Danish
- Chinese
- Finnish
- Estonian
- Bulgarian
- Polish
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
- Persian
- Russian
- Icelandic
- Serbian
- Arabic
- Albanian

You can easily create your own ones as well!