import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  static const String home = '/home';

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: home, page: HomeRoute.page, initial: true),
      ];
}
