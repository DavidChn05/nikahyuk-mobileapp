import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:nikahyuk/screens/myaccount/components/changename.dart';
import 'package:nikahyuk/screens/myaccount/components/myaccountmenu.dart';
import 'package:nikahyuk/screens/myaccount/components/myprofilepicture.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        MyProfilePicture(),
        SizedBox(
          height: 10,
        ),
        MyAccountMenu(text: "Full Name"),
        MyAccountMenu(text: "Email"),
        MyAccountMenu(text: "Password"),
        MyAccountMenu(text: "Re-Enter Password"),
      ],
    );
  }
}
