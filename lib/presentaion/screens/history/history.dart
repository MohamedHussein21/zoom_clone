import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/cubit/cubit.dart';
import 'package:zoom_clone/cubit/states.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return StreamBuilder(
          stream: cubit.meetingsHistory,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 10),
              child: Column(
                children: [
                  const Text('History',style: TextStyle(fontSize: 20),),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                          'Room Name : ${(snapshot.data! as dynamic).docs[index]['meetingName']}'),
                      subtitle: Text(
                          'Join in : ${DateFormat.yMMMMd().format((snapshot.data! as dynamic).docs[index]['Time'].toDate())}'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
