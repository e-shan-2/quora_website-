import 'package:flutter/material.dart';
import 'package:social_app/ui/error.dart';
import 'package:social_app/ui/feed_screen/feed_screen.dart';
import 'package:social_app/ui/login_screen/login_screen.dart';
import 'package:social_app/ui/home_page_mobile.dart';

class AppRoutes {
  static const String homePage = "/";
  static const String mobileLoginPage = "/mobileLogin";
  static const String newsFeedPage = "/newsFeedPage";
  static const String tabBarView = "/tabBarView";

  static MaterialPage<dynamic> generateRoute(RouteSettings settings) {
    Widget screen;
    switch (settings.name) {
      case homePage:
        screen = const LoginPage();
        break;
      case mobileLoginPage:
        screen = const MobileHomePage();
        break;
      case newsFeedPage:
        screen = const AppBarScreen();
        break;
      case tabBarView:
        screen = const AppBarScreen();
        break;

      default:
        screen = ErrorPage();
    }

    return MaterialPage(
      child: screen,
      name: settings.name,
    );
  }
}
