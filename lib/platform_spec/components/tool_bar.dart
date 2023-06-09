import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:wuwu/components/common/styled_text.dart';
import 'package:wuwu/platform_spec/platform_spec.dart';
import 'package:wuwu/styles/palette.dart';

class ToolBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final bool automaticallyImplyLeading;
  final Widget? leading;
  final Widget title;
  final bool noTitle;
  final List<Widget>? actions;

  /// 仅适用于 win, 是否取消额外的 action 按钮(最小化/最大化/关闭)
  final bool extraActions;

  final tooltipTextStyle = const TextStyle(
    color: Palette.b10,
    fontSize: 14,
    fontFamily: 'JBMono',
  );

  void handleMax() async {
    (await windowManager.isMaximized())
        ? windowManager.unmaximize()
        : windowManager.maximize();
  }

  const ToolBar({
    super.key,
    this.automaticallyImplyLeading = true,
    this.leading,
    this.title = const StyledText.XiaoBai('呜呜'),
    this.noTitle = false,
    this.actions,
    this.extraActions = false,
  });

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: true,
      leading: leading == null ? null : Center(child: leading),
      title: noTitle ? null : title,
      actions: PlatformSpec.isWin && extraActions
          ? [
              ...?actions,
              Tooltip(
                message: 'minimize',
                textStyle: tooltipTextStyle,
                child: IconButton(
                  onPressed: windowManager.minimize,
                  icon: const Icon(Icons.minimize),
                ),
              ),
              Tooltip(
                message: 'maximize',
                textStyle: tooltipTextStyle,
                child: IconButton(
                  onPressed: handleMax,
                  icon: const Icon(Icons.fullscreen),
                ),
              ),
              Tooltip(
                message: 'close',
                textStyle: tooltipTextStyle,
                child: IconButton(
                  onPressed: windowManager.close,
                  icon: const Icon(Icons.close),
                ),
              ),
            ]
          : actions,
    );

    return PlatformSpec.isWin
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanStart: (details) => windowManager.startDragging(),
            onDoubleTap: handleMax,
            child: appBar,
          )
        : appBar;
  }
}
