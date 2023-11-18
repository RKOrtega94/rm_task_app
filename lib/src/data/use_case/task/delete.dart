import 'package:rm_task_app/src/domain/repository/task_repository.dart';

class DeleteTaskUseCase {
  final ITaskRepository _taskRepository;

  DeleteTaskUseCase(this._taskRepository);

  Future<void> call(String id) async {
    await _taskRepository.deleteTask(id);
  }
}
