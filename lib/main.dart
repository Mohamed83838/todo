import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:todo/notifications/notification_service.dart';
import 'package:todo/screens/add_task_screen/add_task.dart';
import 'package:todo/screens/home_screen/home_screen.dart';
import 'package:todo/screens/welcome_screen/welcome_screen.dart';
import 'package:todo/test.dart';
import 'package:todo/theme/theme_constants.dart';


Future<void> onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
DateTime counter=DateTime.now();
service.on("stopservice").listen((event) {
  service.stopSelf();
  
});
 if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });
    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });

 }

 NotificationService().init();
  Timer.periodic(const Duration(seconds: 1), (timer) async {
     NotificationService().init();
     
  });
  

  }
Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will be executed when app is in foreground or background in separated isolate
      onStart: onStart,

      // auto start service
      autoStart: true,
      isForegroundMode: false,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: true,

      // this will be executed when app is in foreground in separated isolate
      onForeground: onStart,

      // you have to enable background fetch capability on xcode project
      onBackground: onIosBackground,
    ),
  );

NotificationService().init();
  service.startService();
}


bool onIosBackground(ServiceInstance service) {
  WidgetsFlutterBinding.ensureInitialized();
  

  return true;
}











void main() async{
  
WidgetsFlutterBinding.ensureInitialized();
await initializeService();
NotificationService().init();

 

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode:ThemeMode.system,
      home: welcome_screen(),
    );
  }
}
