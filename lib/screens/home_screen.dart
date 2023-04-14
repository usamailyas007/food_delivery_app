import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget singleProduct(){
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 230,
      width: 160,
      decoration: BoxDecoration(
          color: Color(0xffd9dad9),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Container(
                child: Image.asset('assets/images/basil.png'),
              )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 5, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fresh Basil',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '50\$/50 Gram',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Row(
                        children: [
                          Expanded(child: Container(
                            padding: EdgeInsets.only(left: 3),
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey)
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '50 Grams',
                                  style: TextStyle(
                                      fontSize: 9),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 25,
                                  color: Color(0xffd6b740),
                                )
                              ],
                            ),
                          )),
                          SizedBox(width: 5,),
                          Expanded(child: Container(
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.remove,size: 15,color: Color(0xffd6b740)),
                                Text('1',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffd6b740)),),
                                Icon(Icons.add,size: 15,color: Color(0xffd6b740))
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      drawer: Drawer(),
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
                singleProduct(),
                singleProduct(),
                singleProduct(),
                singleProduct(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fresh Fruits',),
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
                singleProduct(),
                singleProduct(),
                singleProduct(),
                singleProduct(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
