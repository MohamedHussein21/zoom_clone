
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_clone/presentaion/screens/Home/home_screen.dart';
import 'package:zoom_clone/presentaion/screens/layout/cubit/states.dart';
import 'package:zoom_clone/presentaion/screens/more/more.dart';
import 'package:zoom_clone/presentaion/screens/team_chat/teme_chat.dart';

import '../../history/history.dart';


class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialStates());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreen = [
    HomeScreen(),
    TeamChat(),
    History(),
    Setting(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(LayoutChangButtonNavStates());
  }




}

