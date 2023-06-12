import 'package:flutter/material.dart';
import 'package:nikahyuk/screens/details/detailScreen.dart';

import '../../../components/product_card.dart';
import '../../../models/product.dart';
import 'sectiontitle.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({
    super.key,
  });

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  // getData() async {
  //   carts = await repository.getData();
  // }

  @override
  void initState() {
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Popular Product",
          press: () {},
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // ListView.separated(
              //     scrollDirection: Axis.horizontal,
              //     shrinkWrap: true,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         height: 50,
              //         width: 50,
              //         child: Text(carts[index].title),
              //       );
              //     },
              //     separatorBuilder: (context, index) {
              //       return SizedBox(
              //         width: 10,
              //       );
              //     },
              //     itemCount: carts.length),
              ...List.generate(
                listProducts.length,
                (index) => ProductCard(
                  product: listProducts[index],
                  press: () => Navigator.pushNamed(
                      context, DetailScreen.routeName,
                      arguments: ProductDetailsArguments(
                          product: listProducts[index])),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ...List.generate(
                listProducts.length,
                (index) => ProductCard(
                  product: listProducts[index],
                  press: () => Navigator.pushNamed(
                      context, DetailScreen.routeName,
                      arguments: ProductDetailsArguments(
                          product: listProducts[index])),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // ListView.separated(
              //     scrollDirection: Axis.horizontal,
              //     shrinkWrap: true,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         height: 50,
              //         width: 50,
              //         child: Text(carts[index].title),
              //       );
              //     },
              //     separatorBuilder: (context, index) {
              //       return SizedBox(
              //         width: 10,
              //       );
              //     },
              //     itemCount: carts.length),
              ...List.generate(
                listProducts.length,
                (index) => ProductCard(
                  product: listProducts[index],
                  press: () => Navigator.pushNamed(
                      context, DetailScreen.routeName,
                      arguments: ProductDetailsArguments(
                          product: listProducts[index])),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ...List.generate(
                listProducts.length,
                (index) => ProductCard(
                  product: listProducts[index],
                  press: () => Navigator.pushNamed(
                      context, DetailScreen.routeName,
                      arguments: ProductDetailsArguments(
                          product: listProducts[index])),
                ),
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
