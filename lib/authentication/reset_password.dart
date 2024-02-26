import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'reset_password_success.dart';
// import 'signup.dart';
import 'package:http/http.dart' as http;
import 'package:stock_market/authentication/reset_password_success.dart';

import '../widget/Const_data.dart';

void main() {
  runApp(MaterialApp(
      home: reset_password(
    email: 'mailto:realdream92619261@gamil.com',
  )));
}

class reset_password extends StatefulWidget {
  String email = "";
  reset_password({required this.email});

  @override
  State<reset_password> createState() => _reset_passwordState();
}

class _reset_passwordState extends State<reset_password> {
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  bool upassword = false;
  bool uconfirmpassword = false;

  String password_message = "";
  String conpass_message = "";

  _signup() {
    if (_password.text.isEmpty) {
      setState(() {
        upassword = true;
        password_message = "password is required";
      });
    }
    if (_confirmpassword.text.isEmpty) {
      setState(() {
        uconfirmpassword = true;
        conpass_message = " confirm password is required";
      });
    } else if (_confirmpassword.text != _password.text) {
      setState(() {
        uconfirmpassword = true;
        conpass_message = "both password is not match";
      });
    } else if (_confirmpassword.text == _password.text) {
      setState(() {
        upassword = false;
        uconfirmpassword = false;
        // conpass_message = "password is not match";
      });
    }
  }

  bool isSecure = true;
  bool isSecure1 = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double w = screenWidth;

    return Scaffold(
      bottomSheet: Container(
        height: h > 700 ? 400 : 300,
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
                h > 700
                    ? const SizedBox(height: 70)
                    : const SizedBox(height: 40),
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
                          child: Image.asset("assets/lock.png",
                              height: 15, width: 15),
                        ),
                        if (upassword) Text(""),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Container(
                          width: 230, // Adjust the width based on your design
                          height: 38,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50,
                                color: upassword == true
                                    ? Colors.red
                                    : Color(0xFFE0E0E0),
                              ),
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
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  controller: _password,
                                  obscureText: isSecure,
                                  style: const TextStyle(fontSize: 13),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter New Password here...",
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isSecure == false
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        // Toggle password visibility
                                        //_controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
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
                                  ? screenWidth * .58
                                  : screenWidth * .58,
                              //color: Colors.green,
                              child: Text(
                                "${password_message}",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                                textAlign: TextAlign.right,
                              )),
                        //Text("${password_message}",style: TextStyle(color: Colors.red),),
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
                          child: Image.asset("assets/lock.png",
                              height: 15, width: 15),
                        ),
                        if (uconfirmpassword) Text(""),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Container(
                          width: 230, // Adjust the width based on your design
                          height: 38,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50,
                                color: uconfirmpassword == true
                                    ? Colors.red
                                    : Color(0xFFE0E0E0),
                              ),
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
                                padding: const EdgeInsets.only(left: 12.0),
                                child: TextFormField(
                                  controller: _confirmpassword,
                                  obscureText: isSecure1,
                                  style: const TextStyle(fontSize: 13),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Confirm Password here...",
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isSecure1 == false
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        // Toggle password visibility
                                        //_controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
                                        setState(() {
                                          isSecure1 = !isSecure1;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (uconfirmpassword)
                          Container(
                              width: screenWidth > 375
                                  ? screenWidth * .58
                                  : screenWidth * .58,
                              //color: Colors.green,
                              child: Text(
                                "${conpass_message}",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                                textAlign: TextAlign.right,
                              )),
                        // Text("${conpass_message}",style: TextStyle(color: Colors.red),),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                buildSignUpButton(),
                const SizedBox(height: 30),
                const InkWell(
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
      ),
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: h > 700 ? 450 : 400,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: const Alignment(-0.00, 1.00),
                end: const Alignment(0, -1),
                colors: [Colors.black, Colors.white.withOpacity(1)],
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Image.asset("assets/key.png",
                    height: h > 700 ? h * .35 : h * .25,
                    width: h > 700 ? screenWidth * .5 : screenWidth * .4),
                const SizedBox(
                  child: Text(
                    'Reset your password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                ),
                const Text(
                  'The password must be different than before',
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
            top: 60,
            left: 20,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSignUpButton() {
    return InkWell(
      onTap: () {
        _signup();
        password_reset();
        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>reset_password_success()));
      },
      child: Container(
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
      ),
    );
  }

  Widget buildDividerOr() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 60, child: Divider(height: 2)),
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
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
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

  password_reset() async {
    var request = http.MultipartRequest(
        'Post', Uri.parse('${const_data().Api_url}/updates_password.php'));

    request.headers['Authorization'] = 'yp7280uvfkvdirgjkpo';
    request.fields['email'] = widget.email;
    request.fields['password'] = _password.text.toString();

    var response = await request.send();
    final responseString = await response.stream.bytesToString();
    final response_data = json.decode(responseString);

    print(response_data);

    if (response_data["success"]) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => reset_password_success()));
    } else {
      Fluttertoast.showToast(msg: "error in password update");
    }
    // final String apiUrl = "${const_data().Api_url}/updates_password.php";
    // final Map<String, String> headers = {
    //  'Authorization': 'yp7280uvfkvdirgjkpo',
    //   //'Content-Type': 'application/json',
    // };
    // final response = await http.post(
    //     Uri.parse(apiUrl),
    //     body: {
    //       'email': widget.email,
    //
    //     },
    //     headers: headers
    // );
  }
}
