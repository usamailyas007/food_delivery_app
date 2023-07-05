import 'package:flutter/material.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/home/single_product.dart';
import 'package:provider/provider.dart';
import '../../providers/product_provider.dart';
import '../product_overview/product_overview.dart';
import '../review_cart/review_cart.dart';
import '../search/search.dart';
import 'drawer_side.dart';

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
   late ProductProvider productProvider;

  @override
  void initState() {
    ProductProvider initproductProvider = Provider.of(context,listen: false);
    initproductProvider.fetchHerbsProductData();
    initproductProvider.fetchFruitsProductData();
    initproductProvider.fetchVegetablesProductData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     productProvider = Provider.of(context);
     UserProvider userProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      drawer: DrawerSide(userProvider: userProvider),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffd6b738),
        title: Text(
          'Home',
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          CircleAvatar(
            radius: 17,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Search(
                  search: productProvider.getAllProductSearch,
                ),));
              },
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            backgroundColor: Color(0xffd4d181),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 17,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewCart(),));
                },
                child: Icon(
                  Icons.shop_outlined,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Color(0xffd4d181),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/food.jpg'),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(right: 265, bottom: 10),
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xffd6b740),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(3),
                                        bottomRight: Radius.circular(50),
                                        bottomLeft: Radius.circular(50))),
                                child: Center(
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        'Vegi',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            shadows: [
                                              BoxShadow(
                                                  color: Colors.green,
                                                  blurRadius: 2,
                                                  offset: Offset(2, 2))
                                            ]),
                                      ),
                                    )),
                              ),
                            ),
                            Text(
                              '30% off',
                              style: TextStyle(
                                  shadows: [
                                    BoxShadow(
                                        color: Colors.green,
                                        blurRadius: 4,
                                        offset: Offset(3, 3))
                                  ],
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                'On all vegetables products',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Herbs Seasoning'),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Search(
                      search: productProvider.getHerbsProductDataList,
                    ),));
                  },
                  child: Text(
                    'View all',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: productProvider.getHerbsProductDataList.map((herbsProductData) {
                return SingleProduct(
                    productImage: herbsProductData.productImage,
                    productPrice: herbsProductData.productPrice,
                    productId: herbsProductData.productId,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductOverview(
                        productId: herbsProductData.productId,
                      productImage: herbsProductData.productImage,
                      productPrice: herbsProductData.productPrice,
                      productName: herbsProductData.productName),
                      )
                      );
                    },
                    productName: herbsProductData.productName);
              }).toList()
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fresh Fruits',
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Search(
                      search: productProvider.getFruitsProductDataList,
                    ),));
                  },
                  child: Text(
                    'View all',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: productProvider.getFruitsProductDataList.map((fruitsProductData) {
                return  SingleProduct(
                  productId: fruitsProductData.productId,
                    productImage: fruitsProductData.productImage,
                    productPrice: fruitsProductData.productPrice,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductOverview(
                          productImage: fruitsProductData.productImage,
                          productId: fruitsProductData.productId,
                          productPrice: fruitsProductData.productPrice,
                          productName: fruitsProductData.productName),
                      )
                      );
                    },
                    productName: fruitsProductData.productName);

              }).toList()
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Root Vegetables'),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Search(
                      search: productProvider.getVegetablesProductDataList,
                    ),));
                  },
                  child: Text(
                    'View all',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: productProvider.getVegetablesProductDataList.map((vegetablesProductData){
                return SingleProduct(
                  productId: vegetablesProductData.productId,
                    productImage: vegetablesProductData.productImage,
                    productPrice: vegetablesProductData.productPrice,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductOverview(
                        productId: vegetablesProductData.productId,
                          productImage: vegetablesProductData.productImage,
                          productPrice: vegetablesProductData.productPrice,
                          productName: vegetablesProductData.productName),
                      )
                      );
                    },
                    productName: vegetablesProductData.productName);

              } ).toList()
            ),
          )
        ],
      ),
    );
  }
}