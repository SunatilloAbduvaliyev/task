import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


extension Size on int{
  //SizedBox height
  SizedBox boxH() => SizedBox(height: this.h);
  //SizedBox width
  SizedBox boxW() => SizedBox(width: this.w);
}


hexStringToHexInt(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff' + hex : hex;
  int val = int.parse(hex, radix: 16);
  return val;
}
