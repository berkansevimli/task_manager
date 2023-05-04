import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_interview/core/providers/task_provider.dart';
import 'package:task_manager_interview/size_config.dart';
import 'package:task_manager_interview/theme.dart';
import 'package:task_manager_interview/view/screens/home/view/home_view.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
         providers: [
        ChangeNotifierProvider<TaskProvider>.value(value: TaskProvider()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme(),
        home: const HomeView(),
      ),
    );
  }
}
