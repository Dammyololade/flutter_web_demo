import 'package:code_brew/code_brew.dart';
import 'package:dewalletvendor/AppConfig.dart';
import 'package:dewalletvendor/custom/NovuWidget.dart';
import 'package:flutter/material.dart';

/// 
/// project: de_wallet_vendor
/// @package: ui
/// @author dammyololade <damola@kobo360.com>
/// created on 30/03/2020
class SideNav extends StatelessWidget with UiKits{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConfig.APP_PRIMARY_COLOR,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Height(100),

          _listItem("Dashboard", Icons.dashboard),
          Height(20),

          _listItem("Transactions", Icons.monochrome_photos),
          Height(20),

          _listItem("Wallet", Icons.monetization_on),
          Height(20),

          _listItem("Profile", Icons.person),
          Height(20),
        ],
      ),
    );
  }

  Widget _listItem(String title, IconData icon) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 100),
          child: Row(
            children: <Widget>[
              Icon(icon, color: Colors.white,),
              Width(20),
              Text(title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: UiKits.ARoman,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}