import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../bloc/card_bloc.dart';
import '../../bloc/card_event.dart';
import '../../data/model.dart';
import '../../utils/app-Images.dart';
import '../../utils/app_fonts.dart';
import '../../utils/extension.dart';

class CardButton extends StatelessWidget {
  final CardModel cardModel;
  final bool isPayment;

  const CardButton({super.key, required this.cardModel,this.isPayment = false,});

  @override
  Widget build(BuildContext context) {
    return isPayment?Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w.h, vertical: 6.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Color(hexStringToHexInt(cardModel.color))
        ),
        child: Padding(
          padding: EdgeInsets.all(15.w.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppImages.cipPng,
                    width: 40,
                  ),
                  Text(
                    cardModel.cardName,
                    style: AppTextStyle.poppinsBold.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 23.sp),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                cardModel.cardNumber,
                style: AppTextStyle.poppinsBold.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20.sp),
              ),
              Text(
               NumberFormat.currency(locale: 'uz').format(cardModel.amount),
                style: AppTextStyle.poppinsBold.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 14.sp),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Card Holder Name",
                        style: AppTextStyle.poppinsBold.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        cardModel.ownerName,
                        style: AppTextStyle.poppinsBold.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Expired Data",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        cardModel.expireDate,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ):Dismissible(
      key: ValueKey<String>(cardModel.cardName),
      confirmDismiss: (DismissDirection direction){
        return showDialog(context: context, builder: (context){
          return AlertDialog(
            title: const Text('Deleting'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('No'),
              )
            ],
          );
        });
      },
      onDismissed: (value) {
        context.read<CardBloc>().add(DeleteCardEvent(cardModel: cardModel));
      },
      background: Container(
          decoration: const BoxDecoration(
            color: Colors.red,
          ),
          child: Center(
            child:  Text(
              'Deleting',
              style: AppTextStyle.interSemiBold.copyWith(
                fontSize: 32.sp,
                color: Colors.white
              ),
            ),
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w.h, vertical: 6.h),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Color(hexStringToHexInt(cardModel.color))
          ),
          child: Padding(
            padding: EdgeInsets.all(15.w.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppImages.cipPng,
                      width: 40,
                    ),
                    Text(
                      cardModel.cardName,
                      style: AppTextStyle.poppinsBold.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 23.sp),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  cardModel.cardNumber,
                  style: AppTextStyle.poppinsBold.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20.sp),
                ),
                Text(
                  NumberFormat.currency(locale: 'uz').format(cardModel.amount),
                  style: AppTextStyle.poppinsBold.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 14.sp),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Card Holder Name",
                          style: AppTextStyle.poppinsBold.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          cardModel.ownerName,
                          style: AppTextStyle.poppinsBold.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expired Data",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          cardModel.expireDate,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
