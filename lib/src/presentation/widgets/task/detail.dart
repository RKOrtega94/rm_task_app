import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rm_task_app/src/presentation/providers/task_provider.dart';
import 'package:rm_task_app/src/presentation/widgets/shared/button.dart';
import 'package:rm_task_app/src/presentation/widgets/shared/show_dialog.dart';
import 'package:rm_task_app/src/presentation/widgets/skeleton/detail_skeleton.dart';

class TaskDetail extends ConsumerWidget {
  final String id;
  const TaskDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.read(taskProvider.notifier).get(id).then((value) => value);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FutureBuilder(
        future: task,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  snapshot.data!.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(snapshot.data!.description),
                Text(snapshot.data!.completed ?? false
                    ? 'Completed'
                    : 'Pending'),
                RichText(
                  text: TextSpan(
                    text: 'Created at: ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    children: [
                      TextSpan(
                        text: DateFormat.yMMMMEEEEd()
                            .format(snapshot.data!.createdAt!),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Until date: ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    children: [
                      TextSpan(
                        text: snapshot.data!.untilDate == null
                            ? 'Not defined'
                            : DateFormat.yMMMMEEEEd()
                                .format(snapshot.data!.untilDate!),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                AppButton(
                  'Edit',
                  onPressed: () =>
                      context.push('/task-form/${snapshot.data!.id}'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10),
                AppButton(
                  'Delete',
                  onPressed: () => appShowDialog(
                    context,
                    title: 'Alert',
                    content: 'Are you sure you want to delete this task?',
                    confirm: () => ref
                        .read(taskProvider.notifier)
                        .delete(snapshot.data!.id!)
                        .then(
                          (value) => {
                            context.pop(),
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Task deleted'),
                              ),
                            )
                          },
                        ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            );
          } else {
            return const DetailSkeleton();
          }
        },
      ),
    );
  }
}
