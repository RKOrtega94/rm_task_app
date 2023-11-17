import 'package:flutter/material.dart';
import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/presentation/widgets/_widgets.dart';

class TaskForm extends StatefulWidget {
  final TaskModel? task;
  const TaskForm({super.key, this.task});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TaskModel _task = TaskModel(
    title: '',
    description: '',
    status: '',
    untilDate: DateTime.now(),
  );

  // Handle change
  void _handleTitleChange(String value) {
    setState(() {
      _task = _task.copyWith(title: value);
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _task = widget.task!;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppTextField(
                label: "Task title",
              ),
              const SizedBox(height: 20),
              const AppTextField(
                label: "Task description",
                keyboardType: TextInputType.multiline,
                minLines: 3,
              ),
              const SizedBox(height: 20),
              const AppDatePicker(),
              const SizedBox(height: 20),
              AppButton(widget.task != null ? "Update" : "Create"),
            ],
          ),
        ),
      ),
    );
  }
}
