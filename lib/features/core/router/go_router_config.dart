import 'package:git_finder/features/core/router/go_routes.dart';
import 'package:git_finder/features/home/home_page.dart';
import 'package:git_finder/features/repo/router/repo_go_router_config.dart';
import 'package:go_router/go_router.dart';

class GoRouterConfig {
  final GoRouter router = GoRouter(
    initialLocation: GoRoutes.repo.list,
    routes: <RouteBase>[
      GoRoute(
        path: GoRoutes.home,
        name: GoRoutes.home,
        builder: (_, GoRouterState state) => const HomePage(),
      ),
      RepoGoRouterConfig().config
    ],
  );
}
