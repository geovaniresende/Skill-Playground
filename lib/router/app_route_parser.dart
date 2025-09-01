import 'package:flutter/material.dart';
import 'app_route.dart';

class AppRouteParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    final segments = uri.pathSegments;
    return AppRoutePath.fromSegments(segments);
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath configuration) {
    final path = '/${configuration.toSegments().join('/')}';
    return RouteInformation(uri: Uri.parse(path == '/' ? '/' : path));
  }
}
