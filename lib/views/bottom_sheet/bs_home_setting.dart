import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/stores/global_store.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/utils/my_toast.dart';
import 'package:wuwu/views/bottom_sheet/bs_base.dart';

class _BSHomeSettingController extends GetxController {
  int get type => GlobalStoreImpl.store.homeListType.value;

  int get count => GlobalStoreImpl.store.homeListCount.value;

  Future<void> changeType(int v) async {
    if (type == v) return;

    await GlobalStoreImpl.store.changeType(v);
    MyToast.success('切换成功');
  }

  Future<void> changeCount(int v) async {
    if (count == v) return;

    await GlobalStoreImpl.store.changeCount(v);
    MyToast.success('切换成功');
  }

  @override
  void onInit() async {
    super.onInit();

    GlobalStoreImpl.store.sync(homeCfg: true);
  }
}

class BSHomeSetting extends GetView<_BSHomeSettingController> {
  const BSHomeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(_BSHomeSettingController());

    return bsBase(
      title: '首页设置',
      operators: false,
      children: [
        Obx(
          () => Row(
            children: [
              const StyledText.XiaoBai('展示类型:', fontSize: 22)
                  .paddingOnly(right: 16),
              TextButton(
                onPressed: () => controller.changeType(0),
                child: StyledText.ShouShu(
                  '全部',
                  color: Palette.purple,
                  fontSize: 16,
                  underline: controller.type == 0,
                ),
              ),
              TextButton(
                onPressed: () => controller.changeType(1),
                child: StyledText.ShouShu(
                  '收入',
                  color: Palette.purple,
                  fontSize: 16,
                  underline: controller.type == 1,
                ),
              ),
              TextButton(
                onPressed: () => controller.changeType(2),
                child: StyledText.ShouShu(
                  '支出',
                  color: Palette.purple,
                  fontSize: 16,
                  underline: controller.type == 2,
                ),
              ),
            ],
          ),
        ).paddingAll(16),
        const Divider(height: 1, thickness: 1, indent: 16, endIndent: 16),
        Obx(
          () => Row(
            children: [
              const StyledText.XiaoBai('展示数量:', fontSize: 22)
                  .paddingOnly(right: 16),
              TextButton(
                onPressed: () => controller.changeCount(3),
                child: StyledText.ShouShu(
                  '3',
                  color: Palette.purple,
                  fontSize: 16,
                  underline: controller.count == 3,
                ),
              ),
              TextButton(
                onPressed: () => controller.changeCount(5),
                child: StyledText.ShouShu(
                  '5',
                  color: Palette.purple,
                  fontSize: 16,
                  underline: controller.count == 5,
                ),
              ),
              TextButton(
                onPressed: () => controller.changeCount(10),
                child: StyledText.ShouShu(
                  '10',
                  color: Palette.purple,
                  fontSize: 16,
                  underline: controller.count == 10,
                ),
              ),
              TextButton(
                onPressed: () => controller.changeCount(15),
                child: StyledText.ShouShu(
                  '15',
                  color: Palette.purple,
                  fontSize: 16,
                  underline: controller.count == 15,
                ),
              ),
            ],
          ),
        ).paddingAll(16),
      ],
    );
  }
}
