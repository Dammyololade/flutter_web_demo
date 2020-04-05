import 'package:dewalletvendor/models/OrderModel.dart';
import 'package:flutter/material.dart';

/// description:
/// project: de_wallet_vendor
/// @package: models
/// @author: dammyololade
/// created on: 04/04/2020
class ResultDataSource extends DataTableSource {
  List<Order> _orderList;

  ResultDataSource(this._orderList);

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _orderList.length) return null;
    Order order = _orderList[index];
    return DataRow.byIndex(
        index: index,
        selected: order.selected,
        onSelectChanged: (bool value) {
          if (order.selected != value) {
            _selectedCount += value ? 1 : -1;
            assert(_selectedCount >= 0);
            order.selected = value;
            notifyListeners();
          }
        },
        cells: <DataCell>[
          _buildDataCell(order.orderNo),
          _buildDataCell(order.servicePackage.name),
          _buildDataCell(order.biller.name),
          _buildDataCell(order.amount),
          _buildDataCell(order.admin?.fullname ?? "N/A"),
          _buildDataCell(order.createdOn.toString()),
        ]);
  }

  List<DataRow> getRows() {
    List<DataRow> rows = [];
    var newOrderList = _orderList.sublist(1, 15);
    newOrderList.forEach((order) => rows.add(DataRow(cells: [
          _buildDataCell(order.orderNo),
          _buildDataCell(order.servicePackage.name),
          _buildDataCell(order.biller.name),
          _buildDataCell(order.amount),
          _buildDataCell(order.admin?.fullname ?? "N/A"),
          _buildDataCell(order.createdOn.toString()),
        ],
      onSelectChanged: (bool value) {

      }
    )));
    return rows;
  }

  DataCell _buildDataCell(dynamic value) {
    return DataCell(Text("$value"));
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _orderList.length;

  @override
  int get selectedRowCount => _selectedCount;
}
