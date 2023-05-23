import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      // {"icon": "assets/icons/flash-sale.png", "text": "Flash Sell"},
      // // {"icon": "assets/icons/bill.png", "text": "Bill"},
      // {"icon": "assets/icons/console.png", "text": "Game"},
      // {"icon": "assets/icons/gift-box.png", "text": "Daily Gift"},
      // {"icon": "assets/icons/menu.png", "text": "More"},
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            categories.length,
            (index) => CategoryCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.press,
    required this.icon,
    required this.text,
  });

  final icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 205, 222),
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(icon),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
