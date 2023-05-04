// To parse this JSON data, do
//
//     final tasksModel = tasksModelFromJson(jsonString);

import 'dart:convert';

List<TasksModel> tasksModelFromJson(String str) =>
    List<TasksModel>.from(json.decode(str).map((x) => TasksModel.fromJson(x)));

String tasksModelToJson(List<TasksModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TasksModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TasksModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory TasksModel.fromJson(Map<String, dynamic> json) => TasksModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
