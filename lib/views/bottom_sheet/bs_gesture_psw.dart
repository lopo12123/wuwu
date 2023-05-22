import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/dialogs/gesture_psw.dart';
import 'package:wuwu/extension/list.dart';
import 'package:wuwu/stores/global_store.dart';
import 'package:wuwu/styles/button.dart';
import 'package:wuwu/utils/my_toast.dart';
import 'package:wuwu/utils/safe_print.dart';
import 'package:wuwu/views/bottom_sheet/bs_base.dart';

class _BSGesturePswController extends GetxController {
  List<int> get gpsw => GlobalStoreImpl.store.gesturePsw.toList();

  /// 检验手势密码
  Future<bool> _preCheck() async {
    List<int>? psw = await GesturePswDialog.show('验证手势密码');
    bool isVerified = psw != null && gpsw.isEqualTo(psw);
    return isVerified;
  }

  /// 设置手势密码
  Future<void> createGPsw() async {
    List<int>? psw1 = await GesturePswDialog.show('绘制解锁图案');
    if (psw1 == null) return;

    List<int>? psw2 = await GesturePswDialog.show('再次绘制图案');
    if (psw2 == null) return;

    bool isEqual = psw1.isEqualTo(psw2);
    if (!isEqual) {
      SafePrint.info('[createGPsw] inconsistent (psw1: $psw1, psw2: $psw2)');
      MyToast.warn('两次输入不一致');
    } else {
      GlobalStoreImpl.store.changeGesturePsw(psw1);
      MyToast.success('设置成功');
    }
  }

  /// 修改手势密码
  Future<void> editGPsw() async {
    if (await _preCheck()) {
      createGPsw();
    } else {
      MyToast.warn('验证失败');
    }
  }

  /// 停用手势密码
  Future<void> removeGPsw() async {
    if (await _preCheck()) {
      GlobalStoreImpl.store.changeGesturePsw([]);
    } else {
      MyToast.warn('验证失败');
    }
  }

  @override
  void onInit() {
    super.onInit();

    GlobalStoreImpl.store.sync(gpsw: true);

    SafePrint.info('gpsw: $gpsw');
  }
}

class BSGesturePsw extends GetView<_BSGesturePswController> {
  const BSGesturePsw({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(_BSGesturePswController());

    return bsBase(
      title: '手势密码',
      operators: false,
      children: [
        SizedBox(
          width: Get.width,
          height: 40,
          child: Obx(
            () => TextButton(
              style: MyButtonStyle.picker,
              onPressed: controller.gpsw.isEmpty ? controller.createGPsw : null,
              child: const StyledText.ShouShu('设置', fontSize: 16),
            ),
          ),
        ),
        const Divider(height: 1, thickness: 0.5, indent: 16, endIndent: 16),
        SizedBox(
          width: Get.width,
          height: 40,
          child: Obx(
            () => TextButton(
              style: MyButtonStyle.picker,
              onPressed: controller.gpsw.isEmpty ? null : controller.editGPsw,
              child: const StyledText.ShouShu('修改', fontSize: 16),
            ),
          ),
        ),
        const Divider(height: 1, thickness: 0.5, indent: 16, endIndent: 16),
        SizedBox(
          width: Get.width,
          height: 40,
          child: Obx(
            () => TextButton(
              style: MyButtonStyle.picker,
              onPressed: controller.gpsw.isEmpty ? null : controller.removeGPsw,
              child: const StyledText.ShouShu('停用', fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
