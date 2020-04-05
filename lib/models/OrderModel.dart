
import 'package:code_brew/code_brew.dart';
import 'package:flutter/material.dart';

import 'BaseModel.dart';

class OrderModel extends PaginatedDataModel<Order>{
  int code;


  @override
  fromJson(Map<String, dynamic> json) {
    this.data = List<Order>.from(json["data"]["orders"].map((x) => Order.fromJson(x)));
    super.fromJson(json);
    return this;
  }

}

class Order extends BaseModel{
  int id;
  int serviceCategoryId;
  int billerId;
  int servicePackageId;
  int userId;
  String orderNo;
  String status;
  String billNumber;
  int processedBy;
  num amount;
  DateTime updatedOn;
  DateTime createdOn;
  Biller serviceCategory;
  Biller servicePackage;
  Biller biller;
  User user;
  Admin admin;
  bool selected = false;

  Order({
    this.id,
    this.serviceCategoryId,
    this.billerId,
    this.servicePackageId,
    this.userId,
    this.orderNo,
    this.status,
    this.billNumber,
    this.processedBy,
    this.amount,
    this.updatedOn,
    this.createdOn,
    this.serviceCategory,
    this.servicePackage,
    this.biller,
    this.user,
    this.admin,
    this.selected = false,
  });

  factory Order.fromJson(Map<String, dynamic> json) => new Order(
    id: json["id"],
    serviceCategoryId: json["service_category_id"],
    billerId: json["biller_id"],
    servicePackageId: json["service_package_id"],
    userId: json["user_id"],
    orderNo: json["order_no"],
    status: json["status"],
    billNumber: json["bill_number"],
    processedBy: json["processed_by"],
    amount: json["amount"],
    updatedOn: DateTime.parse(json["updated_on"]),
    createdOn: DateTime.parse(json["created_on"]),
    serviceCategory: json["service_category"] == null ? null : Biller.fromJson(json["service_category"]),
    servicePackage: json["service_package"] == null ? null : Biller.fromJson(json["service_package"]),
    biller: json["biller"] == null ? null : Biller.fromJson(json["biller"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    admin: json["admin"] != null ? Admin.fromJson(json["admin"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "service_category_id": serviceCategoryId,
    "biller_id": billerId,
    "service_package_id": servicePackageId,
    "user_id": userId,
    "order_no": orderNo,
    "status": status,
    "bill_number": billNumber,
    "processed_by": processedBy,
    "amount": amount,
    "updated_on": updatedOn.toIso8601String(),
    "created_on": createdOn.toIso8601String(),
    "service_category": serviceCategory.toJson(),
    "service_package": servicePackage.toJson(),
    "biller": biller.toJson(),
    "user": user.toJson(),
    "admin": admin.toJson(),
  };

  static const String STATUS_PENDING = "pending";
  static const String STATUS_PROCESSING = "processing";
  static const String STATUS_COMPLETED = "completed";
  static const String STATUS_DECLINED = "declined";

  Color getColor() {
    
  }
}

class Admin {
  String fullname;
  String email;

  Admin({
    this.fullname,
    this.email,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => new Admin(
    fullname: json["fullname"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "fullname": fullname,
    "email": email,
  };
}

class Biller {
  String name;

  Biller({
    this.name,
  });

  factory Biller.fromJson(Map<String, dynamic> json) => new Biller(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class User {
  String firstName;
  String lastName;
  String email;
  String mobile;
  Wallet wallet;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.wallet,
  });

  factory User.fromJson(Map<String, dynamic> json) => new User(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    mobile: json["mobile"],
    wallet: Wallet.fromJson(json["wallet"]),
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "mobile": mobile,
    "wallet": wallet.toJson(),
  };
}

class Wallet {
  int balance;
  int ledgerBalance;

  Wallet({
    this.balance,
    this.ledgerBalance,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => new Wallet(
    balance: json["balance"],
    ledgerBalance: json["ledger_balance"],
  );

  Map<String, dynamic> toJson() => {
    "balance": balance,
    "ledger_balance": ledgerBalance,
  };
}

