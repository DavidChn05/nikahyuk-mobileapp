import 'package:flutter/material.dart';
import 'package:nikahyuk/components/customBottomNavBar.dart';
import 'package:nikahyuk/enums.dart';
import 'components/body.dart';

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
