import 'package:flutter/material.dart';
import 'package:nikahyuk/constants.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});
  static String routeName = "/changename";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Edit Name",
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
