import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nikahyuk/routs.dart';
import 'package:nikahyuk/screens/detail_account/detailAccount.dart';
import 'package:nikahyuk/screens/providers/auth.dart';
import 'package:nikahyuk/screens/providers/customers.dart';
import 'package:nikahyuk/screens/providers/login_page.dart';
import 'package:nikahyuk/screens/splash/splashscreen.dart';
import 'package:provider/provider.dart';

import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Authentication(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nikah YUK',
        theme: theme(),
        // home: splashScreen(),
        initialRoute: splashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
