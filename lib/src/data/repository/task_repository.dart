import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/domain/data_source/task_data_source.dart';
import 'package:rm_task_app/src/domain/repository/task_repository.dart';
import 'package:uuid/uuid.dart';

class TaskRepository implements ITaskRepository {
  final ITaskDataSource _ds;
  final Uuid _uuid = const Uuid();

  TaskRepository(this._ds);

  @override
  Future<TaskModel> createTask(TaskModel task) => _ds.createTask(
        task.copyWith(
          id: _uuid.v4(),
          createdAt: DateTime.now(),
          completed: false,
        ),
      );

  @override
  Future<void> deleteTask(String id) => _ds.deleteTask(id);

  @override
  Future<TaskModel> getTask(String id) => _ds.getTask(id);

  @override
  Future<List<TaskModel>> getTasks() => _ds.getTasks();

  @override
  Future<TaskModel> updateTask(TaskModel task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
