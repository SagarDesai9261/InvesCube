import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../screens/dashboard.dart';
import 'package:http/http.dart' as http;
import '../otp_verification.dart';
import '../widget/Const_data.dart';
import 'mpin_set.dart';

import 'reset_password.dart';
import 'signup.dart';

class forget_password extends StatefulWidget {
  @override
  State<forget_password> createState() => _forget_passwordState();
}

class _forget_passwordState extends State<forget_password> {
  bool isSecure = true;
  bool uemail = false;
  bool isLoading = false;
  TextEditingController email = TextEditingController();
  String email_message = "";
  String password_message = "";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          bottomSheet: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .45,
                width: screenWidth,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(-0.00, 1.00),
                    end: const Alignment(0, -1),
                    colors: [Colors.white, Colors.white.withOpacity(1)],
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 37,
                                height: 38,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.50, color: Color(0xFFE0E0E0)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  shadows: [
                                    const BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Icon(Icons.phone_android_sharp),
                              ),
                              if (uemail) Text("")
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Container(
                                width: screenWidth > 375
                                    ? screenWidth * .7
                                    : screenWidth *
                                        .7, // Adjust the width based on your design
                                height: 38,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50,
                                        color: uemail
                                            ? Colors.red
                                            : Color(0xFFE0E0E0)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  shadows: [
                                    const BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: TextFormField(
                                        controller: email,
                                        keyboardType: TextInputType.number,
                                        //obscureText: isSecure,
                                        style: const TextStyle(fontSize: 13),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter your mobile number here...",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (uemail)
                                Container(
                                    width: screenWidth > 375
                                        ? screenWidth * .65
                                        : screenWidth * .65,
                                    //color: Colors.green,
                                    child: Text(
                                      "${email_message}",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 12),
                                      textAlign: TextAlign.right,
                                    )),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 30),
                      InkWell(
                          onTap: () {
                            if (email.text.isEmpty || email.text == "") {
                              setState(() {
                                uemail = true;
                                email_message = "email is required";
                              });
                            } else if (uemail) {
                              setState(() {
                                uemail = false;
                                email_message = "";
                              });
                            }

                            if (uemail == false) {
                              //              Navigator.push(context, MaterialPageRoute(builder: (context)=>Otp_Verification(otp:"1234",email: email.text,)));
                              sendOtp();
                            }
                          },
                          child: buildSignUpButton()),
                      const SizedBox(height: 30),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          width: 55,
                          height: 15,
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    "assets/vector/vector_2.png",
                    height: 60,
                    width: 50,
                  ))
            ],
          ),
          body: Stack(
            children: [
              Container(
                width: screenWidth,
                height: MediaQuery.of(context).size.height * .6,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(-0.00, 1.00),
                    end: const Alignment(0, -1),
                    colors: [Colors.black, Colors.black.withOpacity(.2)],
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
                    //const SizedBox(height: 30),
                    Image.asset("assets/images/img_30.png",
                        height: 180, width: 180),
                    SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      child: Text(
                        'Forget your MPIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Enter the mobile no. to reset MPIN here...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
        ),
        if (isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: SpinKitFadingCube(
                color: Colors.white,
                size: 50.0,
              ),
            ),
          ),
      ],
    );
  }

  Widget buildSignUpButton() {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      height: 38,
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Continue",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> sendOtp() async {
    setState(() {
      isLoading = true;
    });
    final String apiUrl = "${const_data().Api_url}/forget_password.php";
    final Map<String, String> headers = {
      'Authorization': 'yp7280uvfkvdirgjkpo',
      //'Content-Type': 'application/json',
    };
    final response = await http.post(Uri.parse(apiUrl),
        body: {
          //'mobile_number': mobile_number.text,
          'mobile_number': email.text,
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
          display_toast("Otp Sent in Email");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Otp_Verification(
                        otp: Otp,
                        email: data["Email"],
                        password: false,
                      )));
          //send_otp = true;
        });

        // Show a success message or perform further actions
        //print('Email OTP sent successfully: $otp');
      } else {
        display_toast("Email is not register");
        // Handle error case
        print('Failed to send OTP. Error: ${data['message']}');
      }
    } else {
      // Handle non-200 status code
      print('Failed to send OTP. Status code: ${response.statusCode}');
    }
    setState(() {
      isLoading = false;
    });
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
