import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier {
  void addWishListData(int wishListPrice, int wishListQuantity, String wishListName,
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
}