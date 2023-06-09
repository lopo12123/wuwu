import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/utils/text_formatter.dart';

class InputBox extends StatelessWidget {
  final bool autoFocus;
  final int lines;
  final bool numberType;
  final String hintText;
  final void Function(String code)? onChanged;

  final TextEditingController tc;

  InputBox({
    super.key,
    String? defaultText,
    this.autoFocus = false,
    this.lines = 1,
    this.numberType = false,
    this.hintText = '',
    this.onChanged,
  }) : tc = TextEditingController(text: defaultText);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0 * lines + 24,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Palette.b10,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: tc,
        autofocus: autoFocus,
        maxLines: lines,
        inputFormatters: numberType
            ? [
                FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                NumberTextInputFormatter(),
              ]
            : null,
        decoration: InputDecoration(
          isCollapsed: true,
          border: InputBorder.none,
          suffixIcon: GestureDetector(
            onTap: () {
              tc.clear();
              onChanged?.call('');
            },
            child: const Icon(Icons.cancel, color: Palette.b30, size: 24),
          ),
          suffixIconConstraints: const BoxConstraints(
            minHeight: 24,
            maxHeight: 24,
          ),
          hintStyle: const TextStyle(
            color: Palette.b40,
            fontSize: 16,
            fontFamily: StyledTextFamily.ShouShu,
          ),
          hintText: hintText,
        ),
        style: const TextStyle(
          fontFamily: StyledTextFamily.ShouShu,
          color: Palette.b90,
          fontSize: 16,
          height: 1.5,
        ),
        onTapOutside: (pEv) {
          // 点击外部自动失去焦点
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: onChanged,
      ),
    );
  }
}
