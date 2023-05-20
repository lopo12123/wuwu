import 'package:flutter/material.dart';
import 'package:wuwu/styles/palette.dart';
import 'package:wuwu/views/bottom_sheet/bs_base.dart';

// class

class BSHomeSetting extends StatelessWidget {
  const BSHomeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return bsBase(
      title: '首页设置',
      operators: false,
      children: [
        Expanded(
          child: ListView(
            children: [
              Row(),
              Container(height: 200, color: Palette.blue,),
              Container(height: 200, color: Palette.red,),
              Container(height: 200, color: Palette.yellow,),
            ],
          ),
        )
      ],
    );
  }
}
