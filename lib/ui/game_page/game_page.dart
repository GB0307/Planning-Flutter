import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  final String id;

  GamePage(
    @pathParam this.id,
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
