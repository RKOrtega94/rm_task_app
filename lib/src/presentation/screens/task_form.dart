import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rm_task_app/src/presentation/layouts/main_layout.dart';
import 'package:rm_task_app/src/presentation/widgets/_widgets.dart';

class TaskFormScreen extends ConsumerWidget {
  static String name = 'task-form';
  final String? id;
  const TaskFormScreen({super.key, this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppMainLayout(
      title: id == null ? 'Create Task' : 'Edit Task',
      child: TaskForm(
        id: id,
      ),
    );
  }
}
