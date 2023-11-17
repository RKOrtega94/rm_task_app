import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rm_task_app/src/data/model/task_model.dart';

class TaskTileWidget extends StatelessWidget {
  final TaskModel task;
  const TaskTileWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.push('/task/${task.id}'),
      leading: Checkbox(
        value: false,
        onChanged: (value) {},
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {},
      ),
      title: Text(task.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(task.description),
          Text(
            "From: ${DateFormat.yMMMEd('es').format(task.createdAt ?? DateTime.now())}",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            "Until:  ${DateFormat.yMMMEd('es').format(task.untilDate)}",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
