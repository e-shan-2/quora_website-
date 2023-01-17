import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:social_app/utils/app_routes.dart';

class AppRouterDelegate extends RouterDelegate<RouteSettings>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteSettings> {
  // make it singleton
  AppRouterDelegate._private();
  static final AppRouterDelegate _services = AppRouterDelegate._private();
  factory AppRouterDelegate() {
    return _services;
  }

  final List<Page> _pages = [];

  @override
  Widget build(BuildContext context) {
    print(_pages.map((e) => e.name));
    return Navigator(
      key: navigatorKey,
      pages: _pages,
      onPopPage: (route, result) {
        return true;
      },
    );
  }

  void pullll(RouteSettings settings) {
    _pages.add(AppRoutes.generateRoute(settings));
    notifyListeners();
  }

  void pop() {
    _pages.removeLast();
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();
  @override
  Future<void> setNewRoutePath(RouteSettings configuration) =>
      Future.value(null);
}
