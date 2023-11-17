import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/domain/data_source/task_data_source.dart';
import 'package:rm_task_app/src/domain/repository/task_repository.dart';

class TaskRepository implements ITaskRepository {
  final ITaskDataSource _ds;

  TaskRepository(this._ds);

  @override
  Future<TaskModel> createTask(TaskModel task) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask(String id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<TaskModel> getTask(String id) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    return await _ds.getTasks();
  }

  @override
  Future<TaskModel> updateTask(TaskModel task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
