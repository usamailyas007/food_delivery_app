import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/count.dart';

class SingleProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final String productId;
  final int productPrice;
  final VoidCallback onTap;

  SingleProduct({required this.productImage,
    required this.onTap,
    required this.productName,
    required this.productPrice,
    required this.productId});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 230,
            width: 160,
            decoration: BoxDecoration(
                color: Color(0xffd9dad9),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: widget.onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: InkWell(child: Image.network(widget.productImage)),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                          widget.productName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${widget.productPrice}\$/50 Gram',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                              children: [
                          Expanded(
                          child: Container(
                          padding: EdgeInsets.only(left: 3),
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: [
                              Text(
                                '50 Grams',
                                style: TextStyle(fontSize: 9),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 25,
                                color: Color(0xffd6b740),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(child: AddProduct(
                      productName: widget.productName,
                        productPrice: widget.productPrice,
                        productImage: widget.productImage,
                        productId: widget.productId, ))
              ],
            ),
          ),
        ],
      ),
    ))
    ],
    ),
    )
    ],
    ),
    );
  }
}
