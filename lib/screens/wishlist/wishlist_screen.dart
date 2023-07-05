import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/model/product_model.dart';
import 'package:provider/provider.dart';

import '../../providers/wish_list_provider.dart';
import '../widget/single_item.dart';

class WishListScreen extends StatefulWidget {
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  late WishListProvider wishListProvider;
  showAlertDialog(BuildContext context,ProductModel delete) {

    // set up the button
    Widget noButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget yesButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        wishListProvider.deleteWishList(delete.productId);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("WishList Product"),
      content: Text("Would you like to Delete it?"),
      actions: [
        noButton,
        yesButton
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    wishListProvider.getWishListData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text('WishList',style: TextStyle(color: textColor,fontSize: 18),),
      ),
      body: ListView.builder(
        itemCount: wishListProvider.getWishList.length,
        itemBuilder: (context, index) {
          ProductModel data = wishListProvider.getWishList[index];
          return Column(
            children: [
              SizedBox(height: 10,),
              SingleItem(
                onDelete: (){
                  showAlertDialog(context, data);
                },
                productPrice: data.productPrice,
                productName: data.productName,
                productImage: data.productImage,
                productId: data.productId,
                productQuantity: data.productQuantity,
                isBool: true,
                wishList: true,
              ),
            ],
          );
        },
      ),
    );
  }
}
