import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/presentation/providers/task_provider.dart';
import 'package:rm_task_app/src/presentation/widgets/shared/show_dialog.dart';

class TaskTileWidget extends ConsumerWidget {
  final TaskModel task;
  const TaskTileWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () => context.push('/task/${task.id}'),
      leading: Checkbox(
        value: task.completed ?? false,
        onChanged: (value) => {
          ref.read(taskProvider.notifier).updateTask(
                task.copyWith(
                  completed: value,
                ),
              ),
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(value ?? false
                  ? 'Task completed successfully.'
                  : 'Set task as pending.'),
            ),
          ),
        },
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => appShowDialog(
          context,
          title: 'Alert',
          content: 'Are you sure you want to delete this task?',
          confirm: () => ref.read(taskProvider.notifier).delete(task.id!).then(
                (value) => {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Task deleted'),
                    ),
                  )
                },
              ),
        ),
      ),
      title: Text(task.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(task.description),
          Text(
            "From: ${DateFormat.yMMMEd().format(task.createdAt ?? DateTime.now())}",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            "Until:   ${task.untilDate == null ? 'Not defined' : DateFormat.yMMMEd().format(task.untilDate!)}",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
