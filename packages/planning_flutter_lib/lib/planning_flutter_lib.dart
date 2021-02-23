library planning_flutter_lib;

import 'package:firebase/firebase.dart';

import 'room_manager/room_instance.dart';
import 'room_manager/room_manager.dart';

class PlanningFlutter {
  static PlanningFlutter get instance => PlanningFlutter._();
  static PlanningFlutter _instance;

  RoomManager _roomManager = RoomManager();

  factory PlanningFlutter() {
    if (_instance == null) _instance = PlanningFlutter._();
    return _instance;
  }

  PlanningFlutter._();

  Future<RoomInstance> createRoom(
          String email, String nickname, String password) =>
      _roomManager.createRoom(email, nickname, password);

  Future<RoomInstance> enterRoom() => _roomManager.enterRoom();

  static void init() {
    try {
      initializeApp(
          appId: "1:417022104120:web:66317b1be49bb6feaa8ccd",
          measurementId: "G-GJH1Y0BJJE",
          messagingSenderId: "417022104120",
          apiKey: "AIzaSyAvVXRjBrTQUlcj2e6lmbxHqp7yPRqY9YQ",
          authDomain: "planning-flutter.firebaseapp.com",
          databaseURL: "https://planning-flutter-default-rtdb.firebaseio.com/",
          projectId: "planning-flutter",
          storageBucket: "planning-flutter.appspot.com");
    } catch (e) {
      print(e);
    }
  }
}
