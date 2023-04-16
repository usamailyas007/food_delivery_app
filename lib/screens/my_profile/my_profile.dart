import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/home/drawer_side.dart';

class MyProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSide(),
    );
  }

}