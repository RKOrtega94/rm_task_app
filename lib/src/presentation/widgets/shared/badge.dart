import 'package:flutter/material.dart';

class AppBadge extends StatelessWidget {
  const AppBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Badge(
      backgroundColor: Theme.of(context).primaryColor,
      child: IconButton(
        icon: const Icon(Icons.notifications),
        onPressed: () {},
      ),
    );
  }
}
