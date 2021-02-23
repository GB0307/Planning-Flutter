import 'package:planning_flutter_lib/modifiable_states/modifiable_state.dart';

enum EffortPolicy {
  Max,
  Min,
  Mean,
}

enum CardSetup { Fibbonacci }

class RoomConfig extends ModifiableState {
  bool autoFlip = false;

  EffortPolicy effortPolicy = EffortPolicy.Max; // TODO: implement effort policy
  CardSetup cardSetup = CardSetup.Fibbonacci; // TODO: implement card setup

  RoomConfig(String roomId) : super(roomId, 'config');

  @override
  void loadFromJson(Map json) {
    autoFlip = json['autoFlip'] ?? false;
    effortPolicy = EffortPolicy.values[json['effortPolicy'] ?? 0];
    cardSetup = CardSetup.values[json['cardSetup'] ?? 0];
  }

  @override
  Map<String, dynamic> toJson() => {
        'autoFlip': autoFlip ? true : null,
        'effortPolicy': effortPolicy?.index == 0 ? null : effortPolicy?.index,
        'cardSetup': cardSetup?.index == 0 ? null : cardSetup?.index,
      };
}
