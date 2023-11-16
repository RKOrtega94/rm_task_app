import 'package:flutter/material.dart';
import 'package:rm_task_app/src/presentation/widgets/task/task_tile.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const TaskTileWidget(),
    );
  }
}
