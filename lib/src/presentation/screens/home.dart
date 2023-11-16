import 'package:flutter/material.dart';
import 'package:rm_task_app/src/presentation/layouts/main_layout.dart';
import 'package:rm_task_app/src/presentation/widgets/task/filter_task.dart';
import 'package:rm_task_app/src/presentation/widgets/task/list_task.dart';

class HomeScreen extends StatelessWidget {
  static String name = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppMainLayout(
      child: Column(
        children: [
          FilterTaskWidget(),
          Expanded(
            child: TaskListWidget(),
          )
        ],
      ),
    );
  }
}
