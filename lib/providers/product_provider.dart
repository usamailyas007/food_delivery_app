import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/product_model.dart';


class ProductProvider with ChangeNotifier {
  late ProductModel productModel;

  List<ProductModel>search = [];
  allProductModels(QueryDocumentSnapshot element){
    productModel = ProductModel(
        productQuantity: element.get('productQuantity'),
        productId: element.get('productId'),
        productImage: element.get('productImage'),
        productName: element.get('productName'),
        productPrice: element.get('productPrice'));
    print('working successfully: ${productModel.productId}');
    search.add(productModel);
  }


  ////////////////////////Herbs Product/////////////////////////////////////
  List<ProductModel> herbsProductList = [];

  fetchHerbsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot ref =
    await FirebaseFirestore.instance.collection('HerbsProduct').get();

    ref.docs.forEach((element) {
      allProductModels(element);
      newList.add(productModel);
    });
    herbsProductList = newList;
    notifyListeners();
  }
  List<ProductModel> get getHerbsProductDataList{
    return herbsProductList;
  }


  ////////////////////////Fresh Fruits/////////////////////////////////////
  List<ProductModel> fruitsProductList = [];

  fetchFruitsProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot ref =
    await FirebaseFirestore.instance.collection('FreshFruits').get();

    ref.docs.forEach((element) {
      allProductModels(element);
      newList.add(productModel);
    });
    fruitsProductList = newList;
    notifyListeners();
  }
  List<ProductModel> get getFruitsProductDataList{
    return fruitsProductList;
  }


  ////////////////////////Roots Vegetables/////////////////////////////////////
  List<ProductModel> vegetablesProductList = [];

  fetchVegetablesProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot ref =
    await FirebaseFirestore.instance.collection('Root Vegetables').get();

    ref.docs.forEach((element) {
      allProductModels(element);
      newList.add(productModel);
    });
    vegetablesProductList = newList;
    notifyListeners();
  }
  List<ProductModel> get getVegetablesProductDataList{
    return vegetablesProductList;
  }

  /////////////////////////////////////Search Return///////////////////////////////////

  List<ProductModel> get getAllProductSearch{
    return search;
  }
}
