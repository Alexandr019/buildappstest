import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/feature.dart';

part 'app_router.g.dart';

@TypedGoRoute<HomeRoute>(path: '/home', routes: [
  TypedGoRoute<PostRoute>(path: 'post/:id')
])
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

class PostRoute extends GoRouteData with $PostRoute {
  const PostRoute({required this.id});
  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) => PostPage(id: id);
}
