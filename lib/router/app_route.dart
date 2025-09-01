enum AppPage {
  home,
  customPainter,
  router20,
  bloc,
  platform,
  performance,
  isolate,
  animation,
  stream,
  slivers,
}

class AppRoutePath {
  final AppPage page;
  const AppRoutePath.home() : page = AppPage.home;
  const AppRoutePath.page(this.page);

  static AppRoutePath fromSegments(List<String> segments) {
    if (segments.isEmpty) return const AppRoutePath.home();
    final map = {
      'custom-painter': AppPage.customPainter,
      'router20': AppPage.router20,
      'bloc': AppPage.bloc,
      'platform': AppPage.platform,
      'performance': AppPage.performance,
      'isolate': AppPage.isolate,
      'animation': AppPage.animation,
      'stream': AppPage.stream,
      'slivers': AppPage.slivers,
    };
    final p = map[segments.first];
    return p == null ? const AppRoutePath.home() : AppRoutePath.page(p);
  }

  List<String> toSegments() {
    switch (page) {
      case AppPage.home:
        return [];
      case AppPage.customPainter:
        return ['custom-painter'];
      case AppPage.router20:
        return ['router20'];
      case AppPage.bloc:
        return ['bloc'];
      case AppPage.platform:
        return ['platform'];
      case AppPage.performance:
        return ['performance'];
      case AppPage.isolate:
        return ['isolate'];
      case AppPage.animation:
        return ['animation'];
      case AppPage.stream:
        return ['stream'];
      case AppPage.slivers:
        return ['slivers'];
    }
  }
}
