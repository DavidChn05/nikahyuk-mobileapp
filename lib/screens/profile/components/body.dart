import 'package:flutter/material.dart';
import 'package:nikahyuk/constants.dart';
import 'package:nikahyuk/screens/detail_account/detailAccount.dart';
import 'package:nikahyuk/screens/myaccount/myaccount.dart';
import 'package:nikahyuk/screens/splash/splashscreen.dart';
import 'package:nikahyuk/theme.dart';

import '../../authentication/repository/exceptions/authentication_repository.dart';
import 'prodileMenu.dart';
import 'profilePicture.dart';
import 'package:nikahyuk/screens/detail_account/detailAccount.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePict(),
        SizedBox(
          height: 20,
        ),
        ProfileMenu(
          icon: 'assets/icons/account.png',
          press: () {
            Navigator.pushNamed(context, MyAccount.routeName);
          },
          text: 'My Account',
        ),
        ProfileMenu(
          icon: 'assets/icons/bell.png',
          press: () {},
          text: 'Notifications',
        ),
        ProfileMenu(
          icon: 'assets/icons/settings.png',
          press: () {},
          text: 'Settings',
        ),
        ProfileMenu(
          icon: 'assets/icons/info-center.png',
          press: () {},
          text: 'Help Center',
        ),
        ProfileMenu(
          icon: 'assets/icons/exit.png',
          press: () {
            AuthenticationRepository.instance.logout();
          },
          text: 'Log Out',
        ),
      ],
    );
  }
}
