import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/bloc/card_bloc.dart';
import 'package:task/data/api_provider/api_provider.dart';
import 'package:task/screen/home_screen.dart';
import 'package:task/screen/payment/payment_screen.dart';

void main(List<String> args) {
  ApiProvider  apiProvider = ApiProvider();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>CardBloc(apiProvider:apiProvider),)
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false),
          home: child,
        );
      },
      child: const PaymentScreen(),
    );
  }
}
