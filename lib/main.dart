import 'package:cafeteria_revolucion/pages/register/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cafeteria_revolucion/pages/login/login_page.dart';

    void main()  {
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
      }

      @override
      Widget build(BuildContext context) {
        return GetMaterialApp(
          title: "Cafeteria Revolucion",
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          getPages: [
            GetPage(name: "/", page: () => LoginPage()),
            GetPage(name: "/register", page: () => RegisterPage()),
          ],
          navigatorKey: Get.key,
          theme: ThemeData(
            primaryColor: Colors.black,
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



