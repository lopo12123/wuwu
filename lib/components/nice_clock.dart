import 'package:flip_board/flip_clock.dart';
import 'package:flutter/material.dart';
import 'package:wuwu/styles/palette.dart';

// class NiceClock extends StatelessWidget {
//   const NiceClock({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return FlipClock(
//       flipDirection: AxisDirection.down,
//       width: 48,
//       height: 64,
//       digitSize: 32,
//       backgroundColor: Palette.b90,
//     );
//   }
// }

final niceClock = Material(
  textStyle: const TextStyle(
    fontFamily: 'JBMono',
    fontWeight: FontWeight.w100,
  ),
  child: FlipClock(
    flipDirection: AxisDirection.down,
    width: 52,
    height: 72,
    digitSize: 48,
    separatorWidth: 4,
    backgroundColor: Palette.b90,
  ),
);
