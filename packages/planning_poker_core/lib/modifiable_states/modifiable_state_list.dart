import 'modifiable_state.dart';

abstract class ModifiableStateList<T extends ModifiableState>
    extends ModifiableState {
  ModifiableStateList(String roomId, String subpath,
      {Map initialValue, bool subscribe = false})
      : super(roomId, subpath,
            initialValue: initialValue, subscribe: subscribe);

  Map<String, T> stateMap = {};
  List<T> get states => stateMap.values.toList();

  Future<void> save() async {
    var data = toJson();

    await ref.set(data);

    stateMap.forEach(
      (key, value) => value.setChanges(data[key]),
    );
    if (!subscribed) update(); // IF TO PREVENT DOUBLE UPDATE IF SUBSCRIBED
  }

  Future remove(String key) {
    stateMap.remove(key)..dispose();
    return save();
  }

  @override
  void loadFromJson(Map json) {
    json.forEach((key, value) {
      if (stateMap.containsKey(key)) {
        // There is already one instance, just update it
        stateMap[key].setChanges(json[key]);
      } else {
        // No instance, create one
        stateMap[key] = createState(key, json);
      }
    });

    var remove = [];
    stateMap.keys.where((key) => !json.containsKey(key)).toList();

    remove.forEach((key) => stateMap.remove(key));
  }

  @override
  Map<String, dynamic> toJson() =>
      stateMap.map((key, value) => MapEntry(key, value.toJson()));

  T createState(String key, Map json);

  T newState() {
    String key = ref.push().key;
    T state = createState(key, {});

    stateMap[key] = state;
    return state;
  }
}
