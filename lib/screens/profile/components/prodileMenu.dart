import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    required this.press,
  });

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.all(20),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            Color.fromARGB(255, 245, 247, 250),
          ),
        ),
        onPressed: press,
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 25,
              color: kPrimaryColor,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: kSecondaryColor,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: kSecondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
