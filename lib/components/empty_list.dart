import 'package:flutter/widgets.dart';
import 'package:wuwu/components/common/styled_text.dart';

Widget emptyListPlaceholder({
  String hint = '暂无内容',
  Color? color,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('images/pics/empty_list.png', width: 128, color: color),
      const SizedBox(height: 16),
      StyledText.XiaoBai(hint, color: color, fontSize: 22),
    ],
  );
}
