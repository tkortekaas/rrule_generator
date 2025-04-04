import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rrule_generator/rrule_generator.dart';
import 'package:rrule_generator/src/periods/daily.dart';
import 'package:rrule_generator/src/periods/monthly.dart';
import 'package:rrule_generator/src/periods/period.dart';
import 'package:rrule_generator/src/periods/weekly.dart';
import 'package:rrule_generator/src/periods/yearly.dart';
import 'package:rrule_generator/src/pickers/exclude_dates.dart';
import 'package:rrule_generator/src/pickers/helpers.dart';
import 'package:rrule_generator/src/pickers/interval.dart';

class RRuleGenerator extends StatelessWidget {
  late final RRuleGeneratorConfig config;

  /// @deprecated Use locale or custom via localeBuilder instead. This parameter will be removed in future versions.
  @Deprecated(
      'Use locale or custom via localeBuilder instead. This parameter will be removed in future versions.')
  final RRuleTextDelegate? textDelegate;

  /// The locale to use for text translations. If not provided, will use the system locale.
  final RRuleLocale? locale;

  /// A builder function that creates a custom text delegate based on the current locale.
  /// This allows for custom translations outside the built-in ones.
  final RRuleTextDelegate Function(Locale locale)? localeBuilder;

  final void Function(String newValue)? onChange;
  final String initialRRule;
  final DateTime? initialDate;
  final bool withExcludeDates;
  final frequencyNotifier = ValueNotifier(0);
  final countTypeNotifier = ValueNotifier(0);
  final pickedDateNotifier = ValueNotifier(DateTime.now());
  final instancesController = TextEditingController(text: '1');
  final List<Period> _periodWidgets = [];
  final List<DateTime> excludeDates = [];
  late final ExcludeDates? _excludeDatesPicker;

  RRuleGenerator({
    super.key,
    RRuleGeneratorConfig? config,
    @Deprecated(
      'Use locale or custom via localeBuilder instead. This parameter will be removed in future versions.',
    )
    this.textDelegate,
    this.locale,
    this.localeBuilder,
    this.onChange,
    this.initialRRule = '',
    this.withExcludeDates = true,
    this.initialDate,
  }) {
    this.config = config ?? RRuleGeneratorConfig();
    handleInitialRRule();
  }

  RRuleTextDelegate _getTextDelegate(BuildContext context) {
    // Priority 1: Use deprecated textDelegate if provided
    if (textDelegate != null) return textDelegate!;

    var localeParts = Platform.localeName.split('_');

    Locale contextLocale = Locale(
      localeParts[0],
      localeParts.length > 1 ? localeParts.elementAt(1) : '',
    );

    // Priority 2: Use localeBuilder if provided
    if (localeBuilder != null) {
      return localeBuilder!(contextLocale);
    }

    // Priority 3: Use built-in delegates based on locale
    final currentLocale =
        locale ?? RRuleLocale.fromLocale(contextLocale) ?? RRuleLocale.en_GB;
    return RRuleTextDelegateRegistry.getDelegateForLocale(currentLocale);
  }

  void _initPeriodWidgets(BuildContext context) {
    if (_periodWidgets.isEmpty) {
      final textDelegate = _getTextDelegate(context);

      _periodWidgets.addAll([
        Yearly(
          config,
          textDelegate,
          valueChanged,
          initialRRule,
          initialDate ?? DateTime.now(),
        ),
        Monthly(
          config,
          textDelegate,
          valueChanged,
          initialRRule,
          initialDate ?? DateTime.now(),
        ),
        Weekly(
          config,
          textDelegate,
          valueChanged,
          initialRRule,
          initialDate ?? DateTime.now(),
        ),
        Daily(
          config,
          textDelegate,
          valueChanged,
          initialRRule,
          initialDate ?? DateTime.now(),
        )
      ]);

      _excludeDatesPicker = withExcludeDates
          ? ExcludeDates(
              config,
              textDelegate,
              valueChanged,
              initialRRule,
              initialDate ?? DateTime.now(),
              excludeDates,
            )
          : null;
    }
  }

  void handleInitialRRule() {
    if (initialRRule.contains('MONTHLY')) {
      frequencyNotifier.value = 1;
    } else if (initialRRule.contains('WEEKLY')) {
      frequencyNotifier.value = 2;
    } else if (initialRRule.contains('DAILY')) {
      frequencyNotifier.value = 3;
    } else if (initialRRule == '') {
      frequencyNotifier.value = 4;
    }

    if (initialRRule.contains('COUNT')) {
      countTypeNotifier.value = 1;
      final countIndex = initialRRule.indexOf('COUNT=') + 6;
      int countEnd = initialRRule.indexOf(';', countIndex);
      countEnd = countEnd == -1 ? initialRRule.length : countEnd;
      instancesController.text = initialRRule.substring(countIndex, countEnd);
    } else if (initialRRule.contains('UNTIL')) {
      countTypeNotifier.value = 2;
      final dateIndex = initialRRule.indexOf('UNTIL=') + 6;
      final dateEnd = initialRRule.indexOf(';', dateIndex);
      pickedDateNotifier.value = DateTime.parse(
        initialRRule.substring(
            dateIndex, dateEnd == -1 ? initialRRule.length : dateEnd),
      );
    }

    final exDateIndex = initialRRule.indexOf('EXDATE=') + 7;
    if (exDateIndex == 6) return;
    final exDateEnd = initialRRule.indexOf(';', exDateIndex);
    final exDateString = initialRRule.substring(
        exDateIndex, exDateEnd == -1 ? initialRRule.length : exDateEnd);
    final exDateList = exDateString.split(',');
    for (final exDate in exDateList) {
      excludeDates.add(DateTime.parse(exDate));
    }
  }

  void valueChanged() {
    final fun = onChange;
    if (fun != null) fun(getRRule());
  }

  String getRRule() {
    if (frequencyNotifier.value == 4) {
      return '';
    }

    final String excludeDates = _excludeDatesPicker?.getRRule() ?? '';
    if (countTypeNotifier.value == 0) {
      return 'RRULE:${_periodWidgets[frequencyNotifier.value].getRRule()}$excludeDates';
    } else if (countTypeNotifier.value == 1) {
      final instances = int.tryParse(instancesController.text) ?? 0;
      return 'RRULE:${_periodWidgets[frequencyNotifier.value].getRRule()};COUNT=${instances > 0 ? instances : 1}$excludeDates';
    }
    final pickedDate = pickedDateNotifier.value;

    final day = pickedDate.day > 9 ? '${pickedDate.day}' : '0${pickedDate.day}';
    final month =
        pickedDate.month > 9 ? '${pickedDate.month}' : '0${pickedDate.month}';

    return 'RRULE:${_periodWidgets[frequencyNotifier.value].getRRule()};UNTIL=${pickedDate.year}$month$day$excludeDates';
  }

  @override
  Widget build(BuildContext context) {
    // Use custom locale if provided, otherwise use context locale
    final locale = Localizations.localeOf(context);
    final textDelegate = _getTextDelegate(context);

    // Initialize period widgets with the correct locale
    _initPeriodWidgets(context);

    return SizedBox(
      width: double.maxFinite,
      child: ValueListenableBuilder(
        valueListenable: frequencyNotifier,
        builder: (context, period, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildElement(
              title: config.headerStyle.enabled ? textDelegate.repeat : null,
              style: config.headerStyle.textStyle,
              child: buildDropdown(
                child: DropdownButton(
                  isExpanded: true,
                  value: period,
                  onChanged: (newPeriod) {
                    frequencyNotifier.value = newPeriod!;
                    valueChanged();
                  },
                  items: List.generate(
                    5,
                    (index) => DropdownMenuItem(
                      value: index,
                      child: Text(
                        textDelegate.periods[index],
                        style: config.dropdownStyle.dropdownMenuItemTextStyle,
                      ),
                    ),
                  ),
                ),
                dropdownMenuStyle: config.dropdownStyle.dropdownMenuStyle,
              ),
            ),
            if (period != 4) ...[
              config.divider,
              _periodWidgets[period],
              config.divider,
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(textDelegate.end, style: config.labelStyle),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildElement(
                          style: config.labelStyle,
                          child: buildDropdown(
                            child: ValueListenableBuilder(
                              valueListenable: countTypeNotifier,
                              builder: (context, countType, child) =>
                                  DropdownButton(
                                isExpanded: true,
                                value: countType,
                                onChanged: (newCountType) {
                                  countTypeNotifier.value = newCountType!;
                                  valueChanged();
                                },
                                items: [
                                  DropdownMenuItem(
                                    value: 0,
                                    child: Text(
                                      textDelegate.neverEnds,
                                      style: config.dropdownStyle
                                          .dropdownMenuItemTextStyle,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 1,
                                    child: Text(
                                      textDelegate.endsAfter,
                                      style: config.dropdownStyle
                                          .dropdownMenuItemTextStyle,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 2,
                                    child: Text(
                                      textDelegate.endsOnDate,
                                      style: config.dropdownStyle
                                          .dropdownMenuItemTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            dropdownMenuStyle:
                                config.dropdownStyle.dropdownMenuStyle,
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: countTypeNotifier,
                        builder: (context, countType, child) => SizedBox(
                          width: countType == 0 ? 0 : 8,
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: countTypeNotifier,
                        builder: (context, countType, child) {
                          switch (countType) {
                            case 1:
                              return Row(
                                children: [
                                  SizedBox(
                                    width: 30,
                                    child: buildElement(
                                      style: config.labelStyle,
                                      child: IntervalPicker(
                                        instancesController,
                                        valueChanged,
                                        config: config,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    textDelegate.instances,
                                    style: config.labelStyle,
                                  ),
                                ],
                              );
                            case 2:
                              return SizedBox(
                                width: 120,
                                child: buildElement(
                                  // title: textDelegate.date,
                                  style: config.labelStyle,
                                  child: ValueListenableBuilder(
                                    valueListenable: pickedDateNotifier,
                                    builder: (context, pickedDate, child) =>
                                        OutlinedButton(
                                      onPressed: () async {
                                        final picked = await showDatePicker(
                                          context: context,
                                          locale: locale,
                                          initialDate: pickedDate,
                                          firstDate: DateTime.utc(2020, 10, 24),
                                          lastDate: DateTime(2100),
                                        );

                                        if (picked != null &&
                                            picked != pickedDate) {
                                          pickedDateNotifier.value = picked;
                                          valueChanged();
                                        }
                                      },
                                      style: config.datePickerStyle
                                          .datePickerButtonStyle,
                                      child: FittedBox(
                                        child: Text(
                                          DateFormat.yMd(locale.toString())
                                              .format(pickedDate),
                                          style: config.datePickerStyle
                                              .datePickerTextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            default:
                              return Container();
                          }
                        },
                      )
                    ],
                  ),
                  if (child != null) config.divider,
                  if (child != null) child,
                ],
              ),
            ],
          ],
        ),
        child: _excludeDatesPicker,
      ),
    );
  }
}
