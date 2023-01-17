import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/router/router_delegate.dart';
import 'package:social_app/utils/app_routes.dart';

void main() {
  AppRouterDelegate().pullll(const RouteSettings(name: AppRoutes.tabBarView));
  runApp(
    const ProviderScope(
      child: SocialApp(),
    ),
  );
}

class SocialApp extends StatefulWidget {
  const SocialApp({super.key});

  @override
  State<SocialApp> createState() => _SocialAppState();
}

class _SocialAppState extends State<SocialApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: AppRoutes.generateRoute,
      // initialRoute: AppRoutes.newsFeedPage,
      home: Router(routerDelegate: AppRouterDelegate()),
    );
  }
}

final x = StateProvider(((ref) => false));

// ref,watch(x);
