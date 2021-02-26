import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:planning_flutter/router/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ExtendedNavigator.builder<AppRouter>(
        router: AppRouter(),
        builder: (context, extendedNav) => Theme(
          data: ThemeData(brightness: Brightness.dark),
          child: extendedNav,
        ),
      ),
    );
  }
}
