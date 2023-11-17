import 'package:flutter/material.dart';
import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/presentation/widgets/shared/text_field_widget.dart';

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
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppTextField(
                label: "Task title",
              ),
              SizedBox(height: 8),
              AppTextField(
                label: "Task description",
                keyboardType: TextInputType.multiline,
                minLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
