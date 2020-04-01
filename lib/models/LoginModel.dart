///
/// project: de_wallet_vendor
/// @package: models
/// @author dammyololade <damola@kobo360.com>
/// created on 31/03/2020

import 'package:dewalletvendor/models/Vendor.dart';

class LoginModel {
  int code;
  Data data;
  String message;
  bool success;

  LoginModel({
    this.code,
    this.data,
    this.message,
    this.success,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    code: json["code"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data.toJson(),
    "message": message,
    "success": success,
  };
}

class Data {
  String token;
  Vendor vendor;

  Data({
    this.token,
    this.vendor,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    vendor: Vendor.fromJson(json["vendor"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "vendor": vendor.toJson(),
  };
}
