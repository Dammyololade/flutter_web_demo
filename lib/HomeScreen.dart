import 'package:dewalletvendor/helpers/SessionManager.dart';
import 'package:dewalletvendor/ui/OrderListWidget.dart';
import 'package:dewalletvendor/ui/SideNav.dart';
import 'package:flutter/material.dart';

///
/// project: de_wallet_vendor
/// @package:
/// @author dammyololade <damola@kobo360.com>
/// created on 29/03/2020
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(SessionManager.businessName),
          elevation: 0,
        ),
        body: Row(
          children: <Widget>[
            SideNav(),
            Expanded(
              child: OrderListWidget(),
            )
          ],
        ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
