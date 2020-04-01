import 'package:dewalletvendor/helpers/SessionManager.dart';
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
