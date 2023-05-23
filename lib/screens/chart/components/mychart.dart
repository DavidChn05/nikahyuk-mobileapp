import 'package:flutter/material.dart';
import 'package:nikahyuk/components/defaultbutton.dart';
import 'package:nikahyuk/constants.dart';
import 'package:nikahyuk/models/Cart.dart';
import 'package:nikahyuk/screens/chart/components/body.dart';

class MyChart extends StatelessWidget {
  const MyChart({super.key});
  static String routeName = "/chart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Your Chart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${charts.length} Items",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      body: Body(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        // height: 174,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/icons/receipt.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Spacer(),
                  Text("Add vouncher code"),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kTextColor,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Total: \n",
                      children: [
                        TextSpan(
                          text: "\IDR ${572.000}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 190,
                    child: DefaultButton(text: "Check Out", press: () {}),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
