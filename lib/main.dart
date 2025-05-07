import 'package:flutter/material.dart';
import 'package:git_finder/features/core/consts/app_config.dart';
import 'package:git_finder/features/core/router/go_router_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouterConfig().router,
      title: AppConfig.appName,
    );
  }
}
