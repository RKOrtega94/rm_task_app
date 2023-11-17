import 'package:flutter/material.dart';

class FilterTaskWidget extends StatefulWidget {
  const FilterTaskWidget({super.key});

  @override
  State<FilterTaskWidget> createState() => _FilterTaskWidgetState();
}

class _FilterTaskWidgetState extends State<FilterTaskWidget>
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
      ),
    );
  }
}
