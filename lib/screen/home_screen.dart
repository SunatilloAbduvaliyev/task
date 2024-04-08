import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/data/model.dart';
import 'package:task/screen/payment/payment_screen.dart';

import '../utils/app-Images.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  CardModel cardModel = CardModel(color: const Color(0xFF78A083), amount: 0, cardNumber: "8600 0604 1235 4589", expireDate: "02/27", bankName: "SQB", cardName: "VISA", isMain: true, ownerName: "Sharifboy Muminov", uuid: "");
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: AppColors.c_2A3256,
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentScreen()));
            }, icon: const Icon(Icons.sensor_door_outlined,color: Colors.white,))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0.w.h),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF1C1678),
                      Color(0xFF50727B),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.w.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(AppImages.cipPng,width: 40,),
                          Text(
                            cardModel.cardName,
                            style: AppTextStyle.poppinsBold.copyWith(
                              color: Colors.white,fontWeight: FontWeight.w800,fontSize: 23.sp
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        cardModel.cardNumber,
                        style: AppTextStyle.poppinsBold.copyWith(
                            color: Colors.white,fontWeight: FontWeight.w800,fontSize: 20.sp
                        ),
                      ),
                      SizedBox(height: 25.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Card Holder Name",
                                style: AppTextStyle.poppinsBold.copyWith(
                                    color: Colors.white,fontWeight: FontWeight.w300,fontSize: 14.sp
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              Text(
                                cardModel.ownerName,
                                style: AppTextStyle.poppinsBold.copyWith(
                                    color: Colors.white,fontWeight: FontWeight.w800,fontSize: 14.sp
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expired Data",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 10.h,),
                              Text(
                                cardModel.expireDate,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
