import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rm_task_app/src/data/data_source/remote/task_remote_data_source.dart';
import 'package:rm_task_app/src/data/model/task_model.dart';
import 'package:rm_task_app/src/data/repository/task_repository.dart';
import 'package:rm_task_app/src/data/use_case/task/delete.dart';
import 'package:rm_task_app/src/data/use_case/task/get_all.dart';
import 'package:rm_task_app/src/data/use_case/task/get_by_id.dart';
import 'package:rm_task_app/src/data/use_case/task/store.dart';
import 'package:rm_task_app/src/data/use_case/task/update.dart';

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

  Future<TaskModel?> get(String id) async {
    final GetTaskByIdUseCase getTaskByIdUseCase = GetTaskByIdUseCase(
      TaskRepository(
        TaskRemoteDataSource(),
      ),
    );

    final task = await getTaskByIdUseCase.call(id);

    return task;
  }

  Future<void> add(TaskModel task) async {
    final StoreTaskUseCase storeTaskUseCase = StoreTaskUseCase(
      TaskRepository(
        TaskRemoteDataSource(),
      ),
    );

    final task0 = await storeTaskUseCase.call(task);

    state = AsyncValue.data([...state.value!, task0]);
  }

  Future<void> updateTask(TaskModel task) async {
    final UpdateTaskUseCase updateTaskUseCase = UpdateTaskUseCase(
      TaskRepository(
        TaskRemoteDataSource(),
      ),
    );

    final task0 = await updateTaskUseCase.call(task);

    final tasks = state.value!
        .map((element) => element.id == task0.id ? task0 : element)
        .toList();

    state = AsyncValue.data([...tasks]);
  }

  Future<void> delete(String id) async {
    final DeleteTaskUseCase deleteTaskUseCase = DeleteTaskUseCase(
      TaskRepository(
        TaskRemoteDataSource(),
      ),
    );

    await deleteTaskUseCase.call(id);

    final tasks = state.value!.where((element) => element.id != id).toList();

    state = AsyncValue.data([...tasks]);
  }

  Future<void> filter(bool? query) async {
    final GetAllTasksUseCase getAllTasksUseCase = GetAllTasksUseCase(
      TaskRepository(
        TaskRemoteDataSource(),
      ),
    );

    final List<TaskModel> tasks = await getAllTasksUseCase.call();

    if (query == null) {
      state = AsyncValue.data([...tasks]);
      return;
    }
    final filteredTasks =
        tasks.where((element) => element.completed == query).toList();

    state = AsyncValue.data([...filteredTasks]);
  }
}
