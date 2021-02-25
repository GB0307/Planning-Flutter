import 'dart:async';

import 'package:firebase/firebase.dart';

abstract class ModifiableState {
  final db = database();
  final String roomId;
  final String subpath;

  Map snapshot = {};

  StreamController _streamController = StreamController.broadcast();
  Stream get stream => _streamController?.stream;

  DatabaseReference get ref => database().ref('rooms/$roomId/$subpath');

  ModifiableState(this.roomId, this.subpath);

  void loadFromJson(Map json);

  Map<String, dynamic> toJson();

  void discartChanges() => loadFromJson(snapshot);

  Future<void> save() {
    var data = toJson();
    return ref.set(data);
  }

  Future load() async {
    var val = await ref.once('value');
    var map = (val.snapshot?.toJson() ?? {});

    snapshot = map;
    loadFromJson(snapshot);
  }

  void update() {
    _streamController.add(this);
  }

  void subscribe() {}

  void unsubscribe() {}

  void dispose() {
    unsubscribe();
    _streamController.close();
    _streamController = null;
  }
}
