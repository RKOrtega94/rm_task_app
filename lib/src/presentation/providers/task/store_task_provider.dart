import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rm_task_app/src/data/data_source/remote/task_remote_data_source.dart';
import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/data/repository/task_repository.dart';
import 'package:rm_task_app/src/data/use_case/task/store.dart';

part 'store_task_provider.g.dart';

final StoreTaskUseCase useCase =
    StoreTaskUseCase(TaskRepository(TaskRemoteDataSource()));

@riverpod
Future<TaskModel> storeTask(StoreTaskRef ref, TaskModel task) async {
  return useCase.call(task);
}
