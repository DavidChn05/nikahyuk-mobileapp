import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahyuk/routs.dart';
import 'package:nikahyuk/screens/authentication/controllers/repository/authentication_repository.dart';
import 'package:nikahyuk/screens/providers/auth.dart';
import 'package:nikahyuk/screens/splash/splashscreen.dart';
import 'package:provider/provider.dart';

import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Authentication()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nikah YUK',
        theme: theme(),
        // home: splashScreen(),
        initialRoute: splashScreen.routeName,
        routes: routes,
      ),
    );
    // ChangeNotifierProvider(
    //   create: (context) => Authentication(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Nikah YUK',
    //     theme: theme(),
    //     // home: splashScreen(),
    //     initialRoute: splashScreen.routeName,
    //     routes: routes,
    //   ),
    // );
  }
}
