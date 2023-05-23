import 'package:flutter/material.dart';
import 'package:nikahyuk/constants.dart';
import 'package:nikahyuk/models/Cart.dart';

import 'cartItemCard.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      itemCount: charts.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Dismissible(
          key: Key(charts[0].product.id.toString()),
          direction: DismissDirection.endToStart,
          background: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0xFFFFE6E6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Spacer(),
                Image.asset(
                  "assets/icons/delete.png",
                  width: 30,
                ),
              ],
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              charts.removeAt(index);
            });
          },
          child: CartItemCard(
            cart: charts[index],
          ),
        ),
      ),
    );
  }
}
