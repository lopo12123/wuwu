import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/components/consumption_block.dart';
import 'package:wuwu/components/nice_clock.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';
import 'package:wuwu/stores/db_store.dart';
import 'package:wuwu/stores/global_store.dart';
import 'package:wuwu/stores/isar/consumption.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/utils/safe_print.dart';
import 'package:wuwu/views/bottom_sheet/bs_consumption_create.dart';

class _HomeController extends GetxController {
  final RxList<Consumption> today = <Consumption>[].obs;
  final RxList<Consumption> thisWeek = <Consumption>[].obs;
  final RxList<Consumption> thisMonth = <Consumption>[].obs;

  Map<String, double> get todayInOut {
    double i = 0, o = 0;
    for (var item in today) {
      item.income == true ? i += (item.amount ?? 0) : o += (item.amount ?? 0);
    }
    return {'in': i, 'out': o};
  }

  Map<String, double> get thisWeekInOut {
    double i = 0, o = 0;
    for (var item in thisWeek) {
      item.income == true ? i += (item.amount ?? 0) : o += (item.amount ?? 0);
    }
    return {'in': i, 'out': o};
  }

  Map<String, double> get thisMonthInOut {
    double i = 0, o = 0;
    for (var item in thisMonth) {
      item.income == true ? i += (item.amount ?? 0) : o += (item.amount ?? 0);
    }
    return {'in': i, 'out': o};
  }

  /// 刷新 今日/本周/本月 统计
  Future<void> syncDayWeekMonth() async {
    today(await DBStoreImpl.getConsumptionInNDay(1));
    thisWeek(await DBStoreImpl.getConsumptionThisWeek());
    thisMonth(await DBStoreImpl.getConsumptionThisMonth());
  }
}

class HomePage extends GetView<_HomeController> {
  Iterable<Consumption> get displayList => GlobalStoreImpl.store.recent20
      .take(GlobalStoreImpl.store.homeListCount.value);

  /// 新增一条记录
  Future<void> createConsumptionRecord() async {
    Consumption? consumption = await Get.bottomSheet(
      const BSConsumptionCreate(),
      isScrollControlled: true,
    );

    if (consumption != null) {
      await DBStoreImpl.addConsumption(consumption);
      GlobalStoreImpl.store.sync(consumption: true);
    }

    SafePrint.info('consumption: $consumption');
  }

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(_HomeController());

    return Scaffold(
      appBar: const ToolBar(extraActions: true),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.blue,
        onPressed: createConsumptionRecord,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const StyledText.XiaoBai(
                      '今日',
                      fontSize: 22,
                    ),
                    StyledText.JBMono('+${controller.todayInOut['in']}'),
                    StyledText.JBMono('-${controller.todayInOut['out']}'),
                  ],
                ),
                Column(
                  children: [
                    const StyledText.XiaoBai(
                      '本周',
                      fontSize: 22,
                    ),
                    StyledText.JBMono('+${controller.thisWeekInOut['in']}'),
                    StyledText.JBMono('-${controller.thisWeekInOut['out']}'),
                  ],
                ),
                Column(
                  children: [
                    const StyledText.XiaoBai(
                      '本月',
                      fontSize: 22,
                    ),
                    StyledText.JBMono('+${controller.thisMonthInOut['in']}'),
                    StyledText.JBMono('-${controller.thisMonthInOut['out']}'),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: Obx(
              () => ListView(
                padding: const EdgeInsets.all(16),
                children: displayList
                    .map(
                      (record) => ConsumptionBlock(
                        record: record,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // GlobalStoreImpl.store.sync(consumption: true);
              controller.syncDayWeekMonth();
            },
            child: StyledText.ShouShu('查询'),
          ),
        ],
      ),
    );
  }
}
