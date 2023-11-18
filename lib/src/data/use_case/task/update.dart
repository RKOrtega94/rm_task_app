import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/domain/repository/task_repository.dart';

class UpdateTaskUseCase {
  final ITaskRepository _repository;

  UpdateTaskUseCase(this._repository);

  Future<TaskModel> call(TaskModel task) async {
    return await _repository.updateTask(task);
  }
}
