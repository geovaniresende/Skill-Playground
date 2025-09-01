import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../screens/screens.dart';
import 'app_route.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  AppPage _current = AppPage.home;

  AppPage get current => _current;

  void goTo(AppPage page) {
    _current = page;
    notifyListeners();
  }

  @override
  AppRoutePath get currentConfiguration => AppRoutePath.page(_current);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: const HomeScreen()),
        if (_current == AppPage.customPainter)
          const MaterialPage(child: CustomPainterScreen()),
        if (_current == AppPage.router20)
          MaterialPage(child: Router20DemoScreen(onNavigate: goTo)),
        if (_current == AppPage.bloc) const MaterialPage(child: BlocScreen()),
        if (_current == AppPage.platform)
          const MaterialPage(child: PlatformChannelsScreen()),
        if (_current == AppPage.performance)
          const MaterialPage(child: PerformanceScreen()),
        if (_current == AppPage.isolate)
          const MaterialPage(child: IsolateScreen()),
        if (_current == AppPage.animation)
          const MaterialPage(child: AnimationLifecycleScreen()),
        if (_current == AppPage.stream)
          const MaterialPage(child: StreamErrorScreen()),
        if (_current == AppPage.slivers)
          const MaterialPage(child: SliversScreen()),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        _current = AppPage.home;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    _current = configuration.page;
  }
}
