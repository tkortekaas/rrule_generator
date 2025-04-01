import 'package:flutter/material.dart';

/// @deprecated Use RRuleTextDelegateRegistry instead. This class will be removed in future versions.
class RRuleGeneratorConfig {
  RRuleGeneratorConfig({
    /// @deprecated Use inputTextStyle instead
    @Deprecated('Use inputTextStyle instead')
    this.textFieldBorderColor = Colors.grey,

    /// @deprecated Use selectDayStyle instead
    @Deprecated('Use selectDayStyle instead') this.weekdayColor = Colors.white,

    /// @deprecated Use selectDayStyle instead
    @Deprecated('Use selectDayStyle instead')
    this.weekdayBackgroundColor = Colors.black54,

    /// @deprecated Use selectDayStyle instead
    @Deprecated('Use selectDayStyle instead')
    this.weekdaySelectedColor = Colors.white,

    /// @deprecated Use selectDayStyle instead
    @Deprecated('Use selectDayStyle instead')
    this.weekdaySelectedBackgroundColor = Colors.blueAccent,

    /// @deprecated Use inputTextStyle instead
    @Deprecated('Use inputTextStyle instead')
    this.textFieldBorderRadius = const Radius.circular(8),

    /// @deprecated Use headerStyle instead
    @Deprecated('Use headerStyle instead')
    this.headerTextStyle = const TextStyle(),

    /// @deprecated Use labelStyle instead
    @Deprecated('Use labelStyle instead') this.textStyle = const TextStyle(),

    /// @deprecated Use headerStyle instead
    @Deprecated('Use headerStyle instead') this.headerEnabled = true,

    /// New fields
    this.headerStyle = const RRuleHeaderStyle(),
    this.dropdownStyle = const RRuleDropdownStyle(),
    this.labelStyle = const TextStyle(),
    this.inputTextStyle = const RRuleInputTextStyle(),
    this.switchStyle = const RRuleSwitchStyle(),
    this.selectDayStyle = const RRuleSelectDayStyle(),
    this.datePickerStyle = const RRuleDatePickerStyle(),
    this.divider = const Divider(),
  });

  /// @deprecated Use inputTextStyle.borderColor instead
  final Color textFieldBorderColor;

  /// @deprecated Use selectDayStyle.textColor instead
  final Color weekdayColor;

  /// @deprecated Use selectDayStyle.backgroundColor instead
  final Color weekdayBackgroundColor;

  /// @deprecated Use selectDayStyle.selectedTextColor instead
  final Color weekdaySelectedColor;

  /// @deprecated Use selectDayStyle.selectedBackgroundColor instead
  final Color weekdaySelectedBackgroundColor;

  /// @deprecated Use inputTextStyle.borderRadius instead
  final Radius textFieldBorderRadius;

  /// @deprecated Use headerStyle.textStyle instead
  final TextStyle headerTextStyle;

  /// @deprecated Use labelStyle instead
  final TextStyle textStyle;

  /// @deprecated Use headerStyle.enabled instead
  final bool headerEnabled;

  final RRuleHeaderStyle headerStyle;
  final RRuleDropdownStyle dropdownStyle;
  final TextStyle labelStyle;
  final RRuleInputTextStyle inputTextStyle;
  final RRuleSwitchStyle switchStyle;
  final RRuleSelectDayStyle selectDayStyle;
  final RRuleDatePickerStyle datePickerStyle;
  final Widget divider;
}

class RRuleHeaderStyle {
  const RRuleHeaderStyle({
    this.enabled = true,
    this.textStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  });

  final bool enabled;
  final TextStyle textStyle;
}

class RRuleDropdownStyle {
  const RRuleDropdownStyle({
    this.dropdownMenuStyle = const BoxDecoration(),
    this.dropdownMenuTextStyle = const TextStyle(),
    this.dropdownMenuItemStyle = const BoxDecoration(),
    this.dropdownMenuItemTextStyle = const TextStyle(
      fontWeight: FontWeight.normal,
    ),
  });

  final BoxDecoration dropdownMenuStyle;
  final TextStyle dropdownMenuTextStyle;
  final BoxDecoration dropdownMenuItemStyle;
  final TextStyle dropdownMenuItemTextStyle;
}

class RRuleInputTextStyle {
  const RRuleInputTextStyle({
    this.inputTextDecoration = const InputDecoration(
      isDense: true,
    ),
    this.inputTextStyle = const TextStyle(),
  });

  final InputDecoration inputTextDecoration;
  final TextStyle inputTextStyle;
}

class RRuleSwitchStyle {
  /// Creates a style configuration for switches in the RRule generator.
  ///
  /// [isCupertinoStyle] determines whether to use Cupertino or Material switch style.
  ///
  /// [thumbColor] sets the color of the switch thumb/knob.
  ///
  /// [thumbSize] sets the size of the thumb icon when using Material style.
  ///
  /// [inactiveThumbSize] sets the size of the thumb icon when disabled in Material style.
  ///
  /// [activeTrackColor] sets the track color when the switch is on.
  ///
  /// [inactiveTrackColor] sets the track color when the switch is off.
  ///
  /// [trackOutlineWidth] sets the width of the track outline in Material style.
  ///
  /// [trackOutlineColor] sets the color of the track outline in Material style.
  ///
  /// [switchTextStyle] sets the text style for the switch label.
  const RRuleSwitchStyle({
    this.isCupertinoStyle = false,
    this.thumbColor = Colors.white,
    this.thumbSize = 14.0,
    this.inactiveThumbSize = 12.0,
    this.activeTrackColor = Colors.green,
    this.inactiveTrackColor = Colors.grey,
    this.trackOutlineWidth = 2.0,
    this.trackOutlineColor = Colors.red,
    this.switchTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  });

  final bool isCupertinoStyle;
  final Color thumbColor;
  final double thumbSize;
  final double inactiveThumbSize;
  final Color activeTrackColor;
  final Color inactiveTrackColor;
  final double trackOutlineWidth;
  final Color trackOutlineColor;
  final TextStyle switchTextStyle;
}

class RRuleSelectDayStyle {
  const RRuleSelectDayStyle({
    this.dayStyle = const BoxDecoration(),
    this.dayTextStyle = const TextStyle(),
    this.selectedDayStyle = const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blue,
    ),
    this.selectedDayTextStyle = const TextStyle(
      color: Colors.white,
    ),
  });
  final BoxDecoration dayStyle;
  final TextStyle dayTextStyle;
  final BoxDecoration selectedDayStyle;
  final TextStyle selectedDayTextStyle;
}

class RRuleDatePickerStyle {
  const RRuleDatePickerStyle({
    this.datePickerTextStyle = const TextStyle(fontSize: 13),
    this.datePickerButtonStyle = const ButtonStyle(),
  });
  final TextStyle datePickerTextStyle;
  final ButtonStyle datePickerButtonStyle;
}
