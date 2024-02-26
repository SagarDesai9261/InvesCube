import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../NotificationService.dart';
import '../widget/Const_data.dart';
import 'mpin_set.dart';

class signup extends StatefulWidget {
  String? mobile = "";
  signup({ this.mobile});
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final form_key = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController mobile_number = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController verify_otp_controller = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  TextEditingController company = TextEditingController();
  String image_url = "";
  bool uname = false;
  bool mobile = false;
  bool uemail = false;
  bool upassword = false;
  bool uconfirm_password = false;
  bool send_otp = false;
  bool verify_otp = false;
  bool verified_email = false;
  String name_message = "";
  String mobile_message = "";
  String email_message = "";
  String password_message = "";
  String confirm_message = "";
  String verify_message = "";
  String Otp = "";
  Map<String,dynamic> bannerData = {};
  bool _isChecked = false;
  bool banner_display = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("hello");
    mobile_number.text = widget.mobile != null ? widget.mobile.toString() : "";
    fetchData();
  }

  bool isLoading = false;

  void _showSpinner() {
    setState(() {
      isLoading = true;
    });

    // Simulate some asynchronous operation
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    print(screenWidth);
    print(h);
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            bottomSheet: Stack(
              children: [
                Form(
                  key: form_key,
                  child: Container(
                    height: h > 700 ? 450 : h * .6,
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
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
                                              width: 0.50,
                                              color: Color(0xFFE0E0E0)),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      child: Icon(Icons.person,) /*Image.asset("assets/username.png",
                                          height: 15, width: 15)*/,
                                    ),
                                    if (uname) Text("")
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    Container(
                                      width: screenWidth > 375
                                          ? screenWidth * .7
                                          : screenWidth *
                                              .7, // Adjust the width based on your design,
                                      height: 38,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 0.50,
                                              color: uname == true
                                                  ? Colors.red
                                                  : Color(0xFFE0E0E0)),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12.0),
                                          child: TextFormField(
                                            controller: name,
                                            style:
                                                const TextStyle(fontSize: 13),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  "Enter your name here...",
                                              hintStyle: TextStyle(
                                                color:Colors.grey
                                              )
                                            ),

                                          ),
                                        ),
                                      ),
                                    ),
                                    if (uname)
                                      Container(
                                        width: screenWidth > 375
                                            ? screenWidth * .65
                                            : screenWidth * .65,
                                        //color: Colors.green,
                                        child: Text(
                                          "Name is Required",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 12),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
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
                                              width: 0.50,
                                              color: Color(0xFFE0E0E0)),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      child:Icon(Icons.phone_android_sharp,) /*Image.asset("assets/mobile.png",
                                          height: 15, width: 15)*/,
                                    ),
                                    if (mobile) Text("")
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    Container(
                                      width: screenWidth > 375
                                          ? screenWidth * .7
                                          : screenWidth *
                                              .7, // Adjust the width based on your design,
                                      height: 38,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: mobile == true
                                                  ? Colors.red
                                                  : Color(0xFFE0E0E0)),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12.0),
                                          child: TextFormField(
                                          //  initialValue: widget.mobile!.isEmpty ? "":widget.mobile.toString(),
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  10),
                                            ],
                                            onChanged: (value) {
                                              if (value.length == 10) {
                                                mobile_verify(value);
                                              }
                                              if (mobile == true) {
                                                setState(() {
                                                  mobile = false;
                                                });
                                              }
                                            },
                                            keyboardType: TextInputType.number,
                                            controller: mobile_number,
                                            style:
                                                const TextStyle(fontSize: 13),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  "Enter your mobile number here...",
                                                hintStyle: TextStyle(
                                                    color:Colors.grey
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (mobile)
                                      Container(
                                          width: screenWidth > 375
                                              ? screenWidth * .65
                                              : screenWidth * .65,
                                          //color: Colors.green,
                                          child: Text(
                                            "${mobile_message}",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 12),
                                            textAlign: TextAlign.right,
                                          ))
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
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
                                              width: 0.50,
                                              color: Color(0xFFE0E0E0)),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      child:Icon(Icons.email,) /*Image.asset("assets/email.png",
                                          height: 15, width: 15)*/,
                                    ),
                                    if (uemail || verified_email) Text("")
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    Container(
                                      width: screenWidth > 375
                                          ? screenWidth * .7
                                          : screenWidth *
                                              .7, // Adjust the width based on your design,
                                      height: 38,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1.3,
                                              color: uemail == true
                                                  ? Colors.red
                                                  : verified_email
                                                      ? Colors.green
                                                      : Color(0xFFE0E0E0)),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.0,
                                              right: 10,
                                              bottom: verified_email ? 30 : 0),
                                          child: TextFormField(
                                            //keyboardType: TextInputType.number,
                                            controller: email,
                                            onChanged: (value) {
                                              if (RegExp(
                                                      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(value)) {
                                                email_verify(value);
                                              }
                                            },
                                            style:
                                                const TextStyle(fontSize: 13),
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.zero,
                                              suffixIcon: verified_email
                                                  ? null
                                                  : Container(
                                                      //   color: Colors.green,
                                                      margin: EdgeInsets.only(
                                                          top: 1),
                                                      child: TextButton(
                                                          onPressed: () {
                                                            if (mobile_number
                                                                .text.isEmpty) {
                                                              setState(() {
                                                                mobile = true;
                                                                mobile_message =
                                                                    "mobile is required";
                                                              });
                                                            } else if (mobile_number
                                                                    .length !=
                                                                10) {
                                                              setState(() {
                                                                mobile = true;
                                                                mobile_message =
                                                                    "mobile is invalid";
                                                              });
                                                            } else {
                                                              sendOtp();
                                                            }
                                                          },
                                                          child: Text(
                                                            "Send Otp",
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                          )),
                                                    ),
                                              border: InputBorder.none,
                                              hintText:
                                                  "Enter your email here...",
                                                hintStyle: TextStyle(
                                                    color:Colors.grey
                                                )
                                            ),
                                          ),
                                        ),
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
                                                color: Colors.red,
                                                fontSize: 12),
                                            textAlign: TextAlign.right,
                                          )),
                                    if (verified_email)
                                      Container(
                                          width: screenWidth > 375
                                              ? screenWidth * .65
                                              : screenWidth * .65,
                                          //color: Colors.green,
                                          child: Text(
                                            "Verified Email",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                            textAlign: TextAlign.right,
                                          ))
                                  ],
                                ),
                              ],
                            ),
                            if (send_otp) const SizedBox(height: 15),
                            if (send_otp)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 50),
                                  Column(
                                    children: [
                                      Container(
                                        width: screenWidth > 375
                                            ? screenWidth * .7
                                            : screenWidth *
                                                .7, // Adjust the width based on your design,
                                        height: 38,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 0.50,
                                                color: verify_otp == true
                                                    ? Colors.red
                                                    : Color(0xFFE0E0E0)),
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0, vertical: 1),
                                            child: TextFormField(
                                              //keyboardType: TextInputType.number,
                                              controller: verify_otp_controller,
                                              style:
                                                  const TextStyle(fontSize: 13),
                                              keyboardType: TextInputType.phone,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.zero,
                                                suffixIcon: Container(
                                                  //   color: Colors.green,
                                                  margin:
                                                      EdgeInsets.only(top: 1),
                                                  child: TextButton(
                                                      onPressed: () {
                                                        if (Otp ==
                                                            verify_otp_controller
                                                                .text) {
                                                          setState(() {
                                                            uemail = false;
                                                            verified_email =
                                                                true;
                                                            send_otp = false;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            verify_otp = true;
                                                            verify_message =
                                                                "Otp is invalid";
                                                          });
                                                        }
                                                      },
                                                      child: Text(
                                                        "Verify Otp",
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      )),
                                                ),
                                                border: InputBorder.none,
                                                hintText: "Enter your otp",
                                                  hintStyle: TextStyle(
                                                      color:Colors.grey
                                                  )
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (verify_otp)
                                        Container(
                                            width: screenWidth > 375
                                                ? screenWidth * .65
                                                : screenWidth * .65,
                                            //color: Colors.green,
                                            child: Text(
                                              "${verify_message}",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12),
                                              textAlign: TextAlign.right,
                                            ))
                                    ],
                                  ),
                                ],
                              ),
                            const SizedBox(height: 10),
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
                                              width: 0.50,
                                              color: Color(0xFFE0E0E0)),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      child: Icon(Icons.lock,)/*Image.asset("assets/lock.png",
                                          height: 15, width: 15)*/,
                                    ),
                                    if (upassword) Text("")
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    Container(
                                      width: screenWidth > 375
                                          ? screenWidth * .7
                                          : screenWidth *
                                              .7, // Adjust the width based on your design,
                                      height: 38,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 0.50,
                                              color: upassword == true
                                                  ? Colors.red
                                                  : Color(0xFFE0E0E0)),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12.0),
                                          child: TextFormField(
                                            obscureText: true,
                                            controller: password,
                                            style:
                                                const TextStyle(fontSize: 13),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  "Enter your password here...",
                                                hintStyle: TextStyle(
                                                    color:Colors.grey
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (upassword)
                                      Container(
                                          width: screenWidth > 375
                                              ? screenWidth * .65
                                              : screenWidth * .65,
                                          //color: Colors.green,
                                          child: Text(
                                            "${password_message}",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 12),
                                            textAlign: TextAlign.right,
                                          ))
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
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
                                              width: 0.50,
                                              color: Color(0xFFE0E0E0)),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      child:  Icon(Icons.lock,)/*Image.asset("assets/lock.png",
                                          height: 15, width: 15)*/,
                                    ),
                                    if (uconfirm_password) Text("")
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    Container(
                                      width: screenWidth > 375
                                          ? screenWidth * .7
                                          : screenWidth *
                                              .7, // Adjust the width based on your design,
                                      height: 38,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 0.50,
                                              color: uconfirm_password == true
                                                  ? Colors.red
                                                  : Color(0xFFE0E0E0)),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12.0),
                                          child: TextFormField(
                                            obscureText: true,
                                            controller: confirm_password,
                                            style:
                                                const TextStyle(fontSize: 13),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  "Enter your confirm password here...",
                                                hintStyle: TextStyle(
                                                    color:Colors.grey
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (uconfirm_password)
                                      Container(
                                          width: screenWidth > 375
                                              ? screenWidth * .65
                                              : screenWidth * .65,
                                          //color: Colors.green,
                                          child: Text(
                                            "${confirm_message}",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 12),
                                            textAlign: TextAlign.right,
                                          ))
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 37,
                                  height: 38,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.50,
                                          color: Color(0xFFE0E0E0)),
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
                                  child:  Icon(Icons.bar_chart_rounded,)/*Image.asset("assets/lock.png",
                                          height: 15, width: 15)*/,
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width: screenWidth > 375
                                      ? screenWidth * .7
                                      : screenWidth *
                                          .7, // Adjust the width based on your design,
                                  height: 38,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.50,
                                          color: Color(0xFFE0E0E0)),
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
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: TextFormField(
                                        controller: company,
                                        validator: (value) {
                                          if (value == "") {
                                            Fluttertoast.showToast(
                                                msg: "Company name is required",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                            return null;
                                          }

                                          return null;
                                        },
                                        style: const TextStyle(fontSize: 13),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              "Which company has a trading account?",
                                            hintStyle: TextStyle(
                                                color:Colors.grey
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.black45, // Border color
                      ),
                      child: Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            if(banner_display == false && _isChecked == false){
                              banner_display = true;
                            }
                            if(_isChecked == true){
                               _isChecked = value!;
                            }
                           // _isChecked = value!;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.grey), // Border width
                         // borderRadius: BorderRadius.circular(4),
                        ),
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors.black; // Fill color when selected
                            }
                            return Colors.transparent; // Transparent when unselected
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    RichText(
                      text: TextSpan(
                        text: 'I agree to the ',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              color: Colors.black, // Change the color as needed
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle the click event for Terms & Conditions
                                print('Terms & Conditions clicked');
                              },
                          ),
                          TextSpan(
                            text: '.',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
                            const SizedBox(height: 30),
                            InkWell(
                                onTap: () {
                                  if (name.text == "" || name.text == null) {
                                    setState(() {
                                      uname = true;
                                    });
                                  } else {
                                    setState(() {
                                      uname = false;
                                    });
                                  }
                                  if (mobile_number.text == "" ||
                                      mobile_number.text == null) {
                                    setState(() {
                                      mobile = true;
                                      mobile_message = "Mobile is required";
                                    });
                                  } else if (mobile_number.text.length < 10 ||
                                      mobile_number.text.length > 10) {
                                    setState(() {
                                      mobile = true;
                                      mobile_message = "Mobile is invalid";
                                    });
                                  } else {
                                    setState(() {
                                      mobile = false;
                                    });
                                  }
                                  if (email.text == "") {
                                    setState(() {
                                      uemail = true;
                                      email_message = "email is required";
                                    });
                                  } else if (!RegExp(
                                          r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(email.text)) {
                                    setState(() {
                                      uemail = true;
                                      email_message = "email is invalid";
                                    });
                                  } else if (verified_email == false) {
                                    setState(() {
                                      uemail = true;
                                      email_message = "email is not verified";
                                    });
                                  } else {
                                    setState(() {
                                      uemail = false;
                                    });
                                  }
                                  if (password.text == "") {
                                    setState(() {
                                      upassword = true;
                                      password_message = "Password is requied";
                                    });
                                  } else {
                                    upassword = false;
                                  }
                                  if (confirm_password.text == "") {
                                    setState(() {
                                      uconfirm_password = true;
                                      confirm_message =
                                          "Confirm password is required";
                                    });
                                  } else if (confirm_password.text !=
                                      password.text) {
                                    setState(() {
                                      uconfirm_password = true;
                                      confirm_message =
                                          "Both password is not match";
                                    });
                                  } else {
                                    setState(() {
                                      uconfirm_password = false;
                                    });
                                  }
                                  if(_isChecked == false){
                                    
                                    Fluttertoast.showToast(msg: "Please agree to the terms and conditions");
                                  }
                                  if (uname == false &&
                                      uemail == false &&
                                      mobile == false &&
                                      upassword == false &&
                                      uconfirm_password == false &&
                                      verified_email == true && _isChecked ==true) {
                                    registerData();
                                  }
                                },
                                child: buildSignUpButton()),
                            const SizedBox(height: 30),
                            /*buildDividerOr(),
                            const SizedBox(height: 10),*/
                          /*  buildSocialButtonsRow(),
                            const SizedBox(height: 20),*/
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: 0,
                    bottom: 0,
                    child: Image.asset(
                      "assets/vector/vector_3.png",
                      height: 28,
                      width: 50,
                    )),
               /* GestureDetector(
                  onTap: () {
                    setState(() {
                     // banner = false;
                    });
                  },
                  child: Container(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color: Colors.black
                            .withOpacity(0.5), // Adjust the opacity as needed
                      ),
                    ),
                  ),
                ),*/

              ],
            ),
            body: Stack(
              children: [
                Container(
                  width: screenWidth,
                  height: MediaQuery.of(context).size.height * .45,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(-0.00, 1.00),
                      end: const Alignment(0, -1),
                      colors: [Colors.black, Colors.black.withOpacity(0.2)],
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
                      Image.asset("assets/img.png",
                          height: h > 700 ? h * .2 : h * .18,
                          width: h > 700 ? screenWidth * .5 : screenWidth * .4),
                      const SizedBox(
                        child: Text(
                          'Create a New Account',
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
                        height: 10,
                      ),
                      const Text(
                        'Sign Up your account here...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: h * .03),
                    ],
                  ),
                ),
                Positioned(
                    top: 150,
                    left: 0,
                    child: Image.asset(
                      "assets/img_12.png",
                      height: 70,
                      width: 50,
                    )),
                Positioned(
                    top: 50,
                    right: 0,
                    child: Image.asset(
                      "assets/register_left_vector.png",
                      height: 80,
                      width: 50,
                    )),
                Positioned(
                  top: 20,
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
               /* GestureDetector(
                  onTap: () {
                    setState(() {
                  //    banner = false;
                    });
                  },
                  child: Container(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color: Colors.black
                            .withOpacity(0.5), // Adjust the opacity as needed
                      ),
                    ),
                  ),
                ),*/
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
          if(banner_display)
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                  banner_display=false;
                //  _isChecked = true;
                //    banner = false;
                  });
                },
                child: Container(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                    child: Container(
                      color: Colors.black
                          .withOpacity(0.5), // Adjust the opacity as needed
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 500,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            child: Text("${bannerData["title"]}",
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "${bannerData["body"]}",
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  // overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),

                          ElevatedButton(
                            onPressed: () async {
                              /*SharedPreferences prefs = await SharedPreferences.getInstance();
                              String id = prefs.getString("user_id").toString();
                              prefs.setString("banner_click_id",id.toString());
                              String url = widget.banner_data!["url"];
                              if (await canLaunch(url)) {
                                await launch(url, forceWebView: true, enableJavaScript: true);
                              } else {
                                throw 'Could not launch $url';
                              }*/
                              setState(() {
                                banner_display = false;
                                _isChecked = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0), // Set your desired radius
                              ),
                            ),
                            child: Text("Okay", style: TextStyle(color: Colors.white,fontSize: 16)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /*void sendMultipartRequest() async {
   // var baseurl = "https://connectgoinfoware.com/toytree/api/";
    var securitycode = "yp7280uvfkvdirgjkpo";
    var jsonResponce;

    var url = "https://connectgoinfoware.com/toytree/api/product_details.php";

    // Create a MultipartRequest
    var request = http.MultipartRequest('POST', Uri.parse(url));

    // Set headers
    request.headers['Authorization'] = securitycode;

    // Add form fields
    request.fields['prodcut_id'] = '1';

    // Send the request
    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        // Handle success
        jsonResponce = json.decode(await response.stream.bytesToString());
        print("jsonResponce: $jsonResponce");
      } else {
        // Handle error
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (error) {
      // Handle exception
      print("Error: $error");
    }
  }*/
  Widget buildSignUpButton() {
    return Container(
      width: 95,
      height: 38,
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 5),
          Image.asset("assets/arrow.png", height: 15, width: 15),
        ],
      ),
    );
  }

  signInWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        setState(() {
          name.text = googleSignInAccount.displayName.toString();
          image_url = googleSignInAccount.photoUrl.toString();
          email.text = googleSignInAccount.email.toString();
        });
      }
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse("${const_data().Api_url}/terms.php"), headers: {
        "Authorization": "yp7280uvfkvdirgjkpo",
      });

      if (response.statusCode == 200) {
        setState(() {
          bannerData = json.decode(response.body)[0];
        });
        print(bannerData);
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Widget buildDividerOr() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 60, child: Divider(height: 2)),
        SizedBox(width: 5),
        SizedBox(
          width: 16,
          height: 15,
          child: Text(
            'OR',
            style: TextStyle(
              color: Color(0xFFC1C1C1),
              fontSize: 10,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        SizedBox(width: 5),
        SizedBox(width: 60, child: Divider(height: 2)),
      ],
    );
  }

  Widget buildSocialButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: () {
              signInWithGoogle();
            },
            child: Container(
                width: 24,
                height: 24,
                child: Image.asset("assets/google.png"))),
        const SizedBox(width: 10),
        Container(
            width: 24, height: 24, child: Image.asset("assets/apple.png")),
      ],
    );
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

  Future<void> registerData() async {
    setState(() {
      isLoading = true;
    });

    final String apiUrl = '${const_data().Api_url}/register.php';
    final Map<String, String> headers = {
      'Authorization': 'yp7280uvfkvdirgjkpo',
    };

    var token = await NotificationService().getDeviceToken();
    print(token.toString());

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Add headers to the request
      headers.forEach((key, value) {
        request.headers[key] = value;
      });

      // Add form fields to the request
      request.fields['user_name'] = name.text;
      request.fields['mobile_number'] =
          mobile_number.text; // Assuming it's a string
      request.fields['email'] = email.text;
      request.fields['password'] = password.text;
      request.fields['demat_details'] = company.text;
      request.fields['token'] = token.toString();

      var response = await request.send();

      // Read and print the response
      var responseString = await response.stream.bytesToString();
      print(responseString);

      final response_data = json.decode(responseString);

      if (response_data["message"] == "Registration Unsuccessful") {
        display_toast(response_data["error"]);
      } else {
        if (response.statusCode == 200) {
          display_toast(response_data["message"]);
          // Successful registration
          print('Registration successful');
          SharedPreferences prefs = await SharedPreferences.getInstance();

          prefs.setString("accountMobile", mobile_number.text.toString());
          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard()));
          String mpin = prefs.getString("accountMpin") ?? "";
          prefs.setString("user_id", response_data["id"]);
          prefs.setString("accountName", name.text);
          prefs.setString("accountEmail", email.text);
          prefs.setString(
              "accountMobile", mobile_number.text);
          //prefs.setString("accountImage", response_data["Detail"]["image"]);
          prefs.setString("accountId", response_data["id"]);
         // prefs.setString("accountMpin", response_data["Detail"]["m_pin"]);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MpinSet(
                        mobile: mobile_number.text.toString(),
                      )));
        } else {
          // Handle errors
          print(
              'Error during registration. Status code: ${response.statusCode}');
          print('Response body: ${responseString}');
        }
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      // Handle exceptions
      print('Exception during registration: $e');
    }
  }

  Future<void> sendOtp() async {
    final String apiUrl = "${const_data().Api_url}/check_email.php";
    final Map<String, String> headers = {
      'Authorization': 'yp7280uvfkvdirgjkpo',
      //'Content-Type': 'application/json',
    };
    final response = await http.post(Uri.parse(apiUrl),
        body: {
          'mobile_number': mobile_number.text,
          'email': email.text,
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
          Otp = data['Otp'];
          display_toast("Otp Sent in Email");
          send_otp = true;
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

  Future<void> email_verify(String value) async {
    final String apiUrl = "${const_data().Api_url}/check_status.php";
    final Map<String, String> headers = {
      'Authorization': 'yp7280uvfkvdirgjkpo',
      //'Content-Type': 'application/json',
    };
    final response = await http.post(Uri.parse(apiUrl),
        body: {
          //'mobile': mobileController.text,
          'email': value,
        },
        headers: headers);

    if (response.statusCode == 200) {
      // Parse the response JSON
      Map<String, dynamic> data = json.decode(response.body);

      // Check if the mobile or email is already registered
      if (data.containsKey('message')) {
        String message = data['message'];
        if (message == "Email is Already Registered") {
          setState(() {
            uemail = true;
            email_message = "Email is already register";
          });
        } else {
          if (uemail == true) {
            setState(() {
              uemail = false;
            });
          }
        }
        // Show the message to the user or perform further actions
        print(message);
      } else {
        // Handle unexpected response format
        print('Unexpected response format');
      }
    } else {
      // Handle non-200 status code
      print(
          'Failed to check registration status. Status code: ${response.statusCode}');
    }
  }

  Future<void> mobile_verify(String value) async {
    final String apiUrl = "${const_data().Api_url}/check_status.php";
    final Map<String, String> headers = {
      'Authorization': 'yp7280uvfkvdirgjkpo',
      //'Content-Type': 'application/json',
    };
    final response = await http.post(Uri.parse(apiUrl),
        body: {
          'mobile_number': value,
          //    'email': value,
        },
        headers: headers);

    if (response.statusCode == 200) {
      // Parse the response JSON
      Map<String, dynamic> data = json.decode(response.body);

      // Check if the mobile or email is already registered
      if (data.containsKey('message')) {
        String message = data['message'];
        if (message == "Mobile Number is Already Registered") {
          setState(() {
            mobile = true;
            mobile_message = "Mobile is already register";
          });
        } else {
          if (mobile == true) {
            setState(() {
              mobile = false;
            });
          }
        }
        // Show the message to the user or perform further actions
        print(message);
      } else {
        // Handle unexpected response format
        print('Unexpected response format');
      }
    } else {
      // Handle non-200 status code
      print(
          'Failed to check registration status. Status code: ${response.statusCode}');
    }
  }
}
