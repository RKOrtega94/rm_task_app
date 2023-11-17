import 'package:rm_task_app/src/data/database/_db.dart';
import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/domain/data_source/task_data_source.dart';

class TaskRemoteDataSource implements ITaskDataSource {
  final DatabaseQuery _db = DatabaseQuery();

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
  Future<List<TaskModel>> getTasks() {
    try {
      return _db.getCollection('tasks').then((value) {
        return value.values.map((e) => TaskModel.fromJson(e)).toList();
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TaskModel> updateTask(TaskModel task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
