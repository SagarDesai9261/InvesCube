import 'dart:convert';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:stock_market/authentication/signin.dart';
import 'package:stock_market/homescreen.dart';
import 'package:stock_market/screens/intraday.dart';
import 'package:stock_market/screens/long_term.dart';
import 'package:stock_market/screens/medium_term.dart';
import 'package:stock_market/screens/positional.dart';
import 'package:stock_market/screens/short_term.dart';
import 'package:stock_market/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_market/widget/internet.dart';

import 'Helper_noti.dart';
import 'NotificationService.dart';
import 'model/providers.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.high,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A Background message just showed up: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs.getBool('first_launch') ?? true;
  if (isFirstLaunch) {
    // Clear data if it's the first launch after reinstalling the app
    await prefs.clear();
    // Set the flag to false to indicate the app has been launched once
    await prefs.setBool('first_launch', false);
  }
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Firebase local notification plugin
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  // Firebase messaging
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ToggleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AboutDisplayProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => StrengthDisplayProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FeedbackProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CarouselIndexProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomSheetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserInfoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Midterm_history_data(),
        ),
        ChangeNotifierProvider(
          create: (context) => Short_history_data(),
        ),
        ChangeNotifierProvider(
          create: (context) => Longterm_history_data(),
        ),
        ChangeNotifierProvider(
          create: (context) => Intraday_history_data(),
        ),
        ChangeNotifierProvider(
          create: (context) => Positional_history_data(),
        ),
        ChangeNotifierProvider(
          create: (context) => Close_call(),
        ),
        ChangeNotifierProvider(
          create: (context) => Midterm_data(),
        ),
        ChangeNotifierProvider(
          create: (context) => Short_data(),
        ),
        ChangeNotifierProvider(
          create: (context) => Longterm_data(),
        ),
        ChangeNotifierProvider(
          create: (context) => Notification_data(),
        ),
        ChangeNotifierProvider(
          create: (context) => CountDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InternetConnectivity(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          home: HomeScreen()),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NotificationServices notificationServices = NotificationServices();
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/intraday': (context) => Intraday_Live_Calls(),
        '/positional': (context) => positional_live_calls(),
        '/shortterm': (context) => short_term_live_calls(),
        '/longterm': (context) => long_term_live_calls(),
        '/midterm': (context) => mid_term_live_calls(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

/*

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  await Firebase.initializeApp();
}


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
*/

