import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/utils/extension.dart';
import '../../bloc/card_bloc.dart';
import '../../bloc/card_event.dart';
import '../../bloc/card_state.dart';
import '../../utils/app_fonts.dart';
import '../../utils/notification.dart';
import '../global_widget/card_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int indexOne = 0;
  int indexTwo = 0;
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (BuildContext context, state) {
          if (state is OkState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Kartadan',
                      style: AppTextStyle.condensedMedium,
                    ),
                  ),
                  SizedBox(
                    height: 220,
                    child: PageView.builder(
                      itemCount: state.cards.length,
                      onPageChanged: (index) {
                        setState(() {
                          indexOne = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return CardButton(
                          cardModel: state.cards[index],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Amount'),
                      onChanged: (value) {
                        double? amount = double.tryParse(value);
                        if (amount! > state.cards[indexOne].amount) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(milliseconds: 700),
                              backgroundColor: Colors.red,
                              content: Text(
                                'Ushbu Summa Kartada mavjud emas',
                                style: AppTextStyle.interSemiBold.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Kartaga',
                      style: AppTextStyle.condensedMedium,
                    ),
                  ),
                  SizedBox(
                    height: 220,
                    child: PageView.builder(
                      itemCount: state.cards.length,
                      onPageChanged: (index) {
                        setState(() {
                          indexTwo = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return CardButton(
                          cardModel: state.cards[index],
                        );
                      },
                    ),
                  ),
                  20.boxH(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Ink(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16.r),
                        onTap: () async {
                          if (indexOne != indexTwo && double.parse(amountController.text)<state.cards[indexOne].amount) {
                            context.read<CardBloc>().add(
                                  SolveCardEvent(
                                    cardModelOn: state.cards[indexOne],
                                    cardModelTo: state.cards[indexTwo],
                                    money: double.parse(amountController.text),
                                  ),
                                );
                            await NotificationService.showNotification(
                                title: "Pul o'tkazama amalga oshirildi",
                                body:
                                    "Card set amount ${amountController.text}\$",
                                scheduled: true,
                                interval: 10);
                            amountController.clear();
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Kartadan ve kartaga ayni olmayacak',
                                ),
                              ),
                            );
                          }
                        },
                        child: Center(
                          child: Text(
                            "O'tkazma",
                            style: AppTextStyle.interSemiBold.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }
}
