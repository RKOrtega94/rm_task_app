import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rm_task_app/src/presentation/providers/task_provider.dart';
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
                Text(snapshot.data!.status),
                Text(snapshot.data!.untilDate.toString()),
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
