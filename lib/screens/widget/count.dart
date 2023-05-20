import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import '../../providers/review_cart_provider.dart';

class AddProduct extends StatefulWidget {
  String productName;
  String productImage;
  String productId;
  int productPrice;

  AddProduct({Key? key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productId})
      : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider =
    Provider.of<ReviewCartProvider>(context);
    return Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)),
      child: isTrue == true
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              if (count == 1) {
                setState(() {
                  isTrue = false;
                });
              }
              if (count > 1) {
                setState(() {
                  count--;
                });
              }
            },
            child: Icon(Icons.remove, size: 15, color: Color(0xffd6b740)),
          ),
          Text(
            '$count',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xffd6b740)),
          ),
          InkWell(
              onTap: () {
                setState(() {
                  count++;
                });
              },
              child: Icon(Icons.add, size: 15, color: Color(0xffd6b740)))
        ],
      )
          : Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isTrue = true;
            });
            reviewCartProvider.addReviewCartData(
                widget.productPrice, count, widget.productName,
                widget.productImage, widget.productId);
          },
          child: Text(
            'ADD',
            style: TextStyle(color: primaryColor),
          ),
        ),
      ),
    );
  }
}
