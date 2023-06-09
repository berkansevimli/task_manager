import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_interview/view/screens/api_tasks/view/api_tasks_view.dart';
import 'package:task_manager_interview/view/screens/home/providers/task_provider.dart';
import 'package:task_manager_interview/core/utilities/color_utils.dart';
import 'package:task_manager_interview/view/common_widgets/custom_check_box.dart';
import 'package:task_manager_interview/view/screens/home/model/task_model.dart';
import 'package:task_manager_interview/view/screens/home/widgets/add_task.dart';
import '../../../../core/utilities/font_style_utils.dart';
import '../../../../size_config.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<TaskModel> tasks = [];
  List<TaskModel> filteredTasks = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorUtilities.primary_500,
          onPressed: () {
            showDialog(context: context, builder: (builder) => const AddTask())
                .then((value) {
              setState(() {
                tasks = taskProvider.tasks;
                filteredTasks = taskProvider.tasks;
              });
            });
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "Task Manager",
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const ApiTasksView()));
                },
                icon: const Icon(
                  Icons.http,
                  color: Colors.white,
                )),
            PopupMenuButton(
                color: ColorUtilities.white,
                onSelected: onSelected,
                itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 0,
                        child: Text("All Tasks"),
                      ),
                      const PopupMenuItem(
                        value: 1,
                        child: Text("Completed Tasks"),
                      ),
                      const PopupMenuItem(
                        value: 2,
                        child: Text("Incompleted Tasks"),
                      ),
                    ]),
          ],
        ),
        body: filteredTasks.isEmpty
            ? const Center(child: Text("No Task Found"))
            : Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(16)),
                child: SingleChildScrollView(
                  child: buildTaskList(filteredTasks, context, taskProvider),
                ),
              ));
  }

  void onSelected(value) {
    switch (value) {
      case 0:
        setState(() {
          filteredTasks = tasks;
        });
        break;
      case 1:
        setState(() {
          filteredTasks = tasks.where((element) => element.completed).toList();
          print(filteredTasks.length);
        });
        break;
      case 2:
        setState(() {
          filteredTasks = tasks.where((element) => !element.completed).toList();
        });
        break;
      default:
    }
  }

  Column buildTaskList(
      List<TaskModel> tasks, BuildContext context, TaskProvider taskProvider) {
    return Column(
      children: tasks
          .map((e) => Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16),
                    vertical: getProportionateScreenHeight(8)),
                child: buildTaskItem(e, context, taskProvider),
              ))
          .toList(),
    );
  }

  Container buildTaskItem(
      TaskModel e, BuildContext context, TaskProvider taskProvider) {
    return Container(
        decoration: BoxDecoration(
            color: ColorUtilities.light_500,
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(16))),
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(8)),
          child: Row(
            children: [
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              CustomCheckBox(
                  onChange: (value) {
                    taskProvider.updateTask(e.id, value);
                    setState(() {});
                  },
                  isSelected: e.completed),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Expanded(
                  child: Text(
                e.title,
                style:
                    FontStyleUtilities.t1(fontColor: ColorUtilities.text_900),
              )),
              IconButton(
                  onPressed: () => deleteNote(context, taskProvider, e),
                  icon: const Icon(Icons.close))
            ],
          ),
        ));
  }

  Future<dynamic> deleteNote(
      BuildContext context, TaskProvider taskProvider, TaskModel e) {
    return showDialog(
        context: context,
        builder: (builder) => CupertinoAlertDialog(
              title: const Text("Delete Task"),
              content: const Text("Are you sure you want to delete this task?"),
              actions: [
                CupertinoDialogAction(
                    onPressed: () {
                      taskProvider.removeTask(e.id);
                      Navigator.pop(builder);
                    },
                    child: const Text("Yes")),
                CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(builder);
                    },
                    child: const Text("No"))
              ],
            ));
  }
}
