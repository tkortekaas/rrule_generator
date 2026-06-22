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

class RRuleGenerator extends StatefulWidget {
  late final RRuleGeneratorConfig config;

  /// @deprecated Use locale or custom via localeBuilder instead. This parameter will be removed in future versions.
  @Deprecated(
    'Use locale or custom via localeBuilder instead. This parameter will be removed in future versions.',
  )
  final RRuleTextDelegate? textDelegate;

  /// The locale to use for text translations. If not provided, will use the system locale.
  final RRuleLocale? locale;

  /// A builder function that creates a custom text delegate based on the current locale.
  /// This allows for custom translations outside the built-in ones.
  final RRuleTextDelegate Function(Locale locale)? localeBuilder;

  final void Function(String newValue)? onChange;
  final String initialRRule;
  late final DateTime initialDate;
  final bool withExcludeDates;

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
    final DateTime? initialDate,
  }) {
    this.config = config ?? RRuleGeneratorConfig();
    this.initialDate = initialDate ?? DateTime.now();
  }

  @override
  State<RRuleGenerator> createState() => _RRuleGeneratorState();
}

class _RRuleGeneratorState extends State<RRuleGenerator> {
  final frequencyNotifier = ValueNotifier(RRulePeriod.never.index);
  final countTypeNotifier = ValueNotifier(0);
  final pickedDateNotifier = ValueNotifier(DateTime.now());
  final instancesController = TextEditingController(text: '1');
  final List<Period> _periodWidgets = [];
  final List<DateTime> excludeDates = [];
  late final ExcludeDates? _excludeDatesPicker;

  @override
  void initState() {
    super.initState();
    handleInitialRRule();
  }

  @override
  void dispose() {
    frequencyNotifier.dispose();
    countTypeNotifier.dispose();
    pickedDateNotifier.dispose();
    instancesController.dispose();
    super.dispose();
  }

  RRuleTextDelegate _getTextDelegate(BuildContext context) {
    // Priority 1: Use deprecated textDelegate if provided
    if (widget.textDelegate != null) return widget.textDelegate!;

    final contextLocale = Localizations.localeOf(context);

    // Priority 2: Use localeBuilder if provided
    if (widget.localeBuilder != null) {
      return widget.localeBuilder!(contextLocale);
    }

    // Priority 3: Use built-in delegates based on locale
    final currentLocale = widget.locale ??
        RRuleLocale.fromLocale(contextLocale) ??
        RRuleLocale.en_GB;
    return RRuleTextDelegateRegistry.getDelegateForLocale(currentLocale);
  }

  void _initPeriodWidgets(BuildContext context) {
    if (_periodWidgets.isEmpty) {
      final textDelegate = _getTextDelegate(context);

      _periodWidgets.addAll([
        Yearly(
          widget.config,
          textDelegate,
          valueChanged,
          widget.initialRRule,
          widget.initialDate,
        ),
        Monthly(
          widget.config,
          textDelegate,
          valueChanged,
          widget.initialRRule,
          widget.initialDate,
        ),
        Weekly(
          widget.config,
          textDelegate,
          valueChanged,
          widget.initialRRule,
          widget.initialDate,
        ),
        Daily(
          widget.config,
          textDelegate,
          valueChanged,
          widget.initialRRule,
          widget.initialDate,
        ),
      ]);

      _excludeDatesPicker = widget.withExcludeDates
          ? ExcludeDates(
              widget.config,
              textDelegate,
              valueChanged,
              widget.initialRRule,
              widget.initialDate,
              excludeDates,
            )
          : null;
    }
  }

  void handleInitialRRule() {
    if (widget.initialRRule.contains('MONTHLY') &&
        widget.config.enabledPeriods.contains(RRulePeriod.monthly)) {
      frequencyNotifier.value = RRulePeriod.monthly.index;
    } else if (widget.initialRRule.contains('WEEKLY') &&
        widget.config.enabledPeriods.contains(RRulePeriod.weekly)) {
      frequencyNotifier.value = RRulePeriod.weekly.index;
    } else if (widget.initialRRule.contains('DAILY') &&
        widget.config.enabledPeriods.contains(RRulePeriod.daily)) {
      frequencyNotifier.value = RRulePeriod.daily.index;
    } else if (widget.initialRRule == '') {
      frequencyNotifier.value = widget.config.enabledPeriods.last.index;
    }

    if (widget.initialRRule.contains('COUNT')) {
      countTypeNotifier.value = 1;
      final countIndex = widget.initialRRule.indexOf('COUNT=') + 6;
      int countEnd = widget.initialRRule.indexOf(';', countIndex);
      countEnd = countEnd == -1 ? widget.initialRRule.length : countEnd;
      instancesController.text =
          widget.initialRRule.substring(countIndex, countEnd);
    } else if (widget.initialRRule.contains('UNTIL')) {
      countTypeNotifier.value = 2;
      final dateIndex = widget.initialRRule.indexOf('UNTIL=') + 6;
      final dateEnd = widget.initialRRule.indexOf(';', dateIndex);
      pickedDateNotifier.value = DateTime.parse(
        widget.initialRRule.substring(
          dateIndex,
          dateEnd == -1 ? widget.initialRRule.length : dateEnd,
        ),
      );
    }

    final exDateIndex = widget.initialRRule.indexOf('EXDATE=') + 7;
    if (exDateIndex == 6) return;
    final exDateEnd = widget.initialRRule.indexOf(';', exDateIndex);
    final exDateString = widget.initialRRule.substring(
      exDateIndex,
      exDateEnd == -1 ? widget.initialRRule.length : exDateEnd,
    );
    final exDateList = exDateString.split(',');
    for (final exDate in exDateList) {
      excludeDates.add(DateTime.parse(exDate));
    }
  }

  void valueChanged() {
    widget.onChange?.call(getRRule());
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
    final textDelegate = _getTextDelegate(context);
    final locale = widget.locale?.toLocale() ?? Locale(textDelegate.locale);

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
              title: widget.config.headerStyle.enabled
                  ? textDelegate.repeat
                  : null,
              style: widget.config.headerStyle.textStyle,
              child: buildDropdown(
                child: DropdownButton(
                  isExpanded: true,
                  value: period,
                  onChanged: (newPeriod) {
                    frequencyNotifier.value = newPeriod!;
                    valueChanged();
                  },
                  items: List.generate(widget.config.enabledPeriods.length,
                      (index) {
                    final periodEnum = widget.config.enabledPeriods[index];

                    return DropdownMenuItem(
                      value: periodEnum.index,
                      child: Text(
                        periodEnum.toText(textDelegate),
                        style: widget
                            .config.dropdownStyle.dropdownMenuItemTextStyle,
                      ),
                    );
                  }),
                ),
                dropdownMenuStyle:
                    widget.config.dropdownStyle.dropdownMenuStyle,
              ),
            ),
            if (period != 4) ...[
              widget.config.divider,
              _periodWidgets[period],
              widget.config.divider,
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Text(textDelegate.end, style: widget.config.labelStyle),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildElement(
                          style: widget.config.labelStyle,
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
                                      style: widget.config.dropdownStyle
                                          .dropdownMenuItemTextStyle,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 1,
                                    child: Text(
                                      textDelegate.endsAfter,
                                      style: widget.config.dropdownStyle
                                          .dropdownMenuItemTextStyle,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 2,
                                    child: Text(
                                      textDelegate.endsOnDate,
                                      style: widget.config.dropdownStyle
                                          .dropdownMenuItemTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            dropdownMenuStyle:
                                widget.config.dropdownStyle.dropdownMenuStyle,
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: countTypeNotifier,
                        builder: (context, countType, child) =>
                            SizedBox(width: countType == 0 ? 0 : 8),
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
                                      style: widget.config.labelStyle,
                                      child: IntervalPicker(
                                        instancesController,
                                        valueChanged,
                                        config: widget.config,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    textDelegate.instances,
                                    style: widget.config.labelStyle,
                                  ),
                                ],
                              );
                            case 2:
                              return SizedBox(
                                width: 120,
                                child: buildElement(
                                  // title: textDelegate.date,
                                  style: widget.config.labelStyle,
                                  child: ValueListenableBuilder(
                                    valueListenable: pickedDateNotifier,
                                    builder: (context, pickedDate, child) =>
                                        OutlinedButton(
                                      onPressed: () async {
                                        final picked = await showDatePicker(
                                          context: context,
                                          locale: locale,
                                          initialDate: pickedDate,
                                          firstDate: DateTime.utc(
                                            2020,
                                            10,
                                            24,
                                          ),
                                          lastDate: DateTime(2100),
                                        );

                                        if (picked != null &&
                                            picked != pickedDate) {
                                          pickedDateNotifier.value = picked;
                                          valueChanged();
                                        }
                                      },
                                      style: widget.config.datePickerStyle
                                          .datePickerButtonStyle,
                                      child: FittedBox(
                                        child: Text(
                                          DateFormat.yMd(
                                            locale.toString(),
                                          ).format(pickedDate),
                                          style: widget.config.datePickerStyle
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
                      ),
                    ],
                  ),
                  if (child != null) widget.config.divider,
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
