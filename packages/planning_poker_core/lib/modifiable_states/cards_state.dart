import 'modifiable_state.dart';

class CardsState extends ModifiableState {
  CardsState(String roomId) : super(roomId, 'cards', subscribe: true);

  Map<String, int> selectedCards = {};

  @override
  void loadFromJson(Map json) {
    selectedCards = json.map((key, value) => MapEntry(key, value as int));
  }

  @override
  Map<String, dynamic> toJson() => selectedCards;
}
