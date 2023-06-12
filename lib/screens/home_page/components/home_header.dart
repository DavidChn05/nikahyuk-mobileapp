import 'package:flutter/material.dart';
import 'package:nikahyuk/constants.dart';
import 'package:nikahyuk/screens/chart/components/mychart.dart';

import '../../../components/roundedIconCounter.dart';
import 'iconbtn_counter.dart';
import 'searchfield.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          RoundedIconCounter(
            iconData: Icons.shopping_basket,
            press: () {
              Navigator.pushNamed(context, MyChart.routeName);
            },
          ),
          IconBtnWithCounter(
            iconSrc: Icons.notifications,
            numOfItems: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
