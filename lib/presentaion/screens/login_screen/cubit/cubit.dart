import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone/core/utils/constant.dart';
import 'package:zoom_clone/presentaion/screens/login_screen/cubit/state.dart';

class LoginCubit extends Cubit<ZoomCloneLoginStates> {
  LoginCubit() : super (InitialZoomCloneStates());

   static LoginCubit get(context) => BlocProvider.of(context);

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
   Stream<User?> get authChange => auth.authStateChanges();
   User get user=>auth.currentUser!;

  Future<bool> signInWithGoogle(BuildContext context) async {

   bool res =false;
    try {
      emit(ZoomCloneLoginLoadingStates());
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential= await auth.signInWithCredential(credential);

      User? user = userCredential.user;

      if(user!=null) {
        if(userCredential.additionalUserInfo!.isNewUser){
         await  firestore.collection('users').doc(user.uid).set({
            'username':user.displayName,
            'uId':user.uid,
            'profilePhoto':user.photoURL,
          });
        }
        res = true;
      }
      emit(ZoomCloneLoginSuccessStates());

    } on FirebaseAuthException catch (error) {
      res = false;
      emit(ZoomCloneLoginErrorStates());

      snackBar(context, error.message!);
    }
    return res;

  }
}