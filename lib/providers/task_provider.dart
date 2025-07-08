import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task.dart';
import '../data/task_database.dart';

final taskListProvider =
    StateNotifierProvider<TaskListNotifier, List<Task>>((ref) {
  return TaskListNotifier();
});

class TaskListNotifier extends StateNotifier<List<Task>> {
  TaskListNotifier() : super([]) {
    _loadTasks();
  }

  final TaskDatabase _db = TaskDatabase();

  Future<void> _loadTasks() async {
    final tasks = await _db.getTasks();
    state = tasks;
  }

  Future<void> addTask(String title) async {
    final task = Task(title: title);
    final id = await _db.insertTask(task);
    state = [...state, task.copyWith(id: id)];
  }

  Future<void> updateTask(Task task) async {
    await _db.updateTask(task);
    state = [
      for (final t in state)
        if (t.id == task.id) task else t,
    ];
  }

  Future<void> toggleComplete(Task task) async {
    final updated = task.copyWith(isCompleted: !task.isCompleted);
    await updateTask(updated);
  }

  Future<void> deleteTask(int id) async {
    await _db.deleteTask(id);
    state = state.where((task) => task.id != id).toList();
  }
}
