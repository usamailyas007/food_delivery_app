class DeliveryAddressModel {
  String firstName;
  String lastName;
  String mobile;
  String alternateMobileNo;
  String society;
  String street;
  String area;
  String postalCode;
  String city;
  String addressType;
  DeliveryAddressModel(
      {required this.postalCode,
        required this.addressType,
      required this.area,
      required this.city,
      required this.street,
      required this.society,
      required this.lastName,
      required this.firstName,
      required this.alternateMobileNo,
      required this.mobile});
}
