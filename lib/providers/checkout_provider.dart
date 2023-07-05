import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';

import '../model/dilevery_address_model.dart';
import '../screens/checkout/add_delivery_address/add_delivery_address.dart';

class CheckoutProvider with ChangeNotifier {
  bool isLoading = false;
  TextEditingController phone = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController society = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController altPhone = TextEditingController();

  // LocationData? setLocation;

  void Validator(context, myType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "firstname is empty",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "lastname is empty",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Mobile No is empty",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else if (altPhone.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Alternate Mobile No is empty",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else if (society.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Society is empty",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else if (street.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "street is empty",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "city is empty",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else if (area.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "area is empty",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else if (postalCode.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "postalCode is empty",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else {
      isLoading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection('AddDeliveryAddress')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'firstname': firstName.text,
        'lastname': lastName.text,
        'Mobile': phone.text,
        'alternateMobileNo': altPhone.text,
        'Society': society.text,
        'street': street.text,
        'city': city.text,
        'area': area.text,
        'postalCode': postalCode.text,
        'addressType': myType.toString(),
        // 'longitude' : setLocation?.longitude,
        // 'latitude' : setLocation?.latitude

      }).then((value) async {
        isLoading = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: 'add your delivery address');
        Navigator.pop(context);
        notifyListeners();
      });
      notifyListeners();
    }
  }
  List<DeliveryAddressModel> deliveryAddressList = [];
  void getDeliveryAddressData() async {
    List<DeliveryAddressModel> newList = [];

    DeliveryAddressModel deliveryAddressModel;

    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection('AddDeliveryAddress')
        .doc(FirebaseAuth.instance.currentUser!.uid).get();
    if (_db.exists) {
      deliveryAddressModel = DeliveryAddressModel(
          postalCode: _db.get('postalCode'),
          area: _db.get('area'),
          city: _db.get('city'),
          street: _db.get('street'),
          society: _db.get('Society'),
          lastName: _db.get('lastname'),
          firstName: _db.get('firstname'),
          alternateMobileNo: _db.get('alternateMobileNo'),
          addressType: _db.get('addressType'),
          mobile: _db.get('Mobile'));
      newList.add(deliveryAddressModel);
      notifyListeners();
    }
    deliveryAddressList = newList;
    notifyListeners();
  }
  List<DeliveryAddressModel> get getDeliveryAddressList {
    return deliveryAddressList;
  }
}
