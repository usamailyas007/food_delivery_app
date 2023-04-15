import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/home/drawer_side.dart';
import 'package:food_app/screens/home/single_product.dart';
import 'package:food_app/screens/product_overview/product_overview.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      drawer: DrawerSide(),
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
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
            backgroundColor: Color(0xffd4d181),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 17,
              child: Icon(
                Icons.shop_outlined,
                color: Colors.black,
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
                Text(
                  'View all',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SingleProduct(
                    productImage: 'assets/images/basil.png',
                    onTap: () {

                    },
                    productName: 'Fresh Basil'),
                SingleProduct(
                    productImage: 'assets/images/mint.png',
                    onTap: () {},
                    productName: 'Fresh Mint'),
                SingleProduct(
                    productImage: 'assets/images/parsley.png',
                    onTap: () {},
                    productName: 'Fresh Parsley'),
                SingleProduct(
                    productImage: 'assets/images/dill.png',
                    onTap: () {},
                    productName: 'Fresh Dill'),
              ],
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
                Text(
                  'View all',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SingleProduct(
                    productImage: 'assets/images/berries.png',
                    onTap: () {},
                    productName: 'Barries'),
                SingleProduct(
                    productImage: 'assets/images/watermelon.png',
                    onTap: () {},
                    productName: 'Watermelon'),
                SingleProduct(
                    productImage: 'assets/images/grapes.png',
                    onTap: () {},
                    productName: 'Grapes'),
                SingleProduct(
                    productImage: 'assets/images/peach.png',
                    onTap: () {},
                    productName: 'Peach'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Root Vegetables'),
                Text(
                  'View all',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SingleProduct(
                    productImage: 'assets/images/carrots.png',
                    onTap: () {},
                    productName: 'Carrots'),
                SingleProduct(
                    productImage: 'assets/images/beets.png',
                    onTap: () {},
                    productName: 'Beets'),
                SingleProduct(
                    productImage: 'assets/images/radish.png',
                    onTap: () {},
                    productName: 'Radishes'),
                SingleProduct(
                    productImage: 'assets/images/turnips.png',
                    onTap: () {},
                    productName: 'Turnips')
              ],
            ),
          )
        ],
      ),
    );
  }
}
