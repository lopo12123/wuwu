import 'package:flutter/material.dart';

/// 自定义字体类名
abstract class StyledTextFamily {
  static const JBMono = 'JBMono';
  static const ShouShu = 'ShouShu';
  static const XiaoBai = 'XiaoBai';
}

/// 自定义字体
class StyledText extends StatelessWidget {
  final String data;
  final String fontFamily;
  final bool selectable;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? lineHeight;
  final bool? underline;
  final List<Shadow>? shadows;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  final int? maxLines;

  const StyledText(
    this.data, {
    super.key,
    required this.fontFamily,
    this.selectable = false,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.lineHeight,
    this.underline,
    this.shadows,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.maxLines,
  }) : assert(overflow != null ? selectable == false : true);

  const StyledText.JBMono(
    this.data, {
    super.key,
    this.selectable = false,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.lineHeight,
    this.underline,
    this.shadows,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.maxLines,
  }) : fontFamily = StyledTextFamily.JBMono;

  const StyledText.ShouShu(
    this.data, {
    super.key,
    this.selectable = false,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.lineHeight,
    this.underline,
    this.shadows,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.maxLines,
  }) : fontFamily = StyledTextFamily.ShouShu;

  const StyledText.XiaoBai(
    this.data, {
    super.key,
    this.selectable = false,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.lineHeight,
    this.underline,
    this.shadows,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.maxLines,
  }) : fontFamily = StyledTextFamily.XiaoBai;

  @override
  Widget build(BuildContext context) {
    return selectable
        ? SelectableText(
            data,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              height: (fontSize != null && lineHeight != null)
                  ? (lineHeight! / fontSize!)
                  : null,
              decoration: underline == true ? TextDecoration.underline : null,
            ),
            textAlign: textAlign,
            textDirection: textDirection,
            maxLines: maxLines,
          )
        : Text(
            data,
            style: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                height: (fontSize != null && lineHeight != null)
                    ? (lineHeight! / fontSize!)
                    : null,
                decoration: underline == true ? TextDecoration.underline : null,
                shadows: shadows),
            textAlign: textAlign,
            textDirection: textDirection,
            overflow: overflow,
            maxLines: maxLines,
          );
  }
}
