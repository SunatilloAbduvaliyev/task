import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/utils/extension.dart';


class ColorButton extends StatefulWidget {
  final ValueChanged<String> color;
  const ColorButton({super.key, required this.color});

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  List<String> colors =[
  "1A72DD",
  "F4261A",
  "2A3256",
  "C4C4C4",
  "e76f51",
  ];
  int active = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(colors.length, (index) => Expanded(
        child: Stack(
          children: [
            Container(
              width: 70.w,
              height: 70.h,
              decoration:BoxDecoration(
                color: Color(hexStringToHexInt(colors[index])),
                shape: BoxShape.circle
              ) ,
              child: GestureDetector(
                onTap: (){
                  active = index;
                  widget.color.call(colors[index]);
                  setState(() {});
                },
              ),
            ),

            Positioned(
              right: 0,
              bottom: 0,
              top: 30,
              child: Icon(
              Icons.check,
              color: active == index? Colors.white : Color(hexStringToHexInt(colors[index])),
              size: 30.w,
            ),)
          ],
        ),
      ),
      )
    );
  }
}
