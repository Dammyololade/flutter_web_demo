///
/// project: de_wallet_admin
/// @package: models
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-07-29
// To parse this JSON data, do
//
//     final serviceCategoryModel = serviceCategoryModelFromJson(jsonString);

import 'dart:convert';

ServiceCategoryModel serviceCategoryModelFromJson(String str) => ServiceCategoryModel.fromJson(json.decode(str));

String serviceCategoryModelToJson(ServiceCategoryModel data) => json.encode(data.toJson());

class ServiceCategoryModel {
  int code;
  Data data;
  String message;
  bool success;

  ServiceCategoryModel({
    this.code,
    this.data,
    this.message,
    this.success,
  });

  factory ServiceCategoryModel.fromJson(Map<String, dynamic> json) => new ServiceCategoryModel(
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
  List<ServiceCategory> serviceCategories;

  Data({
    this.serviceCategories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    serviceCategories: new List<ServiceCategory>.from(json["service_categories"].map((x) => ServiceCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "service_categories": new List<dynamic>.from(serviceCategories.map((x) => x.toJson())),
  };
}

class ServiceCategory {
  int id;
  String name;
  bool activated;
  String description;
  String iconUrl;
  DateTime createdOn;
  DateTime updatedOn;

  ServiceCategory({
    this.id,
    this.name,
    this.activated,
    this.description,
    this.iconUrl,
    this.createdOn,
    this.updatedOn,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) => new ServiceCategory(
    id: json["id"],
    name: json["name"],
    activated: json["activated"],
    description: json["description"],
    iconUrl: json["icon_url"],
    createdOn: DateTime.parse(json["createdOn"]),
    updatedOn: DateTime.parse(json["updatedOn"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "activated": activated,
    "description": description,
    "icon_url": iconUrl,
  };
}
