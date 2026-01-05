// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:rrule_generator/rrule_generator.dart';

/// Supported locales in the package
enum RRuleLocale {
  en_GB('en_GB'),
  ar_SA('ar_SA'),
  bg_BG('bg_BG'),
  cs_CZ('cs_CZ'),
  zh_CN('zh_CN'),
  hr_HR('hr_HR'),
  da_DK('da_DK'),
  nl_NL('nl_NL'),
  et_EE('et_EE'),
  fi_FI('fi_FI'),
  fr_FR('fr_FR'),
  de_DE('de_DE'),
  el_GR('el_GR'),
  hu_HU('hu_HU'),
  id_ID('id_ID'),
  it_IT('it_IT'),
  ja_JP('ja_JP'),
  ko_KR('ko_KR'),
  lv_LV('lv_LV'),
  lt_LT('lt_LT'),
  nb_NO('nb_NO'),
  pl_PL('pl_PL'),
  pt_BR('pt_BR'),
  ro_RO('ro_RO'),
  ru_RU('ru_RU'),
  sr_RS('sr_RS'),
  sl_SI('sl_SI'),
  es_ES('es_ES'),
  sv_SE('sv_SE'),
  tr_TR('tr_TR'),
  fa_IR('fa_IR');
  // Add more supported locales here

  final String code;

  const RRuleLocale(this.code);

  Locale toLocale() {
    final parts = code.split('_');
    return Locale(parts[0], parts.length > 1 ? parts.elementAt(1) : '');
  }

  static RRuleLocale? fromLocale(Locale locale) {
    final localeCode = locale.toLanguageTag().replaceFirst('-', '_');
    return RRuleLocale.values.firstWhere(
      (l) => l.code == localeCode,
      orElse: () => RRuleLocale.en_GB,
    );
  }
}

/// A registry to manage TextDelegates for different locales
class RRuleTextDelegateRegistry {
  static final Map<RRuleLocale, RRuleTextDelegate> _delegates = {
    RRuleLocale.en_GB: const EnglishRRuleTextDelegate(),
    RRuleLocale.ar_SA: const ArabicRRuleTextDelegate(),
    RRuleLocale.bg_BG: const BulgarianRRuleTextDelegate(),
    RRuleLocale.cs_CZ: const CzechRRuleTextDelegate(),
    RRuleLocale.zh_CN: const ChineseRRuleTextDelegate(),
    RRuleLocale.hr_HR: const CroatianRRuleTextDelegate(),
    RRuleLocale.da_DK: const DanishRRuleTextDelegate(),
    RRuleLocale.nl_NL: const DutchRRuleTextDelegate(),
    RRuleLocale.et_EE: const EstonianRRuleTextDelegate(),
    RRuleLocale.fi_FI: const FinnishRRuleTextDelegate(),
    RRuleLocale.fr_FR: const FrenchRRuleTextDelegate(),
    RRuleLocale.de_DE: const GermanRRuleTextDelegate(),
    RRuleLocale.el_GR: const GreekRRuleTextDelegate(),
    RRuleLocale.hu_HU: const HungarianRRuleTextDelegate(),
    RRuleLocale.id_ID: const IndonesianRRuleTextDelegate(),
    RRuleLocale.it_IT: const ItalianRRuleTextDelegate(),
    RRuleLocale.ja_JP: const JapaneseRRuleTextDelegate(),
    RRuleLocale.ko_KR: const KoreanRRuleTextDelegate(),
    RRuleLocale.lv_LV: const LatvianRRuleTextDelegate(),
    RRuleLocale.lt_LT: const LithuanianRRuleTextDelegate(),
    RRuleLocale.nb_NO: const NorwegianRRuleTextDelegate(),
    RRuleLocale.pl_PL: const PolishRRuleTextDelegate(),
    RRuleLocale.pt_BR: const PortugueseRRuleTextDelegate(),
    RRuleLocale.ru_RU: const RussianRRuleTextDelegate(),
    RRuleLocale.sr_RS: const SerbianRRuleTextDelegate(),
    RRuleLocale.sl_SI: const SlovenianRRuleTextDelegate(),
    RRuleLocale.es_ES: const SpanishRRuleTextDelegate(),
    RRuleLocale.sv_SE: const SwedishRRuleTextDelegate(),
    RRuleLocale.tr_TR: const TurkishRRuleTextDelegate(),
    RRuleLocale.fa_IR: const PersianRRuleTextDelegate(),
    // Add more supported locales here
  };

  /// Get the appropriate TextDelegate for the given locale
  static RRuleTextDelegate getDelegateForLocale(RRuleLocale locale) {
    return _delegates[locale] ?? const EnglishRRuleTextDelegate();
  }
}
