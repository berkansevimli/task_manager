import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_interview/core/utilities/utilities.dart';
import 'package:task_manager_interview/view/screens/api_tasks/view_model/api_view_model.dart';
import 'package:task_manager_interview/view/screens/home/model/task_model.dart';
import '../providers/task_provider.dart';
import '../../../../size_config.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_text_field.dart';

class AddTask extends StatefulWidget {
  final String? title;
  final int? id;
  final ApiViewModel? model;
  const AddTask({super.key, this.title, this.id, this.model});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String taskName = widget.title ?? "";
    final taskProvider = Provider.of<TaskProvider>(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              constraints:
                  BoxConstraints(maxWidth: SizeConfig.screenWidth - 50),
              width: SizeConfig.screenWidth - 50,
              decoration: BoxDecoration(
                  color: ColorUtilities.white,
                  borderRadius: BorderRadius.circular(30)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15),
                      vertical: getProportionateScreenWidth(15)),
                  child: Form(
                    key: formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: getProportionateScreenHeight(12),
                          ),
                          Text(
                            "Create New Task",
                            style: FontStyleUtilities.h4(
                                fontColor: ColorUtilities.text_900),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(24),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CustomTextField(
                              hint: "Task Name",
                              text: widget.id == null ? "" : widget.title,
                              keyboardType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                              validator: (value) => value!.isEmpty
                                  ? "Please enter a task name"
                                  : null,
                              onSaved: (value) => taskName = value!,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(24),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    title:
                                        widget.id == null ? "Cancel" : "Delete",
                                    textColor: ColorUtilities.text_900,
                                    height: getProportionateScreenWidth(50),
                                    buttonColor: const Color(0xFFEBDCDC),
                                    onButtonTap: () {
                                      if (widget.id == null) {
                                        Navigator.pop(context, 0);
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (builder) =>
                                                CupertinoAlertDialog(
                                                  title:
                                                      const Text("Delete Task"),
                                                  content: const Text(
                                                      "Are you sure you want to delete this task?"),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                        onPressed: () {
                                                          widget.model!
                                                              .removeTask(
                                                                  widget.id!);
                                                          Navigator.pop(
                                                              builder);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            const Text("Yes")),
                                                    CupertinoDialogAction(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              builder);
                                                        },
                                                        child: const Text("No"))
                                                  ],
                                                ));
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(12),
                                ),
                                Expanded(
                                  child: CustomButton(
                                    title:
                                        widget.id == null ? "Create" : "Update",
                                    height: getProportionateScreenWidth(50),
                                    buttonColor: ColorUtilities.primary_500,
                                    onButtonTap: () async {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();

                                        if (widget.id == null) {
                                          int lengthOfTasks =
                                              taskProvider.tasks.length;

                                          TaskModel task = TaskModel(
                                              userId: 1,
                                              id: lengthOfTasks + 1,
                                              title: taskName,
                                              completed: false);

                                          taskProvider.addTask(task);

                                          Navigator.pop(context, 1);
                                        } else {
                                          widget.model!.updateTask(
                                            widget.id!,
                                            taskName,
                                          );
                                          Navigator.pop(context, 1);
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
