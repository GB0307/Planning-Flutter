import 'package:auto_route/auto_route_annotations.dart';
import 'package:planning_flutter/ui/enter_create_page/enter_create_page.dart';
import 'package:planning_flutter/ui/game_config_page/game_config_page.dart';
import 'package:planning_flutter/ui/game_page/game_page.dart';
import 'package:planning_flutter/ui/initial_page/initial_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: InitialPage, initial: true),
    MaterialRoute(page: EnterCreatePage, path: '/join'),
    MaterialRoute(page: GameConfigPage, path: '/setup'),
    MaterialRoute(page: GamePage, path: '/room/:id'),
  ],
) //CustomAutoRoute(..config)
class $AppRouter {}
