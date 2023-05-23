import 'package:flutter/material.dart';

import '../../../components/roundedIcon_btn.dart';

class CostumAppBar extends StatelessWidget with PreferredSizeWidget {
  const CostumAppBar({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedIconBtn(
                iconData: Icons.arrow_back_ios,
                press: () => Navigator.pop(context),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      "assets/icons/star.png",
                      width: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      preferredSize: Size.fromHeight(120),
    );
  }
}
