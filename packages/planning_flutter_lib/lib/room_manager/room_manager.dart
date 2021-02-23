import 'package:firebase/firebase.dart';
import 'package:planning_flutter_lib/utils/email_to_keys.dart';

import 'room_instance.dart';

class RoomManager {
  Database get db => database();

  Future<RoomInstance> enterRoom() async {}

  Future<RoomInstance> createRoom(
      String email, String nickname, String password) async {
    var values = <String, dynamic>{
      'creatorEmail': email,
      'state': {
        'nicknames': {emailToKey(email): nickname},
      },
      'password': password,
    };
    var ref = db.ref('rooms').push(values);

    await ref.future;

    return RoomInstance(
      ref.key,
      creatorEmail: email,
      password: password,
      myEmail: email,
      myNickname: nickname,
    );
  }
}
