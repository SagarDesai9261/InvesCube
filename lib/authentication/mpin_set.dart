import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_market/authentication/signin.dart';

import 'package:stock_market/screens/dashboard.dart';
import 'package:stock_market/screens/loader.dart';

import '../widget/Const_data.dart';

void main() {
  runApp(MaterialApp(
      home: MpinSet(
    mobile: '123456',
  )));
}

class MpinSet extends StatefulWidget {
  String mobile;
  MpinSet({required this.mobile});

  @override
  State<MpinSet> createState() => _MpinSetState();
}

class _MpinSetState extends State<MpinSet> {
  bool isSecure = true;
  bool isSecure1 = true;
  TextEditingController mpin = TextEditingController();
  TextEditingController retypempin = TextEditingController();
  String mpin_message = "";
  String retypempin_message = "";
  bool umpin = false;
  bool uretypempin = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          bottomSheet: Stack(children: [
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
                              child: Icon(Icons.lock),
                            ),
                            if (umpin) Text("")
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Container(
                              width:
                                  230, // Adjust the width based on your design
                              height: 38,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.50,
                                    color:
                                        umpin ? Colors.red : Color(0xFFE0E0E0),
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
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(4),
                                      ],
                                      keyboardType: TextInputType.number,
                                      controller: mpin,
                                      obscureText: isSecure,
                                      style: const TextStyle(fontSize: 13),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Set a MPIN here...",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (umpin)
                              Container(
                                  width: screenWidth > 375
                                      ? screenWidth * .50
                                      : screenWidth * .50,
                                  child: Text(
                                    "${mpin_message}",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12),
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
                              child: Icon(Icons.lock),
                            ),
                            if (uretypempin) Text("")
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Container(
                              width:
                                  230, // Adjust the width based on your design
                              height: 38,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.50,
                                    color: uretypempin
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
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(4),
                                      ],
                                      keyboardType: TextInputType.number,
                                      controller: retypempin,
                                      obscureText: isSecure1,
                                      style: const TextStyle(fontSize: 13),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Retype MPIN here...",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (uretypempin)
                              Container(
                                  width: screenWidth > 375
                                      ? screenWidth * .50
                                      : screenWidth * .50,
                                  child: Text(
                                    "${retypempin_message}",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12),
                                    textAlign: TextAlign.right,
                                  )),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    InkWell(
                        onTap: () {
                          if (mpin.text.isEmpty || mpin.text.length < 4) {
                            setState(() {
                              umpin = true;
                              mpin_message = "required atleast four character";
                            });
                          } else if (umpin == true) {
                            setState(() {
                              setState(() {
                                umpin = false;
                              });
                            });
                          }
                          if (retypempin.text.isEmpty ||
                              retypempin.text.length < 4) {
                            setState(() {
                              uretypempin = true;
                              retypempin_message =
                                  "required atleast four character";
                            });
                          } else if (uretypempin == true) {
                            setState(() {
                              setState(() {
                                uretypempin = false;
                              });
                            });
                          }
                          if (retypempin.text != mpin.text) {
                            setState(() {
                              uretypempin = true;
                              retypempin_message = "Both password is not match";
                            });
                          } else if (uretypempin == true) {
                            setState(() {
                              uretypempin = false;
                            });
                          }
                          // else{
                          //   setState(() {
                          //     uretypempin = false;
                          //   });
                          // }
                          if (umpin == false && uretypempin == false) {
                            registerData();
                          }
                        },
                        child: buildSignUpButton()),
                    const SizedBox(height: 60),
                    buildDividerOr(),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                'assets/images/img_12.png',
                height: 60,
                width: 60,
              ),
            ),
          ]),
          body: Stack(
            children: [
              Container(
                width: screenWidth,
                height: MediaQuery.of(context).size.height * .6,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Image.asset("assets/img_1.png", height: 200, width: 200),
                    const SizedBox(
                      child: Text(
                        'Set your MPIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    const Text(
                      'Set your 4 digits MPIN here...',
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
                top: 70,
                right: 0,
                child: Image.asset(
                  'assets/register_left_vector.png',
                  height: 80,
                  width: 50,
                ),
              ),
              Positioned(
                top: 220,
                left: 0,
                child: Image.asset(
                  'assets/img_12.png',
                  height: 90,
                  width: 50,
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
              "Submit",
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
        SizedBox(width: 60, child: Divider(height: 2)),
      ],
    );
  }

  Future<void> registerData() async {
    setState(() {
      isLoading = true;
    });

    final String apiUrl = '${const_data().Api_url}/set_mpin.php';
    final Map<String, String> headers = {
      'Authorization': 'yp7280uvfkvdirgjkpo',
    };

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Add headers to the request
      headers.forEach((key, value) {
        request.headers[key] = value;
      });

      // Add form fields to the request
      // request.fields['user_name'] = name.text;
      request.fields['mobile_number'] = widget.mobile; // Assuming it's a string
      request.fields['m_pin'] = mpin.text;
      request.fields['type'] = "update";

      var response = await request.send();

      // Read and print the response
      var responseString = await response.stream.bytesToString();
      print(responseString);

      final response_data = json.decode(responseString);

      if (response_data["message"] == "update unsuccessful") {
        //display_toast(response_data["error"]);
      } else {
        if (response.statusCode == 200) {
          Fluttertoast.showToast(msg: "Mpin set Successfully");
          // display_toast(response_data["message"]);
          // Successful registration
          print('Mpin set successful');
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("accountMpin", mpin.text);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Loader_screen(),
              ));
          // dashboard(),
        } else {
          // Handle errors
          print('Error during Mpin. Status code: ${response.statusCode}');
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
}
