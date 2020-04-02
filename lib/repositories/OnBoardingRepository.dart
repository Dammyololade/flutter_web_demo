import 'package:code_brew/code_brew.dart';
import 'package:dewalletvendor/AppConfig.dart';
import 'package:dewalletvendor/helpers/ErrorReporter.dart';
import 'package:dewalletvendor/helpers/SessionManager.dart';
import 'package:dewalletvendor/models/BaseModel.dart';
import 'package:dewalletvendor/models/LoginModel.dart';
import 'package:dewalletvendor/models/Vendor.dart';

/// description:
/// project: de_wallet_vendor
/// @package: repositories
/// @author: dammyololade
/// created on: 31/03/2020
class OnBoardingRepository {
  NetworkUtil networkUtil = NetworkUtil();

  Future<LoginModel> login(String email, String password) async{
    LoginModel model = LoginModel(success: false);
    try {
      print(AppConfig.LOGIN_API);
      var response = await networkUtil.connectApi(AppConfig.LOGIN_API,
        RequestMethod.post, data: {"email": email, "password": password});
      print(response);
      if(response?.statusCode == 200) {
        model = LoginModel.fromJson(response.data);
        CBSessionManager.authToken = model.data.token;
        Vendor vendor = model.data.vendor;
        SessionManager.email = vendor.email;
        SessionManager.address = vendor.address;
        SessionManager.businessName = vendor.businessName;
      } else {
        model.message = CBUtility.extractErrorMessageFromResponse(response);
      }
    } catch (error, stackTrace) {
      ErrorReporter.reportError(error, stackTrace);
    }
    return model;
  }

  Future<BaseModel> initResetPassword(String email) async {
    BaseModel model = BaseModel(success: false);
    try {
      var response = await networkUtil.connectApi(AppConfig.INIT_RESET_PASSWORD_API,
          RequestMethod.post, data: {"email": email});
      print(response);
      if(response?.statusCode == 200){
        model.success = true;
      } else {
        model.message = CBUtility.extractErrorMessageFromResponse(response);
      }
    } catch (error, stackTrace) {
      ErrorReporter.reportError(error, stackTrace);
    }
    return model;
  }

  Future<BaseModel> resetPassword(Map<String, dynamic> params) async {
    BaseModel model = BaseModel(success: false);
    try {
      var response = await networkUtil.connectApi(AppConfig.REST_PASSWORD_API,
          RequestMethod.post, data: params);
      print(response);
      if(response?.statusCode == 200){
        model.success = true;
      } else {
        model.success = false;
        model.message = CBUtility.extractErrorMessageFromResponse(response);
      }
    } catch (error, stackTrace) {
      ErrorReporter.reportError(error, stackTrace);
    }
    return model;
  }
}