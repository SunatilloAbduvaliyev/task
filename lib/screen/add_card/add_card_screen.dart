import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/bloc/card_bloc.dart';
import 'package:task/screen/add_card/widget/color_button.dart';
import 'package:task/screen/add_card/widget/text_field.dart';
import 'package:task/utils/app_fonts.dart';
import 'package:task/utils/extension.dart';

import '../../bloc/card_event.dart';
import '../../data/model.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();

  @override
  void dispose() {
    ownerNameController.dispose();
    cardNameController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    amountController.dispose();
    bankNameController.dispose();
    super.dispose();
  }

  CardModel cardModel = CardModel.initial();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
   String color = "2A3256";

  @override
  Widget build(BuildContext context) {
    debugPrint('--------------------------------------buildran');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Card',
          style: AppTextStyle.interSemiBold.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: formState,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    40.boxH(),
                    GlobalTextField(
                      title: "Ism Familya",
                      controller: ownerNameController,
                    ),
                    10.boxH(),
                    GlobalTextField(
                      length: 19,
                      title: "xxxx xxxx xxxx xxxx",
                      controller: cardNumberController,
                      isCardNumber: true,
                    ),
                    10.boxH(),
                    Row(
                      children: [
                        Expanded(
                          child: GlobalTextField(
                            title: 'Bank Name',
                            controller: bankNameController,
                          ),
                        ),
                        20.boxW(),
                        Expanded(
                          child: GlobalTextField(
                            title: 'Expire date',
                            controller: expiryDateController,
                            isAmount: true,
                          ),
                        ),
                      ],
                    ),
                    10.boxH(),
                    GlobalTextField(
                      title: "Card Name",
                      controller: cardNameController,
                    ),
                    10.boxH(),
                    GlobalTextField(
                      title: "1 000 000 000 0000",
                      controller: amountController,
                      isAmount: true,
                    ),
                    10.boxH(),
                    ColorButton(
                      color: (value) {
                        color = value;
                      },
                    ),
                  ],
                ),
              ),
              Ink(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16.r),
                  onTap: () {
                    if (formState.currentState!.validate()) {
                      context.read<CardBloc>().add(
                        InsertCardEvent(
                            cardModel: CardModel(
                              color: color,
                              amount: double.parse(amountController.text),
                              cardNumber: cardNumberController.text,
                              expireDate: expiryDateController.text,
                              bankName: bankNameController.text,
                              cardName: cardNameController.text,
                              isMain: false,
                              ownerName: ownerNameController.text,
                              uuid: "",
                            )),
                      );
                      Navigator.of(context).pop(cardModel);
                    }
                  },
                  child: Center(
                    child: Text(
                      'Saqlash',
                      style: AppTextStyle.interSemiBold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              40.boxH(),
            ],
          ),
        ),
      ),
    );
  }
}
