import 'package:firebase/firebase.dart';
import 'package:planning_flutter_lib/modifiable_states/cards_state.dart';
import 'package:planning_flutter_lib/modifiable_states/room_config.dart';
import 'package:planning_flutter_lib/modifiable_states/room_state.dart';
import 'package:planning_flutter_lib/modifiable_states/tasks.dart';

class RoomInstance {
  final String id;
  DatabaseReference get ref => database().ref('rooms/$id');

  Map<String, String> nicknames = {};

  final String name;
  final String password;
  final String creatorEmail;

  final String myEmail;
  final String myNickname;

  bool get adminRights => myEmail == creatorEmail;

  RoomInstance(
    this.id, {
    this.name,
    this.password,
    this.creatorEmail,
    this.nicknames,
    this.myEmail,
    this.myNickname,
  })  : configs = RoomConfig(id),
        tasks = TaskList(id),
        state = RoomState(id),
        cards = CardsState(id) {
    //subscribe();
  }

  //! STATE
  final RoomConfig configs;
  final CardsState cards;
  final TaskList tasks;
  final RoomState state;

  Future load() {
    List<Future> futures = [
      configs.load(),
      cards.load(),
      tasks.load(),
      state.load()
    ];

    return Future.wait(futures);
  }
}
