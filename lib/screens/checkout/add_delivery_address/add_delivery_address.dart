import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/providers/checkout_provider.dart';
import 'package:provider/provider.dart';

import '../../google_map/google_map.dart';
import '../../widget/custom_textfield.dart';

class AddDeliveryAddress extends StatefulWidget {
  const AddDeliveryAddress({Key? key}) : super(key: key);

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}
enum AddresType{
  Home,
  Work,
  Other
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddresType.Home;

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        centerTitle: true,
        title: Text('Add Delivery Address', style: TextStyle(color: textColor)),
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          checkoutProvider.Validator(context,myType);
        },
        child: checkoutProvider.isLoading == false? Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 48,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(30)),
          child: Center(child: Text('Add new Address')),
        ):Center(child: CircularProgressIndicator()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            CustomTextField('First Name', checkoutProvider.firstName),
            SizedBox(
              height: 10,
            ),
            CustomTextField('Last Name', checkoutProvider.lastName),
            SizedBox(
              height: 10,
            ),
            CustomTextField('Mobile No', checkoutProvider.phone),
            SizedBox(
              height: 10,
            ),
            CustomTextField('Alternate Mobile No', checkoutProvider.altPhone),
            SizedBox(
              height: 10,
            ),
            CustomTextField('Society', checkoutProvider.society),
            SizedBox(
              height: 10,
            ),
            CustomTextField('Street', checkoutProvider.street),
            SizedBox(
              height: 10,
            ),
            CustomTextField('City', checkoutProvider.city),
            SizedBox(
              height: 10,
            ),
            CustomTextField('Area', checkoutProvider.area),
            SizedBox(
              height: 10,
            ),
            CustomTextField('Postal Code', checkoutProvider.postalCode),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CustomGoogleMap(),));
              },
              child: Container(
                height: 47,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Set Location')],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text('Address Type*'),
            ),
            RadioListTile(
              value: AddresType.Home,
              groupValue: myType,
              onChanged: (AddresType? value) {
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
              value: AddresType.Work,
              groupValue: myType,
              onChanged: (AddresType? value) {
                setState(() {
                  myType = value!;
                });
              },
              title: Text('Work'),
              secondary: Icon(
                Icons.work,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: AddresType.Other,
              groupValue: myType,
              onChanged: (AddresType? value) {
                setState(() {
                  myType = value!;
                });
              },
              title: Text('other'),
              secondary: Icon(
                Icons.devices_other,
                color: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
