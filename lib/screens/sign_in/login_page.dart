import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:nikahyuk/constants.dart';
import 'package:nikahyuk/screens/home_page/homepage.dart';
import 'package:provider/provider.dart';
import 'package:nikahyuk/screens/providers/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String routeName = "/login_page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      try {
        await Provider.of<Authentication>(context, listen: false)
            .login(data.name, data.password);
      } catch (err) {
        return err.toString();
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      try {
        await Provider.of<Authentication>(context, listen: false)
            .signup(data.name, data.password);
      } catch (err) {
        return err.toString();
      }

      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'NikahYuk',
      onLogin: _authUser,
      onSignup: _signupUser,
      theme: LoginTheme(
        primaryColor: kPrimaryColor,
        accentColor: kSecondaryColor,
        titleStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onSubmitAnimationCompleted: () {
        Navigator.pushNamed(context, HomePageScreen.routeName);
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
