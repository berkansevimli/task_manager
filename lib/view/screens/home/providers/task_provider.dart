import '../../../../../../../../core/base/viewmodel/base_view_model.dart';
import '../model/task_model.dart';

class TaskProvider extends BaseViewModel {

  List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;
  void addTask(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(int id) {
    _tasks.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void clearTask() {
    _tasks.clear();
    notifyListeners();
  }

  void updateTask(int id, bool status) {
    _tasks.firstWhere((element) => element.id == id).completed = status;
    notifyListeners();
  }

  void filterTask(int type) {
    switch (type) {
      case 0:
        _tasks = _tasks;
        break;
      case 1:
        _tasks = _tasks.where((element) => element.completed).toList();
        break;
      case 2:
        _tasks = _tasks.where((element) => !element.completed).toList();
        break;
      default:
    }
    notifyListeners();
  }
}
