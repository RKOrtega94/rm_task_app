import 'package:go_router/go_router.dart';
import 'package:rm_task_app/src/presentation/screens/_screens.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/task-detail/:id',
      name: TaskDetailScreen.name,
      builder: (context, state) => const TaskDetailScreen(),
    ),
    GoRoute(
      path: '/task-form',
      name: TaskFormScreen.name,
      builder: (context, state) => const TaskFormScreen(),
    ),
    GoRoute(
      path: 'task-form/:id',
      name: TaskFormScreen.name,
      builder: (context, state) => TaskFormScreen(
        id: state.pathParameters['id'],
      ),
    ),
  ],
);
