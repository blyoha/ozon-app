import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                color: Colors.red,
              ),
              child: const TextField(
                  decoration: InputDecoration(
                      hintText: "Search", prefixIcon: Icon(Icons.search), border: InputBorder.none))),
        ),
        const VerticalDivider(color: Colors.grey, width: 1),
        // qr icon
        Container(
          height: 40,
          width: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            color: Colors.red,
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.qr_code_2),
          ),
        ),
      ]
    );
  }
}
