# task_manager_interview


## Getting Started

This is interview project for MaxiDigital. These are steps fon installation:
1. Clone Repo and run flutter pub get in your terminal
2. If you are using mac with silicon processor you may have to do this: open project terminal cd ios -> pod install
3. and build project on your IOS or Android device 
4. Screenshots in screenshots folder
5. APK file in apk_file/app-release.apk


## Features

### State Management
1. Create your custom Task
2. Delete, Complete or incomplete task and filter tasks
3. User Input Validation 

### API Integration
1. fetch tasks from URL
2. Edit, complete, uncomplete, filter and delete your tasks
3. Error Handling in lib/core/helper/network_helper.dart I didn'nt implement to UI because api doesnt give me an error, but it easy to implement. 

## technologies used
1. get_it 
2. stacked and Provider for stateManagement
3. http for api calls
4. flutter_svg for icon performance
