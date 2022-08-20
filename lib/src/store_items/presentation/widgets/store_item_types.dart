import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../main/presentation/widgets/text.dart';

class StoreItemTypes extends StatefulWidget {
  final List typeList;

  const StoreItemTypes({Key? key, required this.typeList}) : super(key: key);

  @override
  State<StoreItemTypes> createState() => _StoreItemTypesState();
}

class _StoreItemTypesState extends State<StoreItemTypes> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.typeList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2,
                      color: selectedIndex == index
                          ? AppColors.focusColor
                          : AppColors.primaryColor.withOpacity(0.1))),
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: SimpleText(
                  text: widget.typeList[index], color: AppColors.primaryColor),
            ),
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}