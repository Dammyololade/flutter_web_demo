import 'package:dewalletvendor/onboarding/InitResetPassword.dart';
import 'package:dewalletvendor/onboarding/LoginScreen.dart';
import 'package:dewalletvendor/onboarding/ResetPassword.dart';
import 'package:flutter/material.dart';

import '../HomeScreen.dart';

/// description:
/// project: de_wallet_vendor
/// @package: helpers
/// @author: dammyololade
/// created on: 01/04/2020
class RouteConfig {

  static const String HOME = "/home";
  static const String LOGIN = "/login";
  static const String INIT_RESET_PASSWORD = "/password/init";
  static const String RESET_PASSWORD = "/password/reset";



  Map<String, Widget Function(BuildContext)> routes() {
    return {
      LOGIN: ((context) => LoginScreen()),
      HOME: ((context) => HomeScreen()),
      INIT_RESET_PASSWORD: ((context) => InitResetPassword()),
      RESET_PASSWORD: ((context) => ResetPassword())
    };
  }
}