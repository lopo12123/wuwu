import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/input_box.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/components/nice_clock.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';
import 'package:wuwu/stores/db_store.dart';
import 'package:wuwu/stores/isar/consumption.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/utils/safe_print.dart';
import 'package:wuwu/views/bottom_sheet/bs_consumption_create.dart';

class HomePage extends StatelessWidget {
  /// 新增一条记录
  Future<void> createConsumptionRecord() async {
    Consumption? consumption = await Get.bottomSheet(
      const BSConsumptionCreate(),
      isScrollControlled: true,
    );

    if(consumption != null) {
      DBStoreImpl.addConsumption(consumption);
    }

    SafePrint.info('consumption: $consumption');
  }

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ToolBar(extraActions: true),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.blue,
        onPressed: createConsumptionRecord,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          niceClock.paddingSymmetric(vertical: 32),
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                StyledText.ShouShu('最近 n 笔消费'),
                StyledText.ShouShu('最近 n 笔消费'),
                StyledText.ShouShu('最近 n 笔消费'),
                StyledText.ShouShu('最近 n 笔消费'),
                ElevatedButton(
                  onPressed: () async {
                    var r = await DBStoreImpl.getConsumptionByTime();
                    SafePrint.info(r);
                  },
                  child: StyledText.ShouShu('查询'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
