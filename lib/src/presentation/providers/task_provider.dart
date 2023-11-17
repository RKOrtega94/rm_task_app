import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rm_task_app/src/data/data_source/remote/task_remote_data_source.dart';
import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/data/repository/task_repository.dart';
import 'package:rm_task_app/src/data/use_case/task/get_all.dart';

part 'task_provider.g.dart';

@riverpod
class Task extends _$Task {
  @override
  Future<List<TaskModel>> build() async {
    final GetAllTasksUseCase getAllTasksUseCase = GetAllTasksUseCase(
      TaskRepository(
        TaskRemoteDataSource(),
      ),
    );

    final List<TaskModel> tasks = await getAllTasksUseCase.call();
    return Future.value([...tasks]);
  }

  Future<void> add(TaskModel task) async {
    final GetAllTasksUseCase getAllTasksUseCase = GetAllTasksUseCase(
      TaskRepository(
        TaskRemoteDataSource(),
      ),
    );

    final List<TaskModel> tasks = await getAllTasksUseCase.call();
    tasks.add(task);
    state = AsyncValue.data([...state.value!, task]);
  }
}
