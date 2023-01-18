import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_clone/cubit/cubit.dart';
import 'package:zoom_clone/presentaion/screens/layout/cubit/cubit.dart';
import 'package:zoom_clone/presentaion/screens/layout/layout.dart';
import 'package:zoom_clone/presentaion/screens/login_screen/cubit/cubit.dart';
import 'package:zoom_clone/presentaion/screens/login_screen/login_screen.dart';

import 'bloc_abserve.dart';
import 'core/utils/cach_helper.dart';
import 'core/utils/color.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CachHelper.init();
  String? uId =CachHelper.getData(key: 'uId');
  Widget widget;


  if(uId !=null) {
    widget = const Layout();
  }else {
    widget = const LoginScreen();
  }
  BlocOverrides.runZoned(
        () {
      runApp( MyApp(startWidget: widget,));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LoginCubit()),
        BlocProvider(create: (context)=>LayoutCubit()),
        BlocProvider(create: (context)=>AppCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zoom Clone',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: startWidget,
      ),
    );
  }
}


