import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../main/widgets/text.dart';
import '../controllers/cart_controller.dart';
import '../models/store_item_model.dart';

class CartItem extends StatelessWidget {
  final CartController controller;
  final StoreItemModel storeItem;
  final int quantity;
  final int index;

  const CartItem(
      {Key? key,
      required this.controller,
      required this.storeItem,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isChecked = true;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // checkbox + image
              Row(
                children: [
                  Checkbox(
                      side: BorderSide(
                          color: AppColors.primaryColor.withOpacity(0.1),
                          width: 2),
                      activeColor: AppColors.focusColor,
                      shape: const CircleBorder(),
                      value: isChecked,
                      onChanged: (bool? value) {}),
                  Image.asset(
                    storeItem.images[0],
                    width: 80,
                    height: 80,
                  )
                ],
              ),
              // item info
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // price
                    Header(
                      text: "${controller.subTotalPrice[index]} руб",
                      color: AppColors.primaryColor,
                      size: 15,
                    ),
                    const SizedBox(height: 5),
                    // name
                    SizedBox(
                      width: 210,
                      child: Flexible(
                        child: Text(
                          storeItem.name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          // installment
          FittedBox(
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(254, 204, 50, 1)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SimpleText(
                    text: "Частями по ${(storeItem.price / 6).ceil()} / мес",
                    color: AppColors.primaryColor,
                    size: 12),
              ),
            ),
          ),
          Divider(
              thickness: 1, color: AppColors.secondaryColor.withOpacity(0.3)),
          // buttons bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                // to favourite
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                  ),
                  const Text("В избранное")
                ]),
                // remove
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                  content: const Text(
                                      "Вы точно хотите удалить товар? Отменить данное действие будет невозможно."),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text("Отмена")),
                                    TextButton(
                                        onPressed: () {
                                          controller.removeStoreItem(storeItem);
                                          Get.back();
                                        },
                                        child: const Text("Удолить товар"))
                                  ]));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                        ),
                        const Text("Удалить")
                        // SimpleText(text: "Удалить", color: AppColors.primaryColor)
                      ]),
                    ),
                  ),
                ),
                // quantity
                Row(
                  children: [
                    Text("$quantity шт."),
                    Column(
                      children: const [
                        Icon(Icons.keyboard_arrow_up_rounded),
                        Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}