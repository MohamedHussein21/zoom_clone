import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/color.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'More ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          const Text(
            'ADDED FUTURES ',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          buildContainer(
              text: 'Whiteboard',
              icon: Icons.edit,
              iconBack: Icons.arrow_forward_ios, ontap: () {  }),
          SizedBox(
            height: height * 0.01,
          ),
          const Text(
            'SETTINGS ',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          buildContainer(
              text: 'Meetings',
              icon: Icons.access_time,
              iconBack: Icons.arrow_forward_ios, ontap: () {  }),

          SizedBox(
            height: height * 0.02,
          ),
          buildContainer(
              text: 'history',
              icon: Icons.history,
              iconBack: Icons.arrow_forward_ios, ontap: () {  }),

          SizedBox(
            height: height * 0.02,
          ),
          buildContainer(
              text: 'Team Chat',
              icon: Icons.chat_bubble_outline,
              iconBack: Icons.arrow_forward_ios, ontap: () {  }),

          SizedBox(
            height: height * 0.02,
          ),
          buildContainer(
              text: 'General',
              icon: Icons.settings,
              iconBack: Icons.arrow_forward_ios, ontap: () {  }),

          SizedBox(
            height: height * 0.02,
          ),
          buildContainer(
              text: 'Sign Out',
              icon: Icons.logout,
              iconBack: Icons.arrow_forward_ios, ontap: () async{
               await FirebaseAuth.instance.signOut();
          }),

        ],
      ),
    );
  }

  InkWell buildContainer(
      {required String text,
      required IconData icon,
      required GestureTapCallback ontap,
      required IconData iconBack}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 45,
        color: secondaryBackgroundColor,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 20,
            ),
            Text((text)),
            const Spacer(),
            Icon(iconBack)
          ],
        ),
      ),
    );
  }
}
