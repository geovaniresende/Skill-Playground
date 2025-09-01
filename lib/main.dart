import 'package:flutter/material.dart';
import 'locator.dart';
import 'router/app_route_parser.dart';
import 'router/app_router_delegate.dart';
import 'router/app_route.dart';

late final AppRouterDelegate delegate;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  delegate = AppRouterDelegate();
  runApp(const SkillPlaygroundApp());
}

class SkillPlaygroundApp extends StatelessWidget {
  const SkillPlaygroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Skill Playground',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      routerDelegate: delegate,
      routeInformationParser: AppRouteParser(),
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}

void goTo(AppPage page) => delegate.goTo(page);
