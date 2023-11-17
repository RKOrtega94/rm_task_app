import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/domain/repository/task_repository.dart';

class GetAllTasksUseCase {
  final ITaskRepository _repository;

  GetAllTasksUseCase(this._repository);

  Future<List<TaskModel>> call() async {
    return await _repository.getTasks();
  }
}
