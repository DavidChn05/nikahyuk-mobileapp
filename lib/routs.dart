import 'package:flutter/widgets.dart';
import 'package:nikahyuk/screens/splash/splashscreen.dart';
import 'package:nikahyuk/screens/sign_in/signin_screen.dart';
import 'package:nikahyuk/screens/forgot_password/forgotpassword_screen.dart';
import 'package:nikahyuk/screens/sign_up/signup_screen.dart';
import 'package:nikahyuk/screens/login_success/loginsuccess_screen.dart';
import 'package:nikahyuk/screens/home_page/homepage.dart';
import 'package:nikahyuk/screens/details/detailScreen.dart';
import 'package:nikahyuk/screens/chart/components/mychart.dart';
import 'package:nikahyuk/screens/profile/profileScreen.dart';
import 'package:nikahyuk/screens/providers/login_page.dart';

// make nama route
// semua rute dicoding disini
final Map<String, WidgetBuilder> routes = {
  splashScreen.routeName: (context) => splashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  HomePageScreen.routeName: (context) => HomePageScreen(),
  DetailScreen.routeName: (context) => DetailScreen(),
  MyChart.routeName: (context) => MyChart(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  LoginPage.routeName: (context) => LoginPage(),
};
