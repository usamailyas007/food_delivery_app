import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/checkout_provider.dart';
import 'package:food_app/screens/checkout/delivery-page/single_delivery_item.dart';
import 'package:provider/provider.dart';

import '../add_delivery_address/add_delivery_address.dart';
import '../payment_summary/payment_summarry.dart';

class DeliveryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddDeliveryAddress(),));
        },
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text('DeliveryDetails', style: TextStyle(color: textColor)),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddDeliveryAddress(),
                  ))
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentSummary(),
                  ));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 48,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: deliveryAddressProvider.getDeliveryAddressList.isEmpty
                  ? Text('Add new Address')
                  : Text('Payment Summary')),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.location_pin,
              color: textColor,
            ),
            title: Text(
              'Deliver To',
              style: TextStyle(color: textColor),
            ),
          ),
          Divider(
            height: 1,
          ),
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Container(child: Center(child: Text('No Data')),
          ) : Column(
            children: deliveryAddressProvider.getDeliveryAddressList.map((e) {
              return SingleDileveryItem(
                title: '${e.area}, ${e.street}, ${e.society}, ${e.postalCode}',
                address: '${e.firstName} ${e.lastName}',
                addressType: e.addressType == 'AddresType.Other' ? 'Other' : e.addressType == 'AddresType.Home' ? 'Home' : 'Work',
                number: '${e.mobile}',
              );
            }).toList(),

          )
        ],
      ),
    );
  }
}
