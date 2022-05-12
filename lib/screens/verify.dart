import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:pin_code_fields/pin_code_fields.dart';

class Verify extends StatefulWidget {
  final String? phoneNumber;

  const Verify({
    Key? key,
    this.phoneNumber = '+91 1234567890',
  }) : super(key: key);

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  // TextEditingController otpController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            // color: Colors.amber,
            height: 700,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 20),
              child: ListView(
                children: [
                  Text(
                    'Verification',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Code',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 260.0),
                    child: Container(
                      child: Divider(
                        thickness: 4,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: RichText(
                      text: TextSpan(
                        text: "Verification code was sent to ",
                        style: const TextStyle(
                            color: Color.fromARGB(226, 106, 105, 105),
                            fontWeight: FontWeight.w300,
                            fontSize: 19),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: RichText(
                          text: TextSpan(
                            text: "${widget.phoneNumber}",
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                                fontSize: 19),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 30),
                    child: Form(
                      key: formKey,
                      child: PinCodeTextField(
                        enablePinAutofill: false,
                        // controller: otpController,
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 4) {
                            return "four digits needed";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          borderWidth: .8,
                          selectedColor: Colors.amber,
                          selectedFillColor: Colors.white,
                          inactiveColor: Colors.amber,
                          inactiveFillColor: Colors.grey.shade200,
                          activeColor: Colors.transparent,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 60,
                          fieldWidth: 50,
                          activeFillColor: Colors.grey.shade200,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        //controller: otpController,
                        keyboardType: TextInputType.number,

                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");

                          return true;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Resend code in ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () => snackBar("OTP resend!!"),
                        child: const Text(
                          "00:16",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 65),
                    child: ElevatedButton(
                      onPressed: () {
                        formKey.currentState!.validate();

                        // conditions for validating

                        // otp(otpController.text, context);
                        if (currentText.length != 4 || currentText != "1234") {
                          errorController!.add(ErrorAnimationType
                              .shake); // Triggering error shake animation
                          setState(() => hasError = true);
                        } else {
                          setState(
                            () {
                              hasError = false;
                              snackBar("OTP Verified!!");
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.yellow,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28)),
                        primary: Colors.amber,
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                      child: const Text(
                        "Verify Now",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
