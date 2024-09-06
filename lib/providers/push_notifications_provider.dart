import 'package:cafeteria_revolucion/providers/users_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationsProvider {

  late AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
  );

  late FlutterLocalNotificationsPlugin plugin = FlutterLocalNotificationsPlugin();

  void initPushNotification() async {
    await plugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

  }



  void onMessageListener() async {
    FirebaseMessaging.instance.getInitialMessage().then(
            (message) {
          if (message != null) {

          }
        }
    );

    //PRIMER PLANO
    FirebaseMessaging.onMessage.listen((message){
      showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });
  }

  void showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    AppleNotification? apple = message.notification?.apple;



//    var largeIconBitmapSource = DrawableResourceAndroidBitmap(''); // Cambia 'ruta_de_tu_imagen' por la ruta de la imagen que deseas usar como icono grande

    if(notification != null && (apple != null || android != null )){
      plugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            playSound: true,
            largeIcon: DrawableResourceAndroidBitmap('@drawable/ic_launcher'),
            visibility: NotificationVisibility.public,
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
      );
    }


  }


  void saveToken(String idUser, String oldTokenPush) async {
    String? token = await FirebaseMessaging.instance.getToken();
    print('TOKEN: $token');
    UsersProvider usersProvider = UsersProvider();
    if(token != null && token != oldTokenPush){
      await usersProvider.updateNotificationToken(idUser, token);
    }
  }


}