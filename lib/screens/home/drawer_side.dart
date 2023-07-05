import 'package:flutter/material.dart';
import 'package:food_app/model/user_model.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/screens/my_profile/my_profile.dart';
import '../review_cart/review_cart.dart';
import '../wishlist/wishlist_screen.dart';
import 'home_screen.dart';

class DrawerSide extends StatefulWidget {
  late UserProvider userProvider;

  DrawerSide({required this.userProvider});

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget listTile(IconData icon, String title, VoidCallback onTap) {
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
                      backgroundImage: NetworkImage(
                          'https://w7.pngwing.com/pngs/387/365/png-transparent-100-natural-products-illustration-frankincense-perfume-logo-food-label-s-food-leaf-label-thumbnail.png'),
                      radius: 40,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    children: [
                      Text('Usama'),
                      Text('admin@gmail.com'),
                    ],
                  ),
                )
              ],
            )),
            listTile(Icons.home_outlined, 'Home', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHome(),
                  ));
            }),
            listTile(Icons.shop_outlined, 'Review Cart', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ));
            }),
            listTile(Icons.person_outlined, 'My Profile', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyProfile(userProvider: widget.userProvider),
                  ));
            }),
            listTile(Icons.notifications_outlined, 'Notifications', () {}),
            listTile(Icons.star_outline, 'Rating & Reviews', () {}),
            listTile(Icons.favorite_outline, 'Wishlist', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WishListScreen(),
                  ));
            }),
            listTile(Icons.copy_outlined, 'Raise & Complain', () {}),
            listTile(Icons.format_quote_outlined, 'FAQs', () {}),
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
