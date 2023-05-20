import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/model/review_cart_model.dart';
import 'package:food_app/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';

import '../widget/single_item.dart';

class ReviewCart extends StatelessWidget {
  late ReviewCartProvider reviewCartProvider;

  showAlertDialog(BuildContext context,ReviewCartModel delete) {

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
        reviewCartProvider.reviewCartDataDelete(delete.cartId);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
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
     reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text('Total Amount'),
        subtitle: Text('\$ 170.00',style: TextStyle(color: Colors.green.shade900),),
        trailing: InkWell(
          onTap: (){},
          child: Container(
            width: 160,
            height: 45,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(30)
            ),
            child: Center(child: Text('Submit')),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text('Review Cart',style: TextStyle(color: textColor,fontSize: 18),),
      ),
      body: reviewCartProvider.getReviewCartDataList.isEmpty?Center(
        child: Text('No Data',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
      ): ListView.builder(
        itemCount: reviewCartProvider.getReviewCartDataList.length,
        itemBuilder: (context, index) {
          ReviewCartModel data = reviewCartProvider.getReviewCartDataList[index];
          return Column(
            children: [
              SizedBox(height: 10,),
              SingleItem(
                onDelete: (){
                  showAlertDialog(context,data);
                },
                productPrice: data.cartPrice,
                productName: data.cartName,
                productImage: data.cartImage,
                productId: data.cartId,
                productQuantity: data.cartQuantity,
                isBool: true,
              ),
            ],
          );
        },
      ),
    );
  }
}
