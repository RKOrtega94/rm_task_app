import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rm_task_app/src/data/data_source/remote/task_remote_data_source.dart';
import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/data/repository/task_repository.dart';
import 'package:rm_task_app/src/data/use_case/task/get_all.dart';

part 'get_tasks_provider.g.dart';

@riverpod
Future<List<TaskModel>> fetchTasks(FetchTasksRef ref) async {
  /* final GetAllTasksUseCase _useCase = ref.read(getAllTasksUseCaseProvider); */
  final GetAllTasksUseCase useCase =
      GetAllTasksUseCase(TaskRepository(TaskRemoteDataSource()));
  return useCase.call();
}
