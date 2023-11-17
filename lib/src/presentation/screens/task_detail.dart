import 'package:flutter/material.dart';
import 'package:rm_task_app/src/presentation/layouts/main_layout.dart';
import 'package:rm_task_app/src/presentation/widgets/task/detail.dart';

class TaskDetailScreen extends StatelessWidget {
  final String id;
  const TaskDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return AppMainLayout(
      title: "Task Detail",
      child: TaskDetail(id: id),
    );
  }
}
