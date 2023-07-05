import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/checkout_provider.dart';
import 'package:food_app/providers/product_provider.dart';
import 'package:food_app/providers/review_cart_provider.dart';
import 'package:food_app/providers/user_provider.dart';
import 'package:food_app/providers/wish_list_provider.dart';
import 'package:provider/provider.dart';
import 'auth/sign_in.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<ReviewCartProvider>(
            create: (context) => ReviewCartProvider()),
        ChangeNotifierProvider<WishListProvider>(
            create: (context) => WishListProvider()),
        ChangeNotifierProvider<CheckoutProvider>(
            create: (context) => CheckoutProvider()),
      ],
      child: MaterialApp(
          theme: ThemeData(
              primaryColor: Color(0xffd1ad17),
              scaffoldBackgroundColor: scaffoldBackgroundColor),
          debugShowCheckedModeBanner: false,
          home: SignIn()),
    );
  }
}
