import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rm_task_app/src/presentation/screens/_screens.dart';

final router = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(),
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/task-detail',
      builder: (context, state) => const TaskDetailScreen(),
    ),
  ],
);
