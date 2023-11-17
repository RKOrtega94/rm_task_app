import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppMainLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool isHome;
  const AppMainLayout(
      {super.key, required this.child, this.title, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'RM Task App'),
      ),
      floatingActionButton: Visibility(
        visible: isHome,
        child: FloatingActionButton(
          onPressed: () => context.push('/task-form'),
          child: const Icon(Icons.add),
        ),
      ),
      body: child,
    );
  }
}
