import 'package:authentication_provider/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:nikahyuk/components/customBottomNavBar.dart';
import 'package:nikahyuk/enums.dart';
import 'package:provider/provider.dart';
import 'components/body.dart';
import 'package:nikahyuk/screens/providers/auth.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});
  static String routeName = "/home_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
