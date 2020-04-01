import 'package:code_brew/code_brew.dart';
import 'package:dewalletvendor/custom/BaseStatefulWidget.dart';
import 'package:dewalletvendor/custom/NovuWidget.dart';
import 'package:dewalletvendor/helpers/RouteConfig.dart';
import 'package:dewalletvendor/repositories/OnBoardingRepository.dart';
import 'package:flutter/material.dart';
import 'package:the_validator/the_validator.dart';

import '../AppConfig.dart';

/// 
/// project: de_wallet_vendor
/// @package: onboarding
/// @author dammyololade
/// created on 01/04/2020
class InitResetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InitResetPasswordState();
  }

}

class _InitResetPasswordState extends State<InitResetPassword>
    with UiKits, BaseStatefulWidget {

  var _emailController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                        "Email Address",
                        "",
                        _emailController,
                        TextInputType.text,
                        "please enter your email",
                        textValidator: FieldValidator.email(),
                      ),
                      Height(30),

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
    var response = await OnBoardingRepository().initResetPassword(
        _emailController.text);
    progressNotifier.value = false;
    if(response.success) {
      Navigator.of(context).pushReplacementNamed(RouteConfig.RESET_PASSWORD,
        arguments: _emailController.text
      );
    } else {
      showBottomNotification(context, message: response.message);
    }
  }

}