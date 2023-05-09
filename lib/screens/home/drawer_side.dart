import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:food_app/screens/my_profile/my_profile.dart';
import 'package:food_app/screens/product_overview/product_overview.dart';

class DrawerSide extends StatelessWidget{

  Widget listTile(IconData icon, String title,VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black45),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffd1ad17),
        child: ListView(
          children: [
            DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 43,
                      child: ClipOval(
                        child: CircleAvatar(
                          backgroundColor: Colors.amber,
                          backgroundImage: AssetImage('assets/images/lgo1.png'),
                          radius: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Welcome Guest'),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                            height: 30,
                            width: 80,
                            child: OutlinedButton(
                              onPressed: () {

                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          side: BorderSide(width: 2)))),
                            ))
                      ],
                    )
                  ],
                )),
            listTile(Icons.home_outlined, 'Home',(){}),
            listTile(Icons.shop_outlined, 'Review Cart',(){}),
            listTile(Icons.person_outlined, 'My Profile',(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile(),));
            }),
            listTile(Icons.notifications_outlined, 'Notifications',(){}),
            listTile(Icons.star_outline, 'Rating & Reviews',(){}),
            listTile(Icons.favorite_outline, 'Wishlist',(){}),
            listTile(Icons.copy_outlined, 'Raise & Complain',(){}),
            listTile(Icons.format_quote_outlined, 'FAQs',(){}),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Support',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Call us:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '+923197026592',
                        style: TextStyle(color: Colors.black45),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Mail us:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('usil4d@gmail.com',
                          style: TextStyle(color: Colors.black45))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}