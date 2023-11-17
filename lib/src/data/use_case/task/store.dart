import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/domain/repository/task_repository.dart';

class StoreTaskUseCase {
  final ITaskRepository _repository;

  StoreTaskUseCase(this._repository);

  Future<TaskModel> call(TaskModel task) async {
    return await _repository.createTask(task);
  }
}
