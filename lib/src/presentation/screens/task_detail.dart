import 'package:flutter/material.dart';
import 'package:rm_task_app/src/presentation/layouts/main_layout.dart';

class TaskDetailScreen extends StatelessWidget {
  static String name = '/task-detail';
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppMainLayout(
      title: "Task Detail",
      child: Placeholder(),
    );
  }
}
