import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:task_manager_interview/view/screens/api_tasks/view_model/api_view_model.dart';
import 'package:task_manager_interview/view/screens/home/widgets/add_task.dart';
import '../../../../core/utilities/color_utils.dart';
import '../../../../core/utilities/font_style_utils.dart';
import '../../../../size_config.dart';
import '../../../common_widgets/custom_check_box.dart';
import '../model/tasks_model.dart';

class ApiTasksView extends StatefulWidget {
  const ApiTasksView({super.key});

  @override
  State<ApiTasksView> createState() => _ApiTasksViewState();
}

class _ApiTasksViewState extends State<ApiTasksView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ApiViewModel>.reactive(
      viewModelBuilder: () => ApiViewModel(context),
      onViewModelReady: (viewModel) {
        viewModel.fetchTasks();
      },
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Api Tasks"),
              actions: [
                PopupMenuButton(
                    color: ColorUtilities.white,
                    onSelected: (value) {
                      model.filterTask(value);
                    },
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
            body: model.isLoading
                ? const Center(
                    child: CupertinoActivityIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: model.tasks
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: buildTaskItem(e, model),
                              ))
                          .toList(),
                    ),
                  ));
      },
    );
  }

  Container buildTaskItem(TasksModel e, ApiViewModel model) {
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
                    model.changeTaskStatus(e.id!, value);
                    setState(() {});
                  },
                  isSelected: e.completed!),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Expanded(
                  child: Text(
                e.title!,
                style:
                    FontStyleUtilities.t1(fontColor: ColorUtilities.text_900),
              )),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (builder) => AddTask(
                              title: e.title!,
                              id: e.id!,
                              model: model,
                            ));

                  
                  },
                  icon: const Icon(Icons.edit))
            ],
          ),
        ));
  }
}
