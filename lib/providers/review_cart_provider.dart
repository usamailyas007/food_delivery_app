import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../model/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData(int cartPrice, int cartQuantity, String cartName,
      String cartImage, String cartId,) async {
    await FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourReviewCart')
        .doc(cartId)
        .set({
      'cartName': cartName,
      'cartImage': cartImage,
      'cartId': cartId,
      'cartPrice': cartPrice,
      'cartQuantity': cartQuantity,
      'isAdd': true
    });
  }

  //////////////////////////////////////////////Update ReviewcartData//////////////////////////////////////////////////

  void updateReviewCartData(int cartPrice, int cartQuantity, String cartName,
      String cartImage, String cartId,) async {
    await FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourReviewCart')
        .doc(cartId)
        .update({
      'cartName': cartName,
      'cartImage': cartImage,
      'cartId': cartId,
      'cartPrice': cartPrice,
      'cartQuantity': cartQuantity,
      'isAdd': true
    });
  }

  List<ReviewCartModel> reviewCartDataList = [];

  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];

    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourReviewCart')
        .get();
    reviewCartValue.docs.forEach((element) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
          cartId: element.get('cartId'),
          cartName: element.get('cartName'),
          cartImage: element.get('cartImage'),
          cartPrice: element.get('cartPrice'),
          cartQuantity: element.get('cartQuantity'));
      newList.add(reviewCartModel);
    });
    reviewCartDataList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartDataList;
  }

  ///////////////////////////////review cart delete////////////////////////////////////////////////
  reviewCartDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourReviewCart')
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}
