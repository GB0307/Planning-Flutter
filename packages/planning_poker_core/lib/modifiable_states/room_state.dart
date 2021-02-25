import '../utils/email_to_keys.dart';
import 'modifiable_state.dart';

class RoomState extends ModifiableState {
  RoomState(String roomId) : super(roomId, 'state');

  bool cardsFlipped;
  int currentTask;
  Map<String, String> nicknames = {};

  @override
  void loadFromJson(Map json) {
    cardsFlipped = json['cardsFlipped'] ?? false;
    currentTask = json['currentTask'] ?? 0;
    nicknames = (json['nicknames'] ?? {})
        .map((key, value) => MapEntry(keyToEmail(key), value));
  }

  @override
  Map<String, dynamic> toJson() => {
        'cardsFlipped': cardsFlipped ? true : null,
        'currentTask': currentTask == 0 ? null : currentTask,
        'nicknames':
            nicknames.map((key, value) => MapEntry(emailToKey(key), value))
      };
}
