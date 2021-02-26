import 'dart:async';

import 'package:firebase/firebase.dart';

abstract class ModifiableState {
  final db = database();
  final String roomId;
  final String subpath;

  Map snapshot = {};

  StreamController _streamController = StreamController.broadcast();
  Stream get stream => _streamController?.stream;

  StreamSubscription _subscription;
  bool get subscribed => _subscription != null;

  Function onLoad;

  DatabaseReference get ref => database().ref('rooms/$roomId/$subpath');

  ModifiableState(this.roomId, this.subpath,
      {Map<String, dynamic> initialValue,
      bool subscribe = false,
      this.onLoad}) {
    if (subscribe) _subscribe();
    if (initialValue != null) {
      snapshot = initialValue;
      loadFromJson(initialValue);
      update();
    }
  }

  void loadFromJson(Map json);

  Map<String, dynamic> toJson();

  void discartChanges() => loadFromJson(snapshot);

  void setChanges([Map<String, dynamic> json, bool shouldUpdate = true]) {
    if (json != null) snapshot = json;
    loadFromJson(snapshot);
    if (shouldUpdate) update();
  }

  Future<void> save() async {
    var data = toJson();
    await ref.set(data);
    update();
  }

  Future load() async {
    var val = await ref.once('value');
    var map = (val.snapshot?.toJson() ?? {});

    snapshot = map;
    loadFromJson(snapshot);
    update();
    onLoad?.call();
  }

  void update() {
    _streamController?.add(this);
  }

  void _subscribe() {
    _subscription = ref.onValue.listen((event) {
      snapshot = (event.snapshot?.toJson() ?? {});
      loadFromJson(snapshot);
      update();
    });
  }

  void _unsubscribe() {
    _subscription?.cancel();
    _subscription = null;
  }

  void dispose() {
    _unsubscribe();

    _streamController?.close();
    _streamController = null;
  }
}
