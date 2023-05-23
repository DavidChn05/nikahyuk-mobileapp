import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nikahyuk/constants.dart';
import 'package:nikahyuk/models/product.dart';

import '../../../components/product_card.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'iconbtn_counter.dart';
import 'popular_product.dart';
import 'searchfield.dart';
import 'sectiontitle.dart';
import 'specialoffer.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 10),
          HomeHeader(),
          SizedBox(height: 15),
          DiscountBanner(),
          SizedBox(height: 20),
          Categories(),
          SizedBox(height: 20),
          SpecialOffers(),
          SizedBox(height: 20),
          PopularProducts(),
          SizedBox(height: 20),
        ],
      )),
    );
  }
}
