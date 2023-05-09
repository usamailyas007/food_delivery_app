import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/screens/home/drawer_side.dart';

class MyProfile extends StatelessWidget{
  Widget listTile(String title,IconData icon){
    return Column(
      children: [
        Divider(
          height: 6,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: const Color(0xffd1ad17),
        title: Text('My Profile',style: TextStyle(fontSize: 18,color: textColor),)
      ),
      drawer: DrawerSide(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: primaryColor,
              ),
              Container(
                height: 665,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                child: ListView(
                  children: [
                    Container(
                      height: 120,
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 120,bottom: 20),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Usama Ilyas',style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: textColor
                                ),
                                ),
                                SizedBox(height: 10,),
                                Text('Usil4d@gmail.com')
                              ],
                            ),
                            SizedBox(width: 40,),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: primaryColor,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: scaffoldBackgroundColor,
                                child: Icon(Icons.edit,color: primaryColor,),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    listTile('My Orders', Icons.shop_outlined),
                    listTile('My Delivery Address', Icons.location_on_outlined),
                    listTile('Refer a Friend', Icons.person_outlined),
                    listTile('Terms & Conditions', Icons.file_copy_outlined),
                    listTile('Privacy Policy', Icons.policy_outlined),
                    listTile('About', Icons.add_chart),
                    listTile('Logout', Icons.exit_to_app_outlined)
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40,left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/lgo1.png'),
                radius: 45,
                backgroundColor: Colors.amber,
              ),
            ),
          )
        ],
      ),
    );
  }
}