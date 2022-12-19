import 'package:alarm/view/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
void main() async{

  // Be sure to add this line if initialize() call happens before runApp()
  WidgetsFlutterBinding.ensureInitialized();

  await AndroidAlarmManager.initialize();
  runApp(  MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
