///
/// project: de_wallet_admin
/// @package: models
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-07-30
// To parse this JSON data, do
//
//     final billerModel = billerModelFromJson(jsonString);

class BillerModel {
  int code;
  Data data;
  String message;
  bool success;

  BillerModel({
    this.code,
    this.data,
    this.message,
    this.success,
  });

  factory BillerModel.fromJson(Map<String, dynamic> json) => new BillerModel(
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
  List<Biller> billers;

  Data({
    this.billers,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    billers: new List<Biller>.from(json["billers"].map((x) => Biller.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "billers": new List<dynamic>.from(billers.map((x) => x.toJson())),
  };
}

class Biller {
  int id;
  int serviceCategoryId;
  String name;
  bool activated;
  String iconUrl;
  String description;
  DateTime createdOn;
  DateTime updatedOn;

  Biller({
    this.id,
    this.serviceCategoryId,
    this.name,
    this.activated,
    this.iconUrl,
    this.description,
    this.createdOn,
    this.updatedOn,
  });

  factory Biller.fromJson(Map<String, dynamic> json) => new Biller(
    id: json["id"],
    serviceCategoryId: json["service_category_id"],
    name: json["name"],
    activated: json["activated"],
    iconUrl: json["icon_url"],
    description: json["description"],
    createdOn: DateTime.parse(json["createdOn"]),
    updatedOn: DateTime.parse(json["updatedOn"]),
  );

  Map<String, dynamic> toJson() => {
    "service_category_id": serviceCategoryId,
    "name": name,
    "activated": activated,
    "icon_url": iconUrl,
    "description": description,
  };
}
