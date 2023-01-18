import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/cubit/states.dart';
import 'package:zoom_clone/presentaion/screens/login_screen/cubit/cubit.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  void createNewMeeting(
    BuildContext context, {
    required String meetingName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String userName = '',
  }) async {
    var cubit = LoginCubit.get(context);
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String name;
      if (userName.isEmpty) {
        name = cubit.user.displayName!;
      } else {
        name = userName;
      }
      var options = JitsiMeetingOptions(room: meetingName)
        ..userDisplayName = name
        ..userEmail = cubit.user.email
        ..userAvatarURL = cubit.user.photoURL // or .png
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      addMeetingHistory(meetingName);

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }

  bool isAudioMuted = false;
  bool isVideoMuted = false;

  void onAudioMuted(bool val) {
    isAudioMuted = val;
  }

  void onVideoMuted(bool val) {
    isVideoMuted = val;
  }
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingsHistory =>
      FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('meetings')
          .snapshots();

  void addMeetingHistory(String meetingName) {

    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .collection('meetings')
          .add({
        'meetingName': meetingName,
        'Time': DateTime.now(),
      });
    } catch (error) {
      print(error);
    }
  }
}
