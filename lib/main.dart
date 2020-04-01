import 'package:code_brew/code_brew.dart';
import 'package:dewalletvendor/AppConfig.dart';
import 'package:dewalletvendor/HomeScreen.dart';
import 'package:dewalletvendor/helpers/RouteConfig.dart';
import 'package:dewalletvendor/onboarding/LoginScreen.dart';
import 'package:flutter/material.dart';

import 'helpers/SessionManager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SessionManager.init();
  await CBSessionManager.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Avenir',
        primaryColor: AppConfig.APP_PRIMARY_COLOR
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteConfig.LOGIN,
      home: LoginScreen(),
      routes: RouteConfig().routes(),
    );
  }
}
