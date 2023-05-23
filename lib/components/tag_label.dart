import 'package:flutter/material.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/stores/isar/tag.dart';
import 'package:wuwu/styles/palette.dart';

Widget tagLabel({required Tag tag, EdgeInsets? margin}) {
  return Container(
    height: 30,
    margin: margin,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Palette.b30),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 8,
          backgroundColor: Color(tag.colorHex ?? Palette.b20.value),
        ),
        const SizedBox(width: 8),
        StyledText.ShouShu(tag.tagName ?? ''),
      ],
    ),
  );
}
