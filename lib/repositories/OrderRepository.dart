import 'package:code_brew/code_brew.dart';
import 'package:dewalletvendor/models/OrderModel.dart';

import '../AppConfig.dart';

/// description:
/// project: de_wallet_vendor
/// @package: repositories
/// @author: dammyololade
/// created on: 04/04/2020
class OrderRepository {

  NetworkUtil networkUtil = NetworkUtil();

  Future<OrderModel> getOrders({int userId = 0, String searchTerm = ""}) async {
    OrderModel model;

    return model;
  }

}