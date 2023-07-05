import 'package:flutter/material.dart';
import 'package:food_app/screens/widget/single_item.dart';

import '../../config/colors.dart';
import '../../model/product_model.dart';

class Search extends StatefulWidget {
  final List<ProductModel> search;
  const Search({Key? key,required this.search}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";

  searchItem(String query){
    List<ProductModel> searchFood  = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }
  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text('Search',style: TextStyle(color: textColor),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Icon(Icons.menu_rounded),
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Items'),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value){
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide.none),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: 'Search for Items in the Store',
                suffixIcon: Icon(Icons.search)
              ),
            ),
          ),
          SizedBox(height: 5,),
          Column(
            children: _searchItem.map((data) {
              return  SingleItem(
                onDelete: (){},
                wishList: true,
                isBool: false,
                productQuantity: 1,
                productId: data.productId,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
              );
            }).toList(),
          )


        ],
      ),
    );
  }
}
