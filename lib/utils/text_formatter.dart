import 'package:flutter/services.dart';

class NumberTextInputFormatter extends TextInputFormatter {
  static const defaultDouble = 0.000001;
  static double strToFloat(String str, [double defaultValue = defaultDouble]) {
    try {
      return double.parse(str);
    } catch (e) {
      return defaultValue;
    }
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String value = newValue.text;
    int selectionIndex = newValue.selection.end;
    if (value == ".") {
      value = "0.";
      selectionIndex++;
    }else if (value == "-.") {
      value = "-0.";
      selectionIndex++;
    }else if (value != "" && value.startsWith("0") && value.length > 1 && value.substring(1,2) !='.') {
      value = "${value.substring(0,1)}.${value.substring(1)}";
      selectionIndex++;
    }else if (value != "" && value.startsWith("-0") && value.length > 2 && value.substring(2,3) !='.') {
      value = "${value.substring(0,2)}.${value.substring(2)}";
      selectionIndex++;
    }else if(value == "-"){
      value = "-";
    } else if (value != "" && value != defaultDouble.toString() && strToFloat(value, defaultDouble) == defaultDouble) {
      value = oldValue.text;
      selectionIndex = oldValue.selection.end;
    }else if(value !="" && value.contains(" ")){
      value = oldValue.text.trim();
      selectionIndex = oldValue.selection.end;
    }
    return TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
