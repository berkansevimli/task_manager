import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:task_manager_interview/core/utilities/utilities.dart';
import 'package:task_manager_interview/view/screens/home/model/task_model.dart';
import 'package:task_manager_interview/view/screens/home/view_model/home_view_model.dart';

import '../../../../core/providers/task_provider.dart';
import '../../../../size_config.dart';
import '../../../common_widgets/custom_button.dart';
import '../../../common_widgets/custom_text_field.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final formKey = GlobalKey<FormState>();
  String taskName = "";

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(context),
      builder: (context, viewModel, child) {
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
                                        title: "Cancel",
                                        textColor: ColorUtilities.text_900,
                                        height: getProportionateScreenWidth(50),
                                        buttonColor: const Color(0xFFEBDCDC),
                                        onButtonTap: () =>
                                            Navigator.pop(context),
                                      ),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(12),
                                    ),
                                    Expanded(
                                      child: CustomButton(
                                        title: "Create",
                                        height: getProportionateScreenWidth(50),
                                        buttonColor: ColorUtilities.primary_500,
                                        onButtonTap: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            formKey.currentState!.save();

                                            int lengthOfTasks =
                                                taskProvider.tasks.length;

                                            TaskModel task = TaskModel(
                                                userId: 1,
                                                id: lengthOfTasks + 1,
                                                title: taskName,
                                                completed: false);

                                            taskProvider.addTask(task);

                                            Navigator.pop(context, 1);
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
      },
    );
  }
}
