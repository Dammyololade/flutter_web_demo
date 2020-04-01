import 'package:code_brew/code_brew.dart';
import 'package:dewalletvendor/AppConfig.dart';
import 'package:dewalletvendor/HomeScreen.dart';
import 'package:dewalletvendor/custom/BaseStatefulWidget.dart';
import 'package:dewalletvendor/custom/NovuWidget.dart';
import 'package:dewalletvendor/custom/PasswordField.dart';
import 'package:dewalletvendor/helpers/RouteConfig.dart';
import 'package:dewalletvendor/repositories/OnBoardingRepository.dart';
import 'package:flutter/material.dart';
import 'package:the_validator/the_validator.dart';

///
/// project: de_wallet_vendor
/// @package: onboarding
/// @author dammyololade <damola@kobo360.com>
/// created on 29/03/2020
class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen>
    with UiKits, BaseStatefulWidget {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
                      Text("SIGN IN"),
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
                      PasswordField(
                          controller: _passwordController,
                          label: "Password",
                          textValidator: FieldValidator.password(minLength: 6)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed(
                                  RouteConfig.INIT_RESET_PASSWORD);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                "forgot password",
                                style: TextStyle(
                                    fontFamily: UiKits.AMedium,
                                    color: Colors.blueAccent),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Height(50),
                      NovuWidgets.progressAwareButton(
                          notifier: progressNotifier,
                          child: NovuWidgets.positiveButton("Submit", () {
                            if (_formKey.currentState.validate()) {
                              _submit();
                            }
                          }, bgColor: AppConfig.APP_BUTTON_COLOR))
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
    var response = await OnBoardingRepository()
        .login(_emailController.text, _passwordController.text);
    progressNotifier.value = false;
    if (response.success) {
      Navigator.of(context).pushReplacementNamed(RouteConfig.HOME);
    } else {
      showBottomNotification(context, message: response.message);
    }
  }
}
