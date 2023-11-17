import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/presentation/providers/_provider.dart';
import 'package:rm_task_app/src/presentation/widgets/_widgets.dart';

class TaskListWidget extends ConsumerWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<TaskModel>> tasks = ref.watch(fetchTasksProvider);

    debugPrint('tasks: $tasks');

    if (tasks is AsyncLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (tasks.hasValue && tasks.value?.isEmpty == true) {
      return const Center(
        child: Text('No tasks'),
      );
    }

    return ListView.builder(
      itemCount: tasks.hasValue ? tasks.value?.length : 0,
      itemBuilder: (context, index) => const TaskTileWidget(),
    );
  }
}
