import 'package:git_finder/features/core/router/go_routes.dart';
import 'package:git_finder/features/repo/repo_details/view/repo_details_route.dart';
import 'package:git_finder/features/repo/repo_list/view/repo_route.dart';
import 'package:go_router/go_router.dart';

class RepoGoRouterConfig {
  GoRoute get config => GoRoute(
        path: GoRoutes.repo.list,
        name: GoRoutes.repo.list,
        builder: (_, GoRouterState state) => const RepoRoute(),
        routes: [
          GoRoute(
            path: GoRoutes.repo.details,
            name: GoRoutes.repo.details,
            builder: (_, GoRouterState state) => const RepoDetailsRoute(),
          ),
        ],
      );
}
