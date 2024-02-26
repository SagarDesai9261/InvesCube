import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_market/screens/loader.dart';
import '../NotificationService.dart';
import '../model/providers.dart';
import '../screens/dashboard.dart';
import '../widget/Const_data.dart';
import 'mpin.dart';
import 'mpin_set.dart';
import 'signup.dart';
import 'forgot_password.dart';
import 'package:http/http.dart' as http;

class signin extends StatefulWidget {
  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  Future<String> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // iOS device ID
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // Android device ID
    }
  }

  bool isLoading = false;
  final form_key = GlobalKey<FormState>();
  bool isSecure = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String email_message = "";
  String password_message = "";
  bool upassword = false;
  bool uemail = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Stack(
        children: [
          Scaffold(
            bottomSheet: Stack(
              children: [
                Form(
                  key: form_key,
                  child: Container(
                    height: h > 700
                        ? h > 900
                            ? 470
                            : 400
                        : h * .6,
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
                            const SizedBox(height: 40),
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
                                      child:Icon(Icons.phone_android_sharp,) /* Image.asset("assets/username.png",
                                          height: 15, width: 15),*/
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
                                      child: Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0),
                                            child: TextFormField(
                                              controller: email,
                                             keyboardType: TextInputType.number,
                                              style:
                                                  const TextStyle(fontSize: 13),
                                              decoration: InputDecoration(

                                                border: InputBorder.none,
                                                hintText:
                                                    "Enter your mobile number here...",
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
                                                color: Colors.red,
                                                fontSize: 12),
                                            textAlign: TextAlign.right,
                                          )),
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
                                      child: Icon(Icons.lock,) /* Image.asset("assets/username.png",
                                          height: 15, width: 15),*/,
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
                                              .7, // Adjust the width based on your design
                                      height: 38,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 0.50,
                                              color: upassword
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
                                      child: Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0),
                                            child: TextFormField(
                                              controller: password,
                                              validator: (value) {
                                                if (value == "") {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "password is required",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.CENTER,
                                                      timeInSecForIosWeb: 1,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                  return null;
                                                }
                                                return null;
                                              },

                                              // controller: _controller,
                                              obscureText: isSecure,
                                              style:
                                                  const TextStyle(fontSize: 13),
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Enter your password",
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    isSecure == false
                                                        ? Icons.visibility
                                                        : Icons.visibility_off,
                                                    color: Colors.grey,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      isSecure = !isSecure;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
                                          )),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              forget_password()));
                                },
                                child: Text(
                                  'Forgot Password ?',
                                  style: TextStyle(
                                    color: Colors.black
                                        .withOpacity(0.30000001192092896),
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    //textDecoration: TextDecoration.underline,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            InkWell(
                                onTap: () async {
                                  // String deviceId = await getDeviceId();
                                  // print('Device ID: $deviceId');
                                  /* if (form_key.currentState!.validate()) {
                                    // print("hello");
                                    if ((email.text != "" || email.text.isNotEmpty) &&
                                        (password.text != "" ||
                                            password.text.isNotEmpty)) {
                                      _signIn();
                                    }
                                  }*/
                                  if (email.text.isEmpty || email.text == "") {
                                    setState(() {
                                      uemail = true;
                                      email_message = "mobile is required";
                                    });
                                  } else if (email.text.length > 10 || email.text.length<10) {
                                    setState(() {
                                      uemail = true;
                                      email_message = "mobile is invalid";
                                    });
                                  } else if (uemail == true) {
                                    setState(() {
                                      uemail = false;
                                    });
                                  }
                                  if (password.text.isEmpty ||
                                      password.text == "") {
                                    setState(() {
                                      upassword = true;
                                      password_message = "password is required";
                                    });
                                  } else if (upassword == true) {
                                    setState(() {
                                      upassword = false;
                                    });
                                  }

                                  if (uemail == false && upassword == false) {
                                    login();
                                  }
                                },
                                child: buildSignUpButton()),
                            const SizedBox(height: 20),
                            buildDividerOr(),
                            //   const SizedBox(height: 0),
                            buildSocialButtonsRow(context),
                          ],
                        ),
                      ),
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
                  height: h > 700 ? h * .55 : 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(-0.00, 1.00),
                      end: const Alignment(0, -1),
                      colors: [Colors.black, Colors.black12.withOpacity(.2)],
                    ),
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      if (h > 799) SizedBox(height: h * .04),
                      Image.asset("assets/img_2.png",
                          height: h > 700 ? h * .3 : h * .25,
                          width: h > 700 ? screenWidth * .5 : screenWidth * .4),
                      const Text(
                        'Please Login to continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Sign in your account here...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 50,
                    left: 0,
                    child: Image.asset(
                      "assets/vector/vector_1.png",
                      height: 130,
                      width: 40,
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
      ),
    );
  }

  Widget buildTextFieldWithIcon(
      String iconPath, String hintText, bool isPassword) {
    TextEditingController _controller = TextEditingController();
    //bool isSecure = true;
    var w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 37,
          height: 38,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.50, color: Color(0xFFE0E0E0)),
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
          child: Image.asset(iconPath, height: 15, width: 15),
        ),
        const SizedBox(width: 10),
        if (isPassword)
          Container(
            width: 230, // Adjust the width based on your design
            height: 38,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: Color(0xFFE0E0E0)),
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
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    controller: _controller,
                    obscureText: isSecure,
                    style: const TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                    ),
                  ),
                ),
                if (isPassword)
                  IconButton(
                    icon: Icon(
                      isSecure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isSecure = !isSecure;
                      });
                    },
                  ),
              ],
            ),
          ),
        if (isPassword == false)
          Container(
            width: w > 375
                ? w * .7
                : w * .7, // Adjust the width based on your design
            height: 38,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: Color(0xFFE0E0E0)),
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
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    controller: _controller,
                    obscureText: isPassword,
                    style: const TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                    ),
                  ),
                ),
                if (isPassword)
                  IconButton(
                    icon: Icon(
                      isPassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // Toggle password visibility
                      _controller.selection = TextSelection.fromPosition(
                          TextPosition(offset: _controller.text.length));
                      isPassword = !isPassword;
                    },
                  ),
              ],
            ),
          ),
      ],
    );
  }

  Widget buildSignUpButton() {
    return InkWell(
      child: Container(
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
              "Sign In",
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
      ),
    );
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

  Widget buildSocialButtonsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 66,
          height: 15,
          child: Text(
            'New User ?',
            style: TextStyle(
              color: Colors.black.withOpacity(0.30000001192092896),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        //SizedBox(width: 10),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => signup()));
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        )
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

  getStoredDeviceId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(prefs.getString('userId'))
        .get();

    if (userSnapshot.exists) {
      // Assuming 'deviceId' is the field in which you store the device ID
      String storedDeviceId = userSnapshot['deviceId'];
      return storedDeviceId;
    } else {
      print('User document does not exist.');
      return '';
    }
  }

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    final String apiUrl = '${const_data().Api_url}/login.php';
    final Map<String, String> headers = {
      'Authorization': 'yp7280uvfkvdirgjkpo',
      //'Content-Type': 'application/json',
    };

    String token = await NotificationService().getDeviceToken();
    print(token.toString());

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Add headers to the request
      headers.forEach((key, value) {
        request.headers[key] = value;
      });

      // Add form fields to the request
      request.fields['mobile_number'] = email.text;
      request.fields['password'] = password.text;
      request.fields['token'] = token;
      var response = await request.send();

      // Read and print the response
      final responseString = await response.stream.bytesToString();
      final response_data = json.decode(responseString);
      print(response_data);
      if (response_data["status"] == "Login Not Successful") {
        if (response_data["message"] == "Incorrect Password") {
          setState(() {
            uemail = false;
            upassword = true;
            password_message = "Wrong Password";
          });
        } else if (upassword == true) {
          setState(() {
            upassword = false;
          });
        }
        if (response_data["message"] == "mobile_number not registered" || response_data["message"]=="Mobile Number not registered") {
          setState(() {
            upassword = false;
            //uemail = true;
           // email_message = "mobile number not registered";
          });
           Navigator.push(context, MaterialPageRoute(builder: (context)=>signup(mobile: email.text,)));


        } else if (uemail == true) {
          setState(() {
            uemail = false;
          });
        }
      } else if (response_data["status"] == "Login Successful") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("user_id", response_data["Detail"]["user_id"]);
        prefs.setString("accountName", response_data["Detail"]["user_name"]);
        prefs.setString("accountEmail", response_data["Detail"]["email"]);
        prefs.setString(
            "accountMobile", response_data["Detail"]["mobile_number"]);
        prefs.setString("accountImage", response_data["Detail"]["image"]);
        prefs.setString("accountId", response_data["Detail"]["id"]);
        prefs.setString("accountMpin", response_data["Detail"]["m_pin"]);
        Provider.of<UserInfoProvider>(context, listen: false)
            .setImage(response_data["Detail"]["image"]);
        if (response_data["Detail"]["m_pin"] == "") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MpinSet(
                        mobile: response_data["Detail"]["mobile_number"],
                      )));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Loader_screen()));
        }
      }
      /*if(response_data == "Login Successfull"){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard()));
      }else{
        display_toast("Login Unsuccessful");
      }*/

      // Handle the response as needed
      // ...

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      // Handle exceptions
      print('Exception during login: $e');
      setState(() {
        isLoading = false;
      });
    }
  }
}
