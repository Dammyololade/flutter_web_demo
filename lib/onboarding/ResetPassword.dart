import 'package:code_brew/code_brew.dart';
import 'package:dewalletvendor/custom/BaseStatefulWidget.dart';
import 'package:dewalletvendor/custom/NovuWidget.dart';
import 'package:dewalletvendor/custom/PasswordField.dart';
import 'package:dewalletvendor/repositories/OnBoardingRepository.dart';
import 'package:flutter/material.dart';
import 'package:the_validator/the_validator.dart';

import '../AppConfig.dart';

/// 
/// project: de_wallet_vendor
/// @package: onboarding
/// @author dammyololade
/// created on 01/04/2020
class ResetPassword extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ResetPasswordState();
  }
}

class _ResetPasswordState extends State<ResetPassword> with UiKits, BaseStatefulWidget{

  String email;

  var _newPasswordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();
  var _otpController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  ValueNotifier<bool> resendCodeNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    email = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            child: Image.asset(
              "images/main_background.png",
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: Card(
              color: Colors.white,
              child: Container(
                width: 400,
                padding: EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Reset Password"),
                      Height(30),
                      NovuWidgets.formTextField(
                        "Verification Code",
                        "",
                        _otpController,
                        TextInputType.text,
                        "please enter your email",
                        textValidator: FieldValidator.required(),
                      ),
                      Height(30),
                      PasswordField(controller: _newPasswordController,
                        label: "Password",
                        textValidator: FieldValidator.password(minLength: 6),
                      ),
                      Height(30),
                      PasswordField(controller: _confirmPasswordController,
                        label: "Confirm password",
                        textValidator: FieldValidator.equalTo(_newPasswordController),
                      ),

                      NovuWidgets.progressAwareButton(
                        notifier: resendCodeNotifier,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                              onTap: (){
                                _resendCode();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  "Resend code",
                                  style: TextStyle(
                                      fontFamily: UiKits.AMedium,
                                      color: Colors.blueAccent),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Height(50),
                      NovuWidgets.progressAwareButton(
                          notifier: progressNotifier,
                          child: NovuWidgets.positiveButton("Submit", () {
                            if (_formKey.currentState.validate()) {
                              _submit();
                            }
                          }, bgColor: AppConfig.APP_BUTTON_COLOR)
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submit() async {
    progressNotifier.value = true;
    var params = {
      "email": email,
      "password": _newPasswordController.text,
      "confirm_password": _confirmPasswordController.text,
      "otp": _otpController.text
    };
    var response = await OnBoardingRepository().resetPassword(params);
    progressNotifier.value = false;
    if(response.success) {
      Navigator.of(context).pushReplacementNamed(
          "/home");
    } else {
      showBottomNotification(context, message: response.message);
    }
  }

  void _resendCode() async {
    resendCodeNotifier.value = true;
    var response = await OnBoardingRepository().initResetPassword(email);
    resendCodeNotifier.value = false;
    if(response.success) {

    } else {
      showBottomNotification(context, message: response.message);
    }
  }
}