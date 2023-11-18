import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/presentation/providers/task_provider.dart';
import 'package:rm_task_app/src/presentation/widgets/_widgets.dart';

class TaskForm extends ConsumerStatefulWidget {
  final TaskModel? task;
  const TaskForm({super.key, this.task});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskFormState();
}

class _TaskFormState extends ConsumerState<TaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  TaskModel _task = TaskModel(
    title: '',
    description: '',
    status: '',
    untilDate: DateTime.now(),
  );

  handleStore() {
    if (widget.task != null) {
      print("update");
    } else {
      ref.read(taskProvider.notifier).add(_task).then((value) => {
            _isLoading = false,
            setState(() {}),
            context.pop(),
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Task created successfully'),
              ),
            ),
          });
    }
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
              AppTextField(
                label: "Task title",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
                onChanged: (value) => _task = _task.copyWith(title: value),
              ),
              const SizedBox(height: 20),
              AppTextField(
                label: "Task description",
                keyboardType: TextInputType.multiline,
                minLines: 3,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
                onChanged: (value) =>
                    _task = _task.copyWith(description: value),
              ),
              const SizedBox(height: 20),
              AppDatePicker(
                validator: (val) {
                  if (val == null) {
                    return 'Date is required';
                  }
                  return null;
                },
                onChanged: (value) => _task = _task.copyWith(untilDate: value!),
              ),
              const SizedBox(height: 20),
              AppButton(
                widget.task != null ? "Update" : "Create",
                isLoading: _isLoading,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _isLoading = true;
                    setState(() {});
                    handleStore();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill the form correctly'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
