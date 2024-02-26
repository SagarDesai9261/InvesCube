import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_market/widget/Const_data.dart';

import 'authentication/mpin_set.dart';
import 'authentication/reset_password.dart';

/*
void main() {
  runApp(
    MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
      home: Otp_Verification(otp:"1234",email: "abc@gmail.com",)
    ),
  );
}
*/

class Otp_Verification extends StatefulWidget {
  String otp;
  String email;
  bool password;

  Otp_Verification(
      {Key? key,
      required this.otp,
      required this.email,
      required this.password})
      : super(key: key);

  @override
  State<Otp_Verification> createState() => _Otp_VerificationState();
}

class _Otp_VerificationState extends State<Otp_Verification> {
  String encode_email = "";
  String obscureEmail(String email) {
    if (email.length <= 4) {
      return email; // Do not obscure if the length is less than or equal to 4
    }

    String obscuredPart = 'X' * (email.length - 4);
    String visiblePart = email.substring(0, 4);

    return '$visiblePart$obscuredPart';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      encode_email = obscureEmail(widget.email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: const Alignment(-0.00, 1.00),
                end: const Alignment(0, -1),
                colors: [Colors.black, Colors.white.withOpacity(1)],
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Image.asset("assets/reset_lock.png", height: 200, width: 200),
                const SizedBox(
                  child: Text(
                    'OTP Verification',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (encode_email.length > 15)
                  Column(
                    children: [
                      Text(
                        'Enter the OTP sent to ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${encode_email}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                if (encode_email.length < 15)
                  Text(
                    'Enter the OTP sent to ${encode_email} ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * .23,
              child: Image.asset(
                "assets/vector/vector_4.png",
                height: 80,
                width: 30,
              ))
        ],
      ),
      bottomSheet: Container(
        color: Colors.transparent,
        child: Container(
          height: MediaQuery.of(context).size.height * .45,
          width: MediaQuery.of(context).size.width,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: const Alignment(-0.00, 1.00),
              end: const Alignment(0, -1),
              colors: [Colors.white, Colors.white.withOpacity(1)],
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
          child: FractionallySizedBox(
            widthFactor: 1,
            child: PinputExample(
              otp: widget.otp,
              email: widget.email,
              password: widget.password,
            ),
          ),
        ),
      ),
    );
  }
}

class PinputExample extends StatefulWidget {
  String otp;
  String email;
  bool password;
  PinputExample(
      {Key? key,
      required this.otp,
      required this.email,
      required this.password})
      : super(key: key);

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool allfield = false;
  bool isResendEnabled = false;
  late Timer resendTimer;
  int secondsRemaining = 60;

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  void startResendTimer() {
    resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer.cancel();
        setState(() {
          isResendEnabled = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    resendTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Colors.black;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Colors.grey;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Pinput(
            controller: pinController,
            androidSmsAutofillMethod:
                AndroidSmsAutofillMethod.smsUserConsentApi,
            listenForMultipleSmsOnAndroid: true,
            defaultPinTheme: defaultPinTheme,
            separatorBuilder: (index) => const SizedBox(width: 8),
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: (pin) {
              debugPrint('onCompleted: $pin');
              setState(() {
                allfield = true;
              });
            },
            validator: (s) {
              return s == widget.otp ? null : 'OTP is incorrect';
            },
            onChanged: (value) {
              if (allfield == true) {
                setState(() {
                  allfield = false;
                });
              }
              debugPrint('onChanged: $value');
            },
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: focusedBorderColor),
              ),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: fillColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: focusedBorderColor),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.redAccent),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          if (!isResendEnabled)
            Text(
              'Resend OTP in ${_formatDuration(Duration(seconds: secondsRemaining))}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String mobile = prefs.getString("accountMobile") ?? "";
              if (allfield && pinController.text == widget.otp) {
                if (widget.password == false) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MpinSet(
                                mobile: mobile,
                              )));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              reset_password(email: widget.email)));
                }
              } else {
                Fluttertoast.showToast(msg: "Otp is not matched");
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * .6,
              height: 38,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: Colors.black.withOpacity(0.10000000149011612),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: Text(
                "Verify Now",
                style: TextStyle(color: allfield ? Colors.black : Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                if (secondsRemaining == 0) {
                  sendOtp();
                  setState(() {
                    isResendEnabled = false;
                    secondsRemaining = 60;
                    startResendTimer();
                  });

//                  Fluttertoast.showToast(msg: "New Otp send");
                } else {
                  Fluttertoast.showToast(msg: "Otp Already send");
                }
              },
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Didn’t you receive OTP ? ',
                      style: TextStyle(
                        color: Color(0xFF787878),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Resend OTP',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Future<void> sendOtp() async {
    final String apiUrl = "${const_data().Api_url}/forget_password.php";
    final Map<String, String> headers = {
      'Authorization': 'yp7280uvfkvdirgjkpo',
      //'Content-Type': 'application/json',
    };
    final response = await http.post(Uri.parse(apiUrl),
        body: {
          //'mobile_number': mobile_number.text,
          'email': widget.email,
        },
        headers: headers);

    if (response.statusCode == 200) {
      // Parse the response JSON
      Map<String, dynamic> data = json.decode(response.body);

      // Check if the request was successful
      if (data['success'] == '1') {
        // Get the OTP from the response
        // String otp = data['Otp'];

        setState(() {
          print("Otp is ${data['Otp']}");
          var Otp = data['Otp'].toString();
          widget.otp = Otp;
          display_toast("Otp Sent in Email");
          //send_otp = true;
        });

        // Show a success message or perform further actions
        //print('Email OTP sent successfully: $otp');
      } else {
        // Handle error case
        print('Failed to send OTP. Error: ${data['message']}');
      }
    } else {
      // Handle non-200 status code
      print('Failed to send OTP. Status code: ${response.statusCode}');
    }
  }

  String _formatDuration(Duration duration) {
    return DateFormat('mm:ss')
        .format(DateTime(0, 0, 0, 0, 0, duration.inSeconds));
  }

  display_toast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
