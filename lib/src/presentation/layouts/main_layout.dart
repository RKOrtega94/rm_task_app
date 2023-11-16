import 'package:flutter/material.dart';

class AppMainLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  const AppMainLayout({super.key, required this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'RM Task App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/task-form');
        },
        child: const Icon(Icons.add),
      ),
      body: child,
    );
  }
}
