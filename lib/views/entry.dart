import 'package:flip_board/flip_clock.dart';
import 'package:flutter/material.dart';
import 'package:wuwu/components/graph_password.dart';
import 'package:wuwu/components/icon_image.dart';
import 'package:wuwu/components/nice_clock.dart';
import 'package:wuwu/platform_spec/components/tool_bar.dart';
import 'package:wuwu/styles/palette.dart';

class EntryView extends StatelessWidget {
  const EntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        leading: IconImage.use(IconImage.draw, size: 32, color: Palette.b10),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            niceClock,
            const GraphPassword(),
          ],
        ),
      ),
    );
  }
}
