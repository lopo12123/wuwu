import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wuwu/components/graph_password.dart';
import 'package:wuwu/components/icon_image.dart';
import 'package:wuwu/components/nice_clock.dart';
import 'package:wuwu/components/styled_text.dart';
import 'package:wuwu/components/tool_bar.dart';
import 'package:wuwu/dialogs/loading.dart';
import 'package:wuwu/styles/palette.dart';

class EntryView extends StatelessWidget {
  const EntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        leading: Center(
          child: IconImage.use(IconImage.draw, size: 32, color: Palette.b10),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NiceClock,
            GraphPassword(),
          ],
        ),
      ),
    );
  }
}
