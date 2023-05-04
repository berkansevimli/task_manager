import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager_interview/core/constansts/api_urls.dart';
import 'package:task_manager_interview/core/helper/network_helper.dart';
import '../../view/screens/api_tasks/model/tasks_model.dart';

class Api {
  Future<List<TasksModel>> fetchTasks() async {
    if (kDebugMode) print("clicked getEventDetails");
    final response = await getHttp(todoFetchURL);
    List<TasksModel> tasks =
        response.map<TasksModel>((e) => TasksModel.fromJson(e)).toList();
    return tasks;
  }
}
