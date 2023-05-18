import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/styles/palette.dart';

Widget slidableTagItem({
  required Widget child,
  required VoidCallback onEdit,
  required VoidCallback onDelete,
}) {
  return Slidable(
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        CustomSlidableAction(
          padding: EdgeInsets.zero,
          foregroundColor: Palette.transparent,
          backgroundColor: Palette.transparent,
          onPressed: (ctx) => onEdit(),
          child: Container(
            width: double.maxFinite,
            height: 32,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Palette.green,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const StyledText.ShouShu(
              '编辑',
              color: Palette.b00,
              fontSize: 18,
            ),
          ),
        ),
        CustomSlidableAction(
          padding: EdgeInsets.zero,
          foregroundColor: Palette.transparent,
          backgroundColor: Palette.transparent,
          onPressed: (ctx) => onDelete(),
          child: Container(
            width: double.maxFinite,
            height: 32,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Palette.red,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const StyledText.ShouShu(
              '删除',
              color: Palette.b00,
              fontSize: 18,
            ),
          ),
        ),
      ],
    ),
    child: child,
  );
}
