import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/presentation/providers/_provider.dart';
import 'package:rm_task_app/src/presentation/providers/task/store_task_provider.dart';
import 'package:rm_task_app/src/presentation/widgets/_widgets.dart';

class TaskForm extends ConsumerStatefulWidget {
  final TaskModel? task;
  const TaskForm({super.key, this.task});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskFormState();
}

class _TaskFormState extends ConsumerState<TaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TaskModel _task = TaskModel(
    title: '',
    description: '',
    status: '',
    untilDate: DateTime.now(),
  );

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
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                isLoading: false,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    debugPrint(_task.toString());
                    ref.watch(storeTaskProvider(_task)).whenData((value) {
                      ref.read(fetchTasksProvider);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Processing Data'),
                      ),
                    );
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
