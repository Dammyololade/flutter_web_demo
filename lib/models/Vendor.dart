///
/// project: de_wallet_vendor
/// @package: models
/// @author dammyololade <damola@kobo360.com>
/// created on 31/03/2020
///
class Vendor {
  int id;
  String businessName;
  String mobile;
  String address;
  int serviceCharge;
  String password;
  String email;
  DateTime createdOn;
  DateTime updatedOn;

  Vendor({
    this.id,
    this.businessName,
    this.mobile,
    this.address,
    this.serviceCharge,
    this.password,
    this.email,
    this.createdOn,
    this.updatedOn,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"],
    businessName: json["business_name"],
    mobile: json["mobile"],
    address: json["address"],
    serviceCharge: json["service_charge"],
    password: json["password"],
    email: json["email"],
    createdOn: DateTime.parse(json["created_on"]),
    updatedOn: DateTime.parse(json["updated_on"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_name": businessName,
    "mobile": mobile,
    "address": address,
    "service_charge": serviceCharge,
    "password": password,
    "email": email,
    "created_on": createdOn.toIso8601String(),
    "updated_on": updatedOn.toIso8601String(),
  };
}