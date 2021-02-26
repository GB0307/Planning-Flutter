import 'modifiable_state.dart';
import 'modifiable_state_list.dart';

class TaskList extends ModifiableStateList<Task> {
  TaskList(String roomId) : super(roomId, 'tasks', subscribe: true);

  List<Task> get tasks =>
      states..sort((v1, v2) => v1.order.compareTo(v2.order));

  @override
  Task createState(String key, Map json) {
    return Task(key, roomId, initialValue: json, onLoad: update);
  }
}

class Task extends ModifiableState {
  final String key;

  int order;

  String name;
  String description;
  int effort;

  Task(this.key, String roomId,
      {Map<String, dynamic> initialValue, Function onLoad})
      : super(roomId, 'tasks/$key',
            initialValue: initialValue, subscribe: false, onLoad: onLoad);

  @override
  void loadFromJson(Map json) {
    order = json['order'] ?? 0;
    name = json['name'] ?? 'no name';
    description = json['description'] ?? '';
    effort = json['effort'];
  }

  @override
  Map<String, dynamic> toJson() => {
        'effort': effort,
        'name': name,
        'description': description,
        'order': order,
      };
}
