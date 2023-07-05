import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../model/product_model.dart';


class WishListProvider with ChangeNotifier {
  void addWishListData(int wishListPrice, int wishListQuantity,
      String wishListName,
      String wishListImage, String wishListId,) async {
    await FirebaseFirestore.instance
        .collection('WishList')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourWishList')
        .doc(wishListId)
        .set({
      'wishListName': wishListName,
      'wishListImage': wishListImage,
      'wishListId': wishListId,
      'wishListPrice': wishListPrice,
      'wishListQuantity': wishListQuantity,
      'wishList': true
    });
  }


  ///////////////////Get WishlistData//////////////////////////

  List<ProductModel> wishList = [];

  getWishListData() async {
    List<ProductModel> newlist = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection('WishList')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourWishList')
        .get();
    value.docs.forEach((element) {
      ProductModel productModel = ProductModel(
          productQuantity: element.get('wishListQuantity'),
          productImage: element.get('wishListImage'),
          productName: element.get('wishListName'),
          productPrice: element.get('wishListPrice'),
          productId: element.get('wishListId'));
      newlist.add(productModel);
    });
    wishList = newlist;
    notifyListeners();
  }
  List<ProductModel> get getWishList{
    return wishList;
  }


  /////////////////////////////Delete WishList////////////////////////////////
  deleteWishList(wishListId){
    FirebaseFirestore.instance
        .collection('WishList')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourWishList').doc(wishListId).delete();
  }

}