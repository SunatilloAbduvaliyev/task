import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/card_bloc.dart';
import 'package:task/bloc/card_state.dart';
import 'package:task/screen/add_card/add_card_screen.dart';
import 'package:task/screen/global_widget/card_button.dart';
import 'package:task/screen/payment/payment_screen.dart';
import '../utils/app_colors.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: AppColors.c_2A3256,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentScreen()));
                },
                icon: const Icon(
                  Icons.send_sharp,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddCardScreen()));
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
        ),
        body: BlocConsumer<CardBloc, CardState>(
          builder: (BuildContext context, CardState state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is OkState) {
              return ListView.builder(
                  itemCount: state.cards.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardButton(
                      cardModel: state.cards[index],
                    );
                  }
              );
            }
            return const Center(child: Text('Not Found'));
          },
          listener: (BuildContext context, CardState state) {},
        ),
      ),);
  }
}
