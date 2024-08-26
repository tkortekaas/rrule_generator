import 'package:flutter/material.dart';
import 'package:rrule_generator/localizations/english.dart';
import 'package:rrule_generator/localizations/text_delegate.dart';
import 'package:rrule_generator/src/periods/period.dart';
import 'package:rrule_generator/src/pickers/exclude_dates.dart';
import 'package:rrule_generator/src/pickers/interval.dart';
import 'package:rrule_generator/src/periods/yearly.dart';
import 'package:rrule_generator/src/periods/monthly.dart';
import 'package:rrule_generator/src/periods/weekly.dart';
import 'package:rrule_generator/src/periods/daily.dart';
import 'package:rrule_generator/src/pickers/helpers.dart';
import 'package:intl/intl.dart';
import 'package:rrule_generator/src/rrule_generator_config.dart';

class RRuleGenerator extends StatelessWidget {
  late final RRuleGeneratorConfig config;
  final RRuleTextDelegate textDelegate;
  final void Function(String newValue)? onChange;
  final String initialRRule;
  final DateTime? initialDate;
  final bool withExcludeDates;
  final frequencyNotifier = ValueNotifier(0);
  final countTypeNotifier = ValueNotifier(0);
  final pickedDateNotifier = ValueNotifier(DateTime.now());
  final instancesController = TextEditingController(text: '1');
  final List<Period> periodWidgets = [];
  late final ExcludeDates? _excludeDatesPicker;

  RRuleGenerator(
      {super.key,
      RRuleGeneratorConfig? config,
      this.textDelegate = const EnglishRRuleTextDelegate(),
      this.onChange,
      this.initialRRule = '',
      this.withExcludeDates = false,
      this.initialDate}) {
    this.config = config ?? RRuleGeneratorConfig();

    periodWidgets.addAll([
      Yearly(
        this.config,
        textDelegate,
        valueChanged,
        initialRRule,
        initialDate ?? DateTime.now(),
      ),
      Monthly(
        this.config,
        textDelegate,
        valueChanged,
        initialRRule,
        initialDate ?? DateTime.now(),
      ),
      Weekly(
        this.config,
        textDelegate,
        valueChanged,
        initialRRule,
        initialDate ?? DateTime.now(),
      ),
      Daily(
        this.config,
        textDelegate,
        valueChanged,
        initialRRule,
        initialDate ?? DateTime.now(),
      )
    ]);
    _excludeDatesPicker = withExcludeDates
        ? ExcludeDates(
            this.config,
            textDelegate,
            valueChanged,
            initialRRule,
            initialDate ?? DateTime.now(),
          )
        : null;

    handleInitialRRule();
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
      return 'RRULE:${periodWidgets[frequencyNotifier.value].getRRule()}$excludeDates';
    } else if (countTypeNotifier.value == 1) {
      final instances = int.tryParse(instancesController.text) ?? 0;
      return 'RRULE:${periodWidgets[frequencyNotifier.value].getRRule()};COUNT=${instances > 0 ? instances : 1}$excludeDates';
    }
    final pickedDate = pickedDateNotifier.value;

    final day = pickedDate.day > 9 ? '${pickedDate.day}' : '0${pickedDate.day}';
    final month =
        pickedDate.month > 9 ? '${pickedDate.month}' : '0${pickedDate.month}';

    return 'RRULE:${periodWidgets[frequencyNotifier.value].getRRule()};UNTIL=${pickedDate.year}$month$day$excludeDates';
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.maxFinite,
        child: ValueListenableBuilder(
          valueListenable: frequencyNotifier,
          builder: (context, period, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildContainer(
                child: buildElement(
                  title: config.headerEnabled ? textDelegate.repeat : null,
                  style: config.headerTextStyle,
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
                            style: config.textStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (period != 4) ...[
                const Divider(),
                periodWidgets[period],
                const Divider(),
                buildContainer(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: buildElement(
                              title: textDelegate.end,
                              style: config.textStyle,
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
                                          style: config.textStyle,
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: 1,
                                        child: Text(
                                          textDelegate.endsAfter,
                                          style: config.textStyle,
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: 2,
                                        child: Text(
                                          textDelegate.endsOnDate,
                                          style: config.textStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                                  return Expanded(
                                    child: buildElement(
                                      title: textDelegate.instances,
                                      style: config.textStyle,
                                      child: IntervalPicker(
                                        instancesController,
                                        valueChanged,
                                        config: config,
                                      ),
                                    ),
                                  );
                                case 2:
                                  return Expanded(
                                    child: buildElement(
                                      title: textDelegate.date,
                                      style: config.textStyle,
                                      child: ValueListenableBuilder(
                                        valueListenable: pickedDateNotifier,
                                        builder: (context, pickedDate, child) =>
                                            OutlinedButton(
                                          onPressed: () async {
                                            final picked = await showDatePicker(
                                              context: context,
                                              locale: Locale(
                                                textDelegate.locale
                                                    .split('-')[0],
                                                textDelegate.locale
                                                        .contains('-')
                                                    ? textDelegate.locale
                                                        .split('-')[1]
                                                    : '',
                                              ),
                                              initialDate: pickedDate,
                                              firstDate:
                                                  DateTime.utc(2020, 10, 24),
                                              lastDate: DateTime(2100),
                                            );

                                            if (picked != null &&
                                                picked != pickedDate) {
                                              pickedDateNotifier.value = picked;
                                              valueChanged();
                                            }
                                          },
                                          style: OutlinedButton.styleFrom(
                                            side: const BorderSide(
                                              color: Colors.black,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 24,
                                            ),
                                          ),
                                          child: SizedBox(
                                            width: double.maxFinite,
                                            child: Text(
                                              DateFormat.yMd(
                                                textDelegate.locale,
                                              ).format(pickedDate),
                                              style: config.textStyle.copyWith(
                                                  color: Colors.black),
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
                    ],
                  ),
                ),
              ],
              if (child != null) const Divider(),
              if (child != null) child,
            ],
          ),
          child: _excludeDatesPicker,
        ),
      );
}
