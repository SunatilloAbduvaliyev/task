import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/bloc/card_bloc.dart';
import 'package:task/bloc/card_event.dart';
import 'package:task/data/api_provider/api_provider.dart';
import 'package:task/screen/home_screen.dart';
import 'package:task/screen/payment/payment_screen.dart';
import 'package:task/utils/notification.dart';

Future<void> main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotification();
  ApiProvider  apiProvider = ApiProvider();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>CardBloc(apiProvider:apiProvider)..add(CallCardEvent()),)
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
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
      child: const HelloScreen(),
    );
  }
}
