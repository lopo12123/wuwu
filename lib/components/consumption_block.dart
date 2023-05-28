import 'package:flutter/material.dart';
import 'package:wuwu/components/common/clickable.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/stores/isar/consumption.dart';
import 'package:wuwu/styles/palette.dart';

class ConsumptionBlock extends StatelessWidget {
  final EdgeInsets? margin;
  final Consumption record;
  final void Function(Consumption record)? onPressed;

  bool get income => record.income == true;

  String get desc =>
      record.desc?.isNotEmpty == true ? record.desc! : '该条记录暂无描述信息';

  const ConsumptionBlock({
    super.key,
    required this.record,
    this.margin,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var b = Container(
      margin: margin,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: income
            ? Palette.red.withOpacity(0.1)
            : Palette.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: StyledText.JBMono(
                  '${income ? '+' : '-'}${record.amount ?? '???'}',
                  color: income ? Palette.red : Palette.green,
                  fontSize: 14,
                ),
              ),
              StyledText.JBMono(
                record.createTime?.toString().substring(0, 19) ?? '暂无时间',
                color: Palette.b60,
                fontSize: 12,
              ),
            ],
          ),
          const SizedBox(height: 4),
          StyledText.ShouShu(
            desc,
            color: Palette.b60,
            fontSize: 12,
          ),
        ],
      ),
    );

    return onPressed == null
        ? b
        : Clickable.custom(b, onClick: () => onPressed!(record));
  }
}
