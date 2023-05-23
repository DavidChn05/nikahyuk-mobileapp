import 'package:flutter/material.dart';
import 'components/body.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
