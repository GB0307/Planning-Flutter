import 'package:flutter/material.dart';
import 'package:planning_flutter_lib/planning_flutter_lib.dart';
import 'package:planning_flutter_lib/room_manager/room_instance.dart';

void main() {
  PlanningFlutter.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  RoomInstance room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          ElevatedButton(
            onPressed: () async {
              room = await PlanningFlutter.instance
                  .createRoom('oi@gmail.com', 'GB', '1234');

              print('CREATED A ROOM WITH ID ${room.id}');
              print(room.state.nicknames);
            },
            child: Text("create room"),
          ),
          ElevatedButton(
            onPressed: () async {
              var c = room.configs;
              room.configs.autoFlip = !room.configs.autoFlip;
              await room.configs.save();
            },
            child: Text("set config"),
          ),
          ElevatedButton(
            onPressed: () async {
              var t = room.tasks;
              var task = t.newState();

              task.name = 'ola';
              task.description = 'Porra';
              print(task.toJson());
              task.save();
            },
            child: Text("add task"),
          ),
          ElevatedButton(
            onPressed: () async {
              var t = room.tasks;
              var task = t.newState();

              task.name = 'ola';
              task.description = 'Porra 2';
              print(task.toJson());
              t.save();
            },
            child: Text("add task 2"),
          ),
          ElevatedButton(
            onPressed: () async {
              var t = room.tasks;

              await t.remove(t.tasks.first.key);
            },
            child: Text("remove task"),
          ),
        ],
      ),
    );
  }
}
