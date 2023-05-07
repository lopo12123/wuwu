import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:wuwu/components/styled_text.dart';
import 'package:wuwu/styles/palette.dart';

class ToolBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final bool automaticallyImplyLeading;
  final Widget? leading;
  final Widget title;
  final bool noTitle;
  final List<Widget>? extraActions;

  void handleMax() async {
    (await windowManager.isMaximized())
        ? windowManager.unmaximize()
        : windowManager.maximize();
  }

  const ToolBar({
    super.key,
    this.automaticallyImplyLeading = true,
    this.leading,
    this.title = const StyledText.ZhuoKai('呜呜'),
    this.noTitle = false,
    this.extraActions,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanStart: (details) => windowManager.startDragging(),
      onDoubleTap: handleMax,
      child: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        centerTitle: true,
        leading: leading,
        title: noTitle ? null : title,
        actions: [
          ...?extraActions,
          IconButton(
            onPressed: windowManager.minimize,
            icon: const Icon(Icons.minimize),
          ),
          IconButton(
            onPressed: handleMax,
            icon: const Icon(Icons.fullscreen),
          ),
          IconButton(
            onPressed: windowManager.close,
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
