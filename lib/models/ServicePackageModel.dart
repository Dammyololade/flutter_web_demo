///
/// project: de_wallet_admin
/// @package: models
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-07-31
// To parse this JSON data, do
//
//     final servicePackageModel = servicePackageModelFromJson(jsonString);

import 'dart:convert';

ServicePackageModel servicePackageModelFromJson(String str) => ServicePackageModel.fromJson(json.decode(str));

String servicePackageModelToJson(ServicePackageModel data) => json.encode(data.toJson());

class ServicePackageModel {
  int code;
  Data data;
  String message;
  bool success;

  ServicePackageModel({
    this.code,
    this.data,
    this.message,
    this.success,
  });

  factory ServicePackageModel.fromJson(Map<String, dynamic> json) => new ServicePackageModel(
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
  List<ServicePackage> servicePackages;

  Data({
    this.servicePackages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    servicePackages: new List<ServicePackage>.from(json["service_packages"].map((x) => ServicePackage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "service_packages": new List<dynamic>.from(servicePackages.map((x) => x.toJson())),
  };
}

class ServicePackage {
  int id;
  int billerId;
  String name;
  double amount;
  bool activated;
  String description;
  DateTime createdOn;
  String iconUrl;
  DateTime updatedOn;

  ServicePackage({
    this.id,
    this.billerId,
    this.name,
    this.amount,
    this.activated,
    this.description,
    this.createdOn,
    this.iconUrl,
    this.updatedOn,
  });

  factory ServicePackage.fromJson(Map<String, dynamic> json) => new ServicePackage(
    id: json["id"],
    billerId: json["biller_id"],
    name: json["name"],
    amount: json["amount"] != null ? json["amount"].toDouble() : 0,
    activated: json["activated"],
    description: json["description"],
    createdOn: DateTime.parse(json["createdOn"]),
    iconUrl: json["icon_url"],
    updatedOn: DateTime.parse(json["updatedOn"]),
  );

  Map<String, dynamic> toJson() => {
    "biller_id": billerId,
    "name": name,
    "amount": amount,
    "activated": activated,
    "description": description,
    "icon_url": iconUrl,
  };
}
