import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_clone/core/utils/constant.dart';
import 'package:zoom_clone/cubit/states.dart';
import 'package:zoom_clone/presentaion/screens/join_meeting/join_meeting.dart';

import '../../../cubit/cubit.dart';
import '../../widget/customShap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Meetings ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.info_outline)
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButtonShap(
                    height: height,
                    text: 'New meeting',
                    icon: Icons.videocam,
                    ontap: () {
                      cubit.createNewMeeting(context, meetingName: 'Moahmed',
                          isAudioMuted: true,
                          isVideoMuted: true);
                    },
                  ),
                  CustomButtonShap(
                    height: height,
                    text: 'Join ',
                    icon: Icons.add_box_rounded,
                    ontap: () {
                      navigateTo(context, const JoinMeeting());
                    },
                  ),
                  CustomButtonShap(
                    height: height,
                    text: 'Schedule',
                    icon: Icons.date_range,
                    ontap: () {},
                  ),
                  CustomButtonShap(
                    height: height,
                    text: 'Share Screen',
                    icon: Icons.ios_share,
                    ontap: () {},
                  ),
                ],
              ),
              const Expanded(
                  child: Center(
                      child: Text(
                        'Click To Join Meeting',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ))),
            ],
          ),
        );
      },

    );
  }
}
