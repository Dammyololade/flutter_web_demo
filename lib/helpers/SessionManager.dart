import 'package:shared_preferences/shared_preferences.dart';

/// description:
/// project: de_wallet_vendor
/// @package: helpers
/// @author: dammyololade
/// created on: 31/03/2020
class SessionManager {

  static SharedPreferences sharedPreferences;

  static Future<Null> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String KEY_FIRSTNAME = 'first_name';
  static const String KEY_LASTNAME = 'last_name';
  static const String KEY_USER_ID = 'user_id';
  static const String KEY_EMAIL = 'email';
  static const String KEY_BIZ_NAME = 'biz_name';
  static const String KEY_MOBILE = 'mobile';
  static const String KEY_ADDRESS = 'address';


  static set userId(String userId) => sharedPreferences.setString(KEY_USER_ID, userId);
  static String get userId => sharedPreferences.getString(KEY_USER_ID) ?? '';

  static set email(String email) => sharedPreferences.setString(KEY_EMAIL, email);
  static String get email => sharedPreferences.getString(KEY_EMAIL) ?? '';

  static String get firstName => sharedPreferences.getString(KEY_FIRSTNAME) ?? '';
  static set firstName(String firstName) => sharedPreferences.setString(KEY_FIRSTNAME, firstName);

  static String get lastName => sharedPreferences.getString(KEY_LASTNAME) ?? '';
  static set lastName(String lastName) => sharedPreferences.setString(KEY_LASTNAME, lastName);

  static String get businessName => sharedPreferences.getString(KEY_BIZ_NAME) ?? '';
  static set businessName(String name) => sharedPreferences.setString(KEY_BIZ_NAME, name);

  static String get address => sharedPreferences.getString(KEY_ADDRESS) ?? '';
  static set address(String address) => sharedPreferences.setString(KEY_ADDRESS, address);
}