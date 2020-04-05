import 'package:code_brew/code_brew.dart';
import 'package:dewalletvendor/AppConfig.dart';
import 'package:dewalletvendor/models/OrderModel.dart';
import 'package:flutter/material.dart';

///
/// project: de_wallet_vendor
/// @package: ui
/// @author dammyololade
/// created on 04/04/2020
class OrderListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OrderListWidgetState();
  }
}

class _OrderListWidgetState extends State<OrderListWidget> {
  OrderModel orderModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CBDataTable(
      headers: [
        _buildColumn("Order No"),
        _buildColumn("Service Package"),
        _buildColumn("Biller"),
        _buildColumn("Amount"),
        _buildColumn("Admin"),
        _buildColumn("Date"),
      ],
      model: OrderModel(),
      urlModel: getUrl(),
      rowItemBuilder: (BuildContext context, data) => buildDataRow(data),
    );
  }

  List<DataRow> buildDataRow(dynamic data) {
    List<DataRow> rows = [];
    orderModel = data;
    orderModel.data.forEach((order) => rows.add(DataRow(cells: [
          _buildDataCell(order.orderNo),
          _buildDataCell(order.servicePackage?.name ?? "N/A"),
          _buildDataCell(order.biller?.name ?? "N/A"),
          _buildDataCell(order.amount),
          _buildDataCell(order.admin?.fullname ?? "N/A"),
          _buildDataCell(CBUtility.formatDate(order.createdOn)),
        ], onSelectChanged: (bool value) {})));
    print("lenth of the data: ${orderModel.data.length}");
    return rows;
  }

  DataCell _buildDataCell(dynamic value) {
    return DataCell(Text("$value"));
  }

  DataColumn _buildColumn(dynamic value) {
    return DataColumn(
        label: Text(
          "$value",
        ),
        tooltip: "$value");
  }

  UrlModel getUrl() {
    String url = AppConfig.ALL_ORDER_API;
    return UrlModel(
        baseUrl: url,
        searchKey: "search_term",
        searchUrl: url,
        page: 1,
        limit: 15);
  }
}
