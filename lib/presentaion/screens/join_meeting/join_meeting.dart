import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_clone/cubit/cubit.dart';
import 'package:zoom_clone/cubit/states.dart';
import 'package:zoom_clone/presentaion/screens/login_screen/cubit/cubit.dart';
import 'package:zoom_clone/presentaion/widget/customTextForm.dart';

import '../../../core/utils/color.dart';
import '../../widget/join_option.dart';

class JoinMeeting extends StatelessWidget {
  const JoinMeeting({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var idController = TextEditingController();
    var nameController = TextEditingController();
    bool isAudioMuted =true;
    bool isVideoMuted =true;



    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        var provider = AppCubit.get(context);
        nameController.text = cubit.user.displayName!;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            title: const Text('Join a Meeting'),
            centerTitle: true,
            leading: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                )),
            leadingWidth: 70,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextForm(controller: idController, text: 'Meeting ID', inputType: TextInputType.number,),
                const SizedBox(
                  height: 30,
                ),
                CustomTextForm(controller: nameController, text: 'Name ',inputType: TextInputType.text,),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    provider.createNewMeeting(context,
                        meetingName: idController.text,
                        isAudioMuted: isAudioMuted,
                        isVideoMuted: isVideoMuted,
                        userName: nameController.text
                    );
                  },
                  color: secondaryBackgroundColor,
                  shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    'Join',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    Text(
                      'Join Option ',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                JoinOption(
                  text: ' Don\'t Connect To Audio',
                  isMute: provider.isAudioMuted,
                  onChange: ( value) {
                    provider.onAudioMuted(value);
                  },
                ),
                JoinOption(
                  text: ' Turn Off My Video',
                  isMute: provider.isVideoMuted,
                  onChange: ( value) {
                    provider.onVideoMuted(value);
                  },
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}


