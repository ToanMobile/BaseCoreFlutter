/*
import '../../app/telemed_app.dart';

class LocalNotificationManager with HandleNotificationMixin {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  NotificationAppLaunchDetails? notificationAppLaunchDetails;

  init() async {
    _requestPermissions();
    notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_notification');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
            onDidReceiveLocalNotification: (int id, String? title, String? body,
                String? payload) async {});
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload != null) {}
    });
    //Khi co push local,sau do tat app va bam vao noti tren thanh bar
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      String? payload = notificationAppLaunchDetails!.payload;
      if (payload != null) {}
    }
  }

  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  int fcmId = 0;

  Future<void> showNotification(String? title, String? body,
      {String? payload}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            "notification_telemed", 'Telemed', 'Firebase Cloud Messaging',
            importance: Importance.max,
            playSound: true,
            priority: Priority.high,
            autoCancel: true,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        fcmId++, title ?? null, body ?? null, platformChannelSpecifics,
        payload: payload ?? null);
  }
}
*/
