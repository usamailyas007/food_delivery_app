import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/colors.dart';
import 'order_item.dart';

class PaymentSummary extends StatefulWidget {
  const PaymentSummary({Key? key}) : super(key: key);

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}
enum AddressType{
  Home,
  OnlinePayment,
}


class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressType.Home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text('Payment Summary',style: TextStyle(fontSize: 18,color: textColor),),
      ),
      bottomNavigationBar: ListTile(
        title: Text('Total Amount'),
        subtitle: Text(
          '\$300',
          style: TextStyle(
              color: Colors.green.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        trailing: Container(
          width: 160,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(30)
          ),
          child: Center(child: Text('Place Order',style: TextStyle(color: textColor),)),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text('Usama Ilyas'),
                    subtitle: Text('Government College University Faisalabad'),
                  ),
                  Divider(),
                  ExpansionTile(
                    children: [
                      OrderItem(),
                      OrderItem(),
                      OrderItem(),
                      OrderItem()
                    ],
                      title: Text('Order item 4')),
                  Divider(),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text('Sub Total',style: TextStyle(fontWeight: FontWeight.bold),),
                    trailing: Text('\$300',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text('Shipping Charge',style: TextStyle(color: Colors.grey.shade600),),
                    trailing: Text('\$0',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text('Coupon Discount',style: TextStyle(color: Colors.grey.shade600),),
                    trailing: Text('\$10',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Divider(),
                  ListTile(
                    leading: Text('Payment Options'),
                  ),
                  RadioListTile(
                    value: AddressType.Home,
                    groupValue: myType,
                    onChanged: (AddressType? value) {
                      setState(() {
                        myType = value!;
                      });
                    },
                    title: Text('Home'),
                    secondary: Icon(
                      Icons.home,
                      color: primaryColor,
                    ),
                  ),
                  RadioListTile(
                    value: AddressType.OnlinePayment,
                    groupValue: myType,
                    onChanged: (AddressType? value) {
                      setState(() {
                        myType = value!;
                      });
                    },
                    title: Text('OnlinePayment'),
                    secondary: Icon(
                      Icons.payment,
                      color: primaryColor,
                    ),
                  )
                ],
              );
          },),
        )
      ),
    );
  }
}
