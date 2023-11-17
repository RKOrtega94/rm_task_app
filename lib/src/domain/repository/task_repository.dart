import 'package:rm_task_app/src/data/model/task_model.dart';

/// ITaskRepository
abstract class ITaskRepository {
  Future<List<TaskModel>> getTasks();
  Future<TaskModel> getTask(String id);
  Future<TaskModel> createTask(TaskModel task);
  Future<TaskModel> updateTask(TaskModel task);
  Future<void> deleteTask(String id);
}
