// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/enter_create_page/enter_create_page.dart';
import '../ui/game_config_page/game_config_page.dart';
import '../ui/game_page/game_page.dart';
import '../ui/initial_page/initial_page.dart';

class Routes {
  static const String initialPage = '/';
  static const String enterCreatePage = '/join';
  static const String gameConfigPage = '/setup';
  static const String _gamePage = '/room/:id';
  static String gamePage({@required dynamic id}) => '/room/$id';
  static const all = <String>{
    initialPage,
    enterCreatePage,
    gameConfigPage,
    _gamePage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.initialPage, page: InitialPage),
    RouteDef(Routes.enterCreatePage, page: EnterCreatePage),
    RouteDef(Routes.gameConfigPage, page: GameConfigPage),
    RouteDef(Routes._gamePage, page: GamePage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    InitialPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => InitialPage(),
        settings: data,
      );
    },
    EnterCreatePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EnterCreatePage(),
        settings: data,
      );
    },
    GameConfigPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => GameConfigPage(),
        settings: data,
      );
    },
    GamePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => GamePage(data.pathParams['id'].stringValue),
        settings: data,
      );
    },
  };
}
