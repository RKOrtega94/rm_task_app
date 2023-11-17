import 'package:flutter/material.dart';
import 'package:rm_task_app/src/presentation/layouts/main_layout.dart';
import 'package:rm_task_app/src/presentation/widgets/_widgets.dart';

class HomeScreen extends StatelessWidget {
  static String name = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppMainLayout(
      isHome: true,
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
