import 'package:flutter/material.dart';
import 'package:rm_task_app/src/presentation/layouts/main_layout.dart';
import 'package:rm_task_app/src/presentation/widgets/_widgets.dart';

class TaskFormScreen extends StatelessWidget {
  static String name = 'task-form';
  final String? id;
  const TaskFormScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return AppMainLayout(
      title: id == null ? 'Create Task' : 'Edit Task',
      child: const TaskForm(),
    );
  }
}
