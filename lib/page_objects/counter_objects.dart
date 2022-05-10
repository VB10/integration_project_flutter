import 'package:flutter/cupertino.dart';

class CounterObjects {
  CounterObjects._init();
  static const buttonTooltip = "button_tool_tip";
  static const buttonCalculate = "calculate_text_button";
  static const ValueKey<CounterObjectsKeys> textFieldKey = ValueKey(CounterObjectsKeys.calculateTextFeild);
}

enum CounterObjectsKeys { calculateTextFeild }
