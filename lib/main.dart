import 'package:cafeteria_revolucion/pages/client/client_page.dart';
import 'package:cafeteria_revolucion/pages/onboarding/onboarding_page.dart';
import 'package:cafeteria_revolucion/pages/password_recovery/email/password_recovery_email_page.dart';
import 'package:cafeteria_revolucion/pages/password_recovery/update/password_recovery_update_page.dart';
import 'package:cafeteria_revolucion/pages/password_recovery/verification/password_recovery_verification_page.dart';
import 'package:cafeteria_revolucion/pages/phone/register/phone_register_page.dart';
import 'package:cafeteria_revolucion/pages/phone/verification/phone_verification_page.dart';
import 'package:cafeteria_revolucion/pages/register/register_page.dart';
import 'package:cafeteria_revolucion/pages/welcome/welcome_page.dart';
import 'package:cafeteria_revolucion/providers/push_notifications_provider.dart';
import 'package:cafeteria_revolucion/utils/firebase_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cafeteria_revolucion/pages/login/login_page.dart';
import 'package:get_storage/get_storage.dart';

import 'models/user.dart';

bool isFirstTime = GetStorage().read('isFirstTime')?? true;
User userSession = User.fromJson(GetStorage().read('user') ?? {});

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: FirebaseConfig.currentPlatform);

  print('Recibiendo notificación en segundo plano ${message.messageId}');
}


PushNotificationsProvider pushNotificationsProvider = PushNotificationsProvider();



    void main() async {
      await GetStorage.init();
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
          options: FirebaseConfig.currentPlatform);

      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

      pushNotificationsProvider.initPushNotification();

      runApp(MyApp());
    }

    class MyApp extends StatefulWidget {
      const MyApp({super.key});

      @override
      State<MyApp> createState() => _MyAppState();
    }

    class _MyAppState extends State<MyApp> {

      @override
      void initState() {

        super.initState();
        pushNotificationsProvider.onMessageListener();
      }

      @override
      Widget build(BuildContext context) {
        return GetMaterialApp(
          title: "Cafeteria Revolucion",
          debugShowCheckedModeBanner: false,
          initialRoute:
          isFirstTime == true && userSession.id == null?
            '/onboarding' :
            userSession.id != null ?
            '/client' :
            '/',
          getPages: [

            GetPage(name: "/", page: () => WelcomePage()),
            GetPage(name: "/onboarding", page: () => OnboardingPage()),
            GetPage(name: "/login", page: () => LoginPage()),
            GetPage(name: "/register", page: () => RegisterPage()),
            GetPage(name: "/client", page: () => ClientPage()),
            GetPage(name: "/phone/register", page: () => PhoneRegisterPage()),
            GetPage(name: "/phone/verification", page: () => PhoneVerificationPage()),
            GetPage(name: "/password_recovery/update", page: () => PasswordRecoveryUpdatePage()),
            GetPage(name: "/password_recovery/email", page: () => PasswordRecoveryEmailPage()),
            GetPage(name: "/password_recovery/verification", page: () => PasswordRecoveryVerificationPage()),

          ],
          navigatorKey: Get.key,
          theme: ThemeData(
            primaryColor: Colors.black,
            fontFamily: 'Poppins',
            //colorScheme: ColorScheme.light(primary: Colors.black),
            colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: Colors.black,
                onPrimary: Colors.black,
                secondary: Colors.white,
                onSecondary: Colors.black,
                error: Colors.red,
                onError: Colors.white,
                background: CupertinoColors.white,
                onBackground: Colors.black,
                surface: Colors.white,
                onSurface: Colors.black,),
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          )
        );
      }
    }



