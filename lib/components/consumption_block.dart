import 'package:flutter/material.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/stores/isar/consumption.dart';

class ConsumptionBlock extends StatelessWidget {
  final Consumption record;

  const ConsumptionBlock({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StyledText.ShouShu(record.toString()),
    );
  }
}
