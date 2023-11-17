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
    return Future.value([]);
  }

  Future fetchTasks() async {
    final GetAllTasksUseCase useCase =
        GetAllTasksUseCase(TaskRepository(TaskRemoteDataSource()));
    state = AsyncValue.data(await useCase.call());
  }
}
