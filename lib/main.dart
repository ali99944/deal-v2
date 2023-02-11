
import 'package:deal/Screens/HomeScreen.dart';
import 'package:deal/Screens/LoginScreen.dart';
import 'package:deal/Screens/SplashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Provider/AdminMode.dart';
import 'Provider/UserProvider.dart';
import 'Screens/SplashChooseLanguage.dart';
import 'Services/UserServices.dart';
import 'firebase_options.dart';

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;


bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
    'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
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
  isFlutterLocalNotificationsInitialized = true;
}

Future<void> showFlutterNotification(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: 'launch_background',
        ),
      ),
    );

    await UserServices.addUserNotifications(
        uid: message.data['uid'],
        title: notification.title!,
        body: notification.body!
    );
  }
}

Future<void> requestNotificationPermission() async {
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await EasyLocalization.ensureInitialized();
  await requestNotificationPermission();
  await setupFlutterNotifications();

  FirebaseMessaging.onMessage.listen(showFlutterNotification);

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool isLogged = await sharedPreferences.getBool('isLogged') ?? false;
  String email = await sharedPreferences.getString('email') ?? '';
  String password = await sharedPreferences.getString('password') ?? '';
  String passUid = '';

  if(isLogged){
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value)async{
      String uid = value.user!.uid;
      passUid = uid;
      await UserServices.changeUserStatus(uid: uid, status: 'online');
    });
  }



  runApp(EasyLocalization(
    supportedLocales: [Locale('en',''),Locale('ar','')],
      path: "assets/lang",
      fallbackLocale: Locale('en',''),
      child:MyApp(isLogged:isLogged,uid: passUid,)
  ));
}

class AuthWrapper extends StatelessWidget{
  final bool isLogged;
  AuthWrapper({required this.isLogged});

  @override
  Widget build(BuildContext context) {
    return isLogged? HomeScreen() : SplashChooseLanguage();
  }
}

class MyApp extends StatelessWidget {
  final bool isLogged;
  final String uid;

  const MyApp({super.key, required this.isLogged,required this.uid});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
       FutureBuilder(
         future: Future.delayed(Duration(seconds: 2)),
         builder: (context , snapshot) {
         if(snapshot.connectionState == ConnectionState.waiting){
           return SplashScreen();
         } else{
           return MultiProvider(
             providers: [
              ChangeNotifierProvider<AdminMode>(create: (context)=>AdminMode()),
              ChangeNotifierProvider<UserProvider>(create: (context)=>UserProvider(uid: uid)),
             ],
             
             child: MaterialApp(
               debugShowCheckedModeBanner: false,
               theme: ThemeData(
                 fontFamily: context.locale.languageCode == 'en' ? 'ACCORD' : 'GESSTWO'
               ),
               home: AuthWrapper(isLogged: isLogged,),
               localizationsDelegates: context.localizationDelegates,
               supportedLocales: context.supportedLocales,
               locale:context.locale,
             ),
           );
         }
       } ,);

  }
}




