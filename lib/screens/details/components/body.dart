import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nikahyuk/components/defaultbutton.dart';
import 'package:nikahyuk/constants.dart';
import 'package:nikahyuk/models/product.dart';
import 'package:nikahyuk/screens/chart/components/mychart.dart';
import 'package:url_launcher/url_launcher.dart';

import 'productDescription.dart';
import 'productImages.dart';
import 'topRoundedContainer.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.product});

  final Product product;

  void openWhatsapp(
      {required BuildContext context,
      required String text,
      required String number}) async {
    var whatsapp = "+6282144213369"; //+92xx enter like this
    var whatsappURlAndroid =
        "whatsapp://send?phone=" + whatsapp + "&text=$text";
    var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: ProductDescription(
              product: product,
              pressOnSeeMore: () {},
            ),
          ),
          SizedBox(
            height: 100,
          ),
          TopRoundedContainer(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 10,
                bottom: 30,
              ),
              child: DefaultButton(
                  text: "Contact Us",
                  press: () {
                    openWhatsapp(
                        context: context,
                        text: "Hi, I need some help",
                        number: "+6282144213369");
                  }),
            ),
          )
        ],
      ),
    );
  }

  void contactUs() async {
    var contact = '+6282144213369';
    var message = 'Hi, I need some help';

    var androidUrl =
        "https://wa.me/$contact/?text=${Uri.encodeComponent(message)}";
    var iosUrl =
        "whatsapp://send?phone=$contact&text=${Uri.encodeComponent(message)}";

    if (await canLaunch(androidUrl)) {
      await launch(androidUrl);
    } else if (await canLaunch(iosUrl)) {
      await launch(iosUrl);
    } else {
      print("WhatsApp is not installed");
    }
  }
}
