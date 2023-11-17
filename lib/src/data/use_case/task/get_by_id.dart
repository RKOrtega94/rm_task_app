import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/domain/repository/task_repository.dart';

class GetTaskByIdUseCase {
  final ITaskRepository _taskRepository;

  GetTaskByIdUseCase(this._taskRepository);

  Future<TaskModel> call(String id) async {
    return await _taskRepository.getTask(id);
  }
}
