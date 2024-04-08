// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:task/bloc/card_bloc.dart';
// import 'package:task/data/api_provider/api_provider.dart';
//
// import '../screen/payment/payment_screen.dart';
//
// class App extends StatelessWidget {
//   const App({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiRepositoryProvider(
//       providers: [RepositoryProvider(create: (_) => ApiProvider())],
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider(create: (_) => CardBloc(apiProvider: context.read())),
//         ],
//         child: const MyApp(),
//       ),
//     );
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(414, 896),
//       builder: (context, child) {
//         ScreenUtil.init(context);
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(useMaterial3: false),
//           home: child,
//         );
//       },
//       child: const PaymentScreen(),
//     );
//   }
// }
