import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/grapes.png'),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Food Name',style: TextStyle(color: Colors.grey.shade600),),
          Text('50 Gram',style: TextStyle(color: Colors.grey.shade600),),
          Text('\$30')
        ],
      ),
      subtitle: Text('5'),
    );
  }
}
