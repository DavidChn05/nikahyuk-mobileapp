import 'package:flutter/material.dart';

import 'sectiontitle.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Spesial for you",
          press: () {},
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/Image Banner 2.png",
                category: "Smartphone",
                numOfBrands: 18,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/Image Banner 3.png",
                category: "Fashion",
                numOfBrands: 24,
                press: () {},
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  });

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 100,
        width: 242,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 218, 218, 218).withOpacity(0.4),
                  Color.fromARGB(255, 0, 0, 0).withOpacity(0.15)
                ])),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "$category\n",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: "$numOfBrands Brands "),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
