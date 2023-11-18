import 'package:rm_task_app/src/data/database/_db.dart';
import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/domain/data_source/task_data_source.dart';

class TaskRemoteDataSource implements ITaskDataSource {
  final DatabaseQuery _db = DatabaseQuery();

  @override
  Future<TaskModel> createTask(TaskModel task) {
    try {
      return _db.storeData('tasks', task.toJson()).then((value) {
        return TaskModel.fromJson(value as Map<String, dynamic>);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(String id) {
    try {
      return _db.deleteData('tasks', id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TaskModel> getTask(String id) {
    try {
      return _db.getCollectionWhere('tasks', 'id', id).then((value) {
        return TaskModel.fromJson(value.first as Map<String, dynamic>);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TaskModel>> getTasks() {
    try {
      return _db.getCollection('tasks').then((value) {
        return value
            .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
            .toList();
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
