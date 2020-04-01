import 'package:dewalletvendor/custom/NovuWidget.dart';
import 'package:flutter/material.dart';


/// description:
/// project: de_wallet_vendor
/// @package: custom
/// @author: dammyololade
/// created on: 01/04/2020
class PasswordField extends StatelessWidget {
  ValueNotifier<bool> showFieldNotifier = ValueNotifier(false);

  String label, hint;
  TextEditingController controller;
  TextInputType inputType;
  String errorMessage;
  bool isObscureText;
  Color borderColor;
  TextValidator textValidator;
  bool isLastTextField;
  FocusNode focusNode, nextFocusNode;
  BuildContext context;
  TextStyle labelTextStyle;
  int maxLines = 1;
  InputBorder border;
  TextStyle inputTextStyle;
  Widget prefix;
  bool isEnabled;

  PasswordField(
      { @required this.controller,
        this.label = "",
        this.hint = "",
        this.inputType,
        this.errorMessage,
        this.isObscureText = true,
        this.borderColor,
        this.textValidator,
        this.isLastTextField = false,
        this.focusNode,
        this.nextFocusNode,
        this.context,
        this.labelTextStyle,
        this.maxLines,
        this.border,
        this.inputTextStyle,
        this.prefix,
        this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: showFieldNotifier,
        builder: (context, bool value, child) => TextFormField(
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: NovuWidgets.formFieldTextStyle(),
              errorStyle: TextStyle(color: Colors.red, fontSize: 10),
              focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? Colors.lightBlue, width: 1)),
              border: border ??
                  OutlineInputBorder(
                      borderSide: BorderSide(
                          color: borderColor ?? Color(0xffB7B7B7), width: 1)),
              enabledBorder: border ??
                  OutlineInputBorder(
                      borderSide: BorderSide(
                          color: borderColor ?? Color(0xffB7B7B7), width: 1)),
              labelText: "$label",
              labelStyle:
              labelTextStyle ?? NovuWidgets.formFieldLabelStyle(),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              prefix: prefix ?? SizedBox(),
              suffix: InkWell(
                onTap: (){
                  showFieldNotifier.value = !value;
                },
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(value
                        ? Icons.visibility_off
                        : Icons.visibility, color: Colors.grey,)),
              )),
          controller: controller,
          maxLines: 1,
          enabled: isEnabled,
          keyboardType: TextInputType.text,
          obscureText: !value,
          textInputAction:
          isLastTextField ? TextInputAction.done : TextInputAction.next,
          validator: textValidator ??
                  (value) {
                if (value.isEmpty) {
                  return errorMessage;
                } else {
                  return null;
                }
              },
          focusNode: focusNode,
          onFieldSubmitted: (term) {
            if (focusNode != null && context != null) {
              isLastTextField
                  ? FocusScope.of(context).consumeKeyboardToken()
                  : FocusScope.of(context).requestFocus(nextFocusNode);
            }
          },
          style: inputTextStyle ??
              TextStyle(
                  color: Colors.black, fontSize: 16, fontFamily: "ARoman"),
        ));
  }
}