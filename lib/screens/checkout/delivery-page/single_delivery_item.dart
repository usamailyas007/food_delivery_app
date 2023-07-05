import 'package:flutter/material.dart';

import '../../../config/colors.dart';

class SingleDileveryItem extends StatelessWidget {
 final String? title;
 final String? address;
 final String? number;
 final String? addressType;
 SingleDileveryItem({this.title,this.number,this.address,this.addressType});

 @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title!),
              Container(
                width: 60,
                height: 20,
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: primaryColor
                ),
                child: Center(child: Text(addressType!,style: TextStyle(fontSize: 13,color: Colors.white),)),
              )
            ],
          ),
          leading: CircleAvatar(
            radius: 8,
            backgroundColor: primaryColor,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address!),
              SizedBox(height: 5,),
              Text(number!)
            ],
          ),
        ),
        Divider(height: 35,)
      ],
    );
  }
}
