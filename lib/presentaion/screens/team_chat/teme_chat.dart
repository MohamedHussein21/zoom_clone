import 'package:flutter/material.dart';
import 'package:zoom_clone/presentaion/widget/customTextForm.dart';

class TeamChat extends StatelessWidget {
  const TeamChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 10),
      child: Column(
        children: [
          const Center(
              child: Text(
            'Team Chat',
            style: TextStyle(fontSize: 18),
          )),
          const SizedBox(
            height: 20,
          ),
          CustomTextForm(
            controller: searchController,
            text: 'Search',
            inputType: TextInputType.text,
          ),
          
          const Expanded(child: Center(child: Text('Find People and Start Chatting ')))
        ],
      ),
    );
  }
}
