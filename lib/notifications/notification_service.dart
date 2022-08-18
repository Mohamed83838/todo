import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';
import 'package:todo/screens/home_screen/home_screen.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> init() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  

    tz.initializeTimeZones();
  }

  AndroidNotificationChannel channel = AndroidNotificationChannel(
    
      'high_channel', 'High Importance Notification',
      description: "This channel is for important notification",
      enableLights: true,
      showBadge: true,
      enableVibration: true,
      ledColor: Colors.black,
      
      playSound: true,
      sound: RawResourceAndroidNotificationSound('sound.mp3'),
      importance: Importance.max);


  Future<void> sendNotification(int id, String title, String body) async {
    flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description),
      ),
    );
  }

  Future<void> sendTimeNotifications(
    int id,
    String title,
    String body,
    TZDateTime scheduledDate,
  ) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduledDate,
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description)),
        androidAllowWhileIdle: true,
        
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime
            
            );
  }

  Future<void> delete_notification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }



}
