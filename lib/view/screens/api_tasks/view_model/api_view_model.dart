import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:task_manager_interview/view/screens/api_tasks/model/tasks_model.dart';

import '../../../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/services/api.dart';
import '../../../../core/services/locator.dart';

class ApiViewModel extends BaseViewModel {
  ApiViewModel(this.context);

  final BuildContext context;
  final Api _api = locator<Api>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  List<TasksModel> _tasks = [];
  List<TasksModel> get tasks => _tasks;

  List<TasksModel> _initialTasks = [];
  List<TasksModel> get initialTasks => _initialTasks;

  void setTasks(List<TasksModel> task) {
    _tasks = task;
    _initialTasks = task;
    notifyListeners();
  }

  Future<void> filterTask(int type) async {
    switch (type) {
      case 0:
        _tasks = _initialTasks;
        break;
      case 1:
        _tasks = _initialTasks.where((element) => element.completed!).toList();
        break;
      case 2:
        _tasks = _initialTasks.where((element) => !element.completed!).toList();
        break;
      default:
    }
    notifyListeners();
  }

  Future<void> changeTaskStatus(int id, bool status) async {
    _tasks.firstWhere((element) => element.id == id).completed = status;
    notifyListeners();
  }

  Future<void> removeTask(int id) async {
    _tasks.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Future<void> updateTask(int id, String title) async {
    _tasks.firstWhere((element) => element.id == id).title = title;
    notifyListeners();
  }

  Future<dynamic> fetchTasks() async {
    setLoading(true);
    try {
      final response = await _api.fetchTasks();
      setTasks(response);
      setLoading(false);
    } catch (e) {
      print(e);
      setLoading(false);
    }
  }
}
