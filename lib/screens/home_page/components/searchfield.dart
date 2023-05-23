import 'package:flutter/material.dart';

import '../../../constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search Here",
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
      ),
    );
  }
}
