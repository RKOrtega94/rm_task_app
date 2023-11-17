import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/data/repository/task_repository.dart';

class StoreTaskUseCase {
  final TaskRepository _repository;

  StoreTaskUseCase(this._repository);

  Future<TaskModel> call(TaskModel task) async {
    return await _repository.createTask(task);
  }
}
