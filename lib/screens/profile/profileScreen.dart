import 'package:flutter/material.dart';
import 'package:nikahyuk/constants.dart';
import 'package:nikahyuk/enums.dart';
import 'package:nikahyuk/screens/home_page/homepage.dart';
import 'package:nikahyuk/screens/profile/components/body.dart';

import '../../components/customBottomNavBar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
