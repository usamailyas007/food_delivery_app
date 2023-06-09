import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/wish_list_provider.dart';
import '../review_cart/review_cart.dart';
import '../widget/count.dart';

enum SigninCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  String productName;
  String productImage;
  String productId;
  int productPrice;

  ProductOverview({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
  });

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SigninCharacter _character = SigninCharacter.fill;

  Widget bottomNavigatorBar(
      {required Color iconColor,
      required Color backgroundColor,
      required Color color,
      required String title,
      required IconData iconData,
      required VoidCallback onTap}) {
    return Expanded(
        child: InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 20,
              color: iconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    ));
  }

  bool wishListBool = false;

  getWishListBool() {
    FirebaseFirestore.instance
        .collection('WishList')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourWishList')
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if(value.exists){
                    setState(() {
                      wishListBool = value.get('WishList');
                    }),
                  }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    //getWishListBool();
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorBar(
              onTap: () {
                setState(() {
                  wishListBool = !wishListBool;
                });
                if (wishListBool == true) {
                  wishListProvider.addWishListData(
                      widget.productPrice,
                      2,
                      widget.productName,
                      widget.productImage,
                      widget.productId);
                } else{
                  wishListProvider.deleteWishList(widget.productId);
                }
              },
              iconColor: Colors.grey,
              backgroundColor: textColor,
              color: Colors.white70,
              title: 'Add To WishList',
              iconData: wishListBool == false
                  ? Icons.favorite_outline
                  : Icons.favorite),
          bottomNavigatorBar(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReviewCart(),
                    ));
              },
              iconColor: Colors.white70,
              backgroundColor: primaryColor,
              color: textColor,
              title: 'Add To Cart',
              iconData: Icons.shop_outlined)
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xffd1ad17),
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Product Overview',
          style: TextStyle(color: textColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.productName),
                      subtitle: Text('\$50'),
                    ),
                    Container(
                      height: 250,
                      padding: EdgeInsets.all(30),
                      child: Image.network(widget.productImage),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: Text(
                        'Available Options',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: textColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green.shade700,
                              ),
                              Radio(
                                value: SigninCharacter.fill,
                                groupValue: _character,
                                onChanged: (value) {
                                  setState(() {
                                    _character = SigninCharacter.fill;
                                  });
                                },
                                activeColor: Colors.green.shade700,
                              )
                            ],
                          ),
                          Text('\$${widget.productPrice}'),
                          AddProduct(
                            productName: widget.productName,
                            productPrice: widget.productPrice,
                            productImage: widget.productImage,
                            productId: widget.productId, )
                          // Container(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 30, vertical: 10),
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: Colors.grey),
                          //       borderRadius: BorderRadius.circular(30)),
                          //   child: Row(
                          //     children: [
                          //       Icon(
                          //         Icons.add,
                          //         size: 15,
                          //         color: primaryColor,
                          //       ),
                          //       Text(
                          //         'ADD',
                          //         style: TextStyle(color: primaryColor),
                          //       )
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About This Product',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    'A product description is the marketing copy that explains what a product is and why it’s worth purchasing. The purpose of a product description is to supply customers with important information about the features and key benefits of the product so they’re compelled to buy.',
                    style: TextStyle(color: textColor, fontSize: 16))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
