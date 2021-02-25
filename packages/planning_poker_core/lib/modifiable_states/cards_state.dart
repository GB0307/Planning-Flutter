import 'modifiable_state.dart';
import 'modifiable_state_list.dart';

class CardsState extends ModifiableStateList {
  CardsState(String roomId) : super(roomId, 'cards');

  @override
  ModifiableState createState(String key, Map json) {}
}
