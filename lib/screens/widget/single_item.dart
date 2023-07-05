import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'count.dart';

class SingleItem extends StatelessWidget {
  bool isBool = false;
  bool wishList = false;
  String productImage;
  String productName;
  String productId;
  int productQuantity;
  VoidCallback onDelete;
  int productPrice;

  SingleItem(
      {Key? key,
      required this.isBool,
      required this.wishList,
      required this.productName,
      required this.productPrice,
      required this.onDelete,
      required this.productImage,
      required this.productId,
      required this.productQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 100,
                child: Center(child: Image.network(productImage)),
              )),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  child: Container(
                height: 95,
                child: Column(
                  mainAxisAlignment: isBool == false
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                              color: textColor, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$productPrice\$',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    isBool == false
                        ? GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          title: new Text('250 Grams'),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: new Text('500 Grams'),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: new Text('750 Grams'),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: new Text('1 Kg'),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text('50 Gram',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14))),
                                  Center(
                                      child: Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: primaryColor,
                                  ))
                                ],
                              ),
                            ),
                          )
                        : Text('50 Gram')
                  ],
                ),
              )),
              Expanded(
                child: Container(
                  height: 100,
                  padding: isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: isBool == false
                      ? AddProduct(
                          productName: productName,
                          productPrice: productPrice,
                          productImage: productImage,
                          productId: productId,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 17),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: onDelete,
                                child: Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: Colors.black45,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              wishList == false
                                  ? Container(
                                      height: 25,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.remove,
                                            size: 20,
                                            color: primaryColor,
                                          ),
                                          Text('1',
                                              style: TextStyle(
                                                  color: primaryColor)),
                                          Icon(
                                            Icons.add,
                                            size: 20,
                                            color: primaryColor,
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        isBool == false
            ? Container()
            : Divider(
                color: Colors.grey.shade500,
              )
      ],
    );
  }
}
