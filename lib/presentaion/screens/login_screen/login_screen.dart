import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_clone/core/utils/constant.dart';
import 'package:zoom_clone/presentaion/screens/Home/home_screen.dart';
import 'package:zoom_clone/presentaion/screens/layout/layout.dart';
import 'package:zoom_clone/presentaion/screens/login_screen/cubit/state.dart';

import '../../widget/custom_button.dart';
import 'cubit/cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = LoginCubit.get(context);
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<LoginCubit,ZoomCloneLoginStates>(
      listener: (context,state){},
      builder: (context,state){
        return  Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Join To Our Meeting',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height / 15,
                ),
                Image.asset('assets/images/onboarding.jpg'),
                SizedBox(
                  height: height / 15,
                ),
                CustomButton(
                  text: 'Google Sign In',
                  onprees: () async{
                  bool res = await provider.signInWithGoogle(context);
                  if(res ){
                    navigateTo(context, Layout());
                  }
                  },
                )
              ],
            ),
          ),
        );
      },

    );
  }
}
