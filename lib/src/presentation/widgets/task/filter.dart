import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rm_task_app/src/presentation/providers/task_provider.dart';

class FilterTaskWidget extends ConsumerStatefulWidget {
  const FilterTaskWidget({super.key});

  @override
  FilterTaskWidgetState createState() => FilterTaskWidgetState();
}

class FilterTaskWidgetState extends ConsumerState<FilterTaskWidget>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TabBar(
        tabs: const [
          Tab(
            text: 'All',
          ),
          Tab(
            text: 'Completed',
          ),
          Tab(
            text: 'Pending',
          ),
        ],
        controller: _controller,
        indicatorColor: Theme.of(context).primaryColor,
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.grey,
        // handle changes
        onTap: (index) {
          debugPrint("index: $index");
          bool? query;
          switch (index) {
            case 0:
              query = null;
              break;
            case 1:
              query = true;
              break;
            case 2:
              query = false;
              break;
          }
          ref.read(taskProvider.notifier).filter(query);
        },
      ),
    );
  }
}
