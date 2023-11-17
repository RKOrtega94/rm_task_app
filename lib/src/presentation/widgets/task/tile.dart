import 'package:flutter/material.dart';

class TaskTileWidget extends StatelessWidget {
  const TaskTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Checkbox(
        value: false,
        onChanged: (value) {},
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {},
      ),
      title: const Text('Task Title'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Task Description'),
          Row(
            children: [
              Text(
                'Created  2021-10-10',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(width: 10),
              Text(
                'Until  2021-10-10',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
