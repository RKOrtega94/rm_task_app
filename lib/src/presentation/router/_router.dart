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
        path: '/task/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return TaskDetailScreen(id: id);
        }),
    GoRoute(
      path: '/task-form',
      builder: (context, state) => const TaskFormScreen(),
    ),
    GoRoute(
      path: '/task-form/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return TaskFormScreen(id: id);
      },
    ),
  ],
);
