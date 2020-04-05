import 'package:dewalletvendor/models/BlocModel.dart';
import 'package:dewalletvendor/models/OrderModel.dart';
import 'package:dewalletvendor/repositories/OrderRepository.dart';
import 'package:rxdart/rxdart.dart';

/// description:
/// project: de_wallet_vendor
/// @package: bloc
/// @author: dammyololade
/// created on: 04/04/2020
class OrderBloc {

  PublishSubject<BlocModel<OrderModel>> orderController = PublishSubject();

  Sink<BlocModel<OrderModel>> get inBlocModel => orderController.sink;

  Stream<BlocModel<OrderModel>> get outBlocModel => orderController.stream;
  OrderModel orderModel;

  void fetch(BlockAction action) {
    OrderRepository()
        .getOrders()
        .then((orderModel) {
      this.orderModel = orderModel;
      inBlocModel.add(
          BlocModel(baseModel: orderModel, action: action, processing: false));
    });
  }

  dispose() {
    orderController.close();
  }
}