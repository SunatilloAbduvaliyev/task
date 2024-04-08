import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<String> payment = ['payment1', 'payment2', 'payment3', 'payment4', 'payment5', 'payment6'];
  String paymentText = 'payment1';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "To'lovni amalga oshiring",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 30,),
            DropdownButtonFormField(
              onChanged: (value){
                setState(() {
                  paymentText = value.toString();
                });
              },
              icon: const Icon(
                Icons.arrow_drop_down,
              ),
              decoration: const InputDecoration(labelText: 'Kartani tanlang'),
              items: payment.map((element){
                return DropdownMenuItem(
                  value: element,
                  child: Text(element),
                );
              }).toList(),
              value: paymentText,
            )
          ],
        ),
      ),
    );
  }
}


