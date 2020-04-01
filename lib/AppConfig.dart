import 'package:flutter/material.dart';

///
/// project: de_wallet_vendor
/// @package: 
/// @author dammyololade <damola@kobo360.com>
/// created on 29/03/2020
class AppConfig {

  static const Color APP_BACKGROUND_COLOR = Color(0xffFDFBF6);
  static const Color APP_ACCENT_COLOR = Color(0xfff89286);
  static const Color APP_PRIMARY_COLOR = Color(0xff3F4547);
  static const Color APP_BOX_COLOR = Color(0xffecf0f1);
  static const Color APP_SUB_TITLE_COLOR = Color(0xff9caab9);
  static const Color APP_BUTTON_COLOR = Color(0xff62C78D);

  static const String BASE_URL =  "http://159.65.57.139/api/";
  static const String LOGIN_API = BASE_URL + "vendor/login";
  static const String INIT_RESET_PASSWORD_API = BASE_URL + "vendor/password/init";
  static const String REST_PASSWORD_API = BASE_URL + "vendor/password/reset";

}