import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stock_market/screens/dashboard.dart';

import '../screens/loader.dart';
import 'forgetMpin.dart';


void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: Enter_Mpin(mobile: '1234',)
    ),
  );
}

class Enter_Mpin extends StatefulWidget {
  String mobile;

  Enter_Mpin({Key? key,required this.mobile}) : super(key: key);

  @override
  State<Enter_Mpin> createState() => _Enter_MpinState();
}

class _Enter_MpinState extends State<Enter_Mpin> {
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
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     encode_email = obscureEmail(widget.email);
  //   });
  // }

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  bool allfield = false;
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(

        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
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
                   SizedBox(height: 30),
                  Image.asset("assets/images/img_27.png", height: 200, width: 200),
                  const SizedBox(
                    child: Text(
                      'Enter your MPIN',
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
                  // if(encode_email.length > 15)
                  Column(
                    children: [

                      Text( 'Access your account with your 4 digits MPIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,

                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Text(
                      //   '${encode_email}',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 14,
                      //     fontFamily: 'Inter',
                      //     fontWeight: FontWeight.w400,
                      //     height: 0,
                      //   ),
                      //   overflow: TextOverflow.ellipsis,
                      // ),

                    ],
                  ),
                  // if(encode_email.length < 15)
                  //   Text(
                  //     'Enter the OTP sent to ${encode_email} ',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 14,
                  //       fontFamily: 'Inter',
                  //       fontWeight: FontWeight.w400,
                  //       height: 0,
                  //
                  //     ),
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                ],
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: InkWell(
                onTap: () {
                  SystemNavigator.pop();
                  //Navigator.pop(context);
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
              top: MediaQuery.of(context).size.height * .3,
              left: 0,
              child: Image.asset('assets/images/img_29.png',height: 90,width: 50,),
            ),
            Positioned(
              top: 90,
              right: 0,
              child: Image.asset('assets/images/img_28.png',height: 90,width: 50,),
            ),
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
            child:  FractionallySizedBox(
              widthFactor: 1,
              child:  Form(
                key: formKey,
                child:  Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 80,),
                    Container(
                      height: 70,
                      width: 280,
                      //padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .2),
                      child: PinCodeTextField(
                        //errorTextDirection: TextDirec,
                        errorTextMargin: EdgeInsets.only(left: 5),
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          //color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        ),
                        length: 4,
                        obscureText: true,
                        onCompleted: (pin) {
                          debugPrint('onCompleted: $pin');
                          setState(() {
                            allfield = true;
                          });
                          if(pin == widget.mobile){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Loader_screen()));
                          }
                        },
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if(allfield != true){
                            return null;
                          }
                          else if (v != widget.mobile) {
                            return "Mpin is Invalid";
                          } else {
                            return null;
                          }

                        },
                        pinTheme: PinTheme(
                          errorBorderColor: Colors.red,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            fieldHeight: 50,
                            fieldWidth: 50,
                            activeFillColor: Colors.white,
                            inactiveColor: Colors.white,
                            selectedColor: Colors.white,
                            disabledColor: Colors.white,
                            selectedFillColor: Colors.white,
                            inactiveFillColor: Colors.white
                        ),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 3,
                          )
                        ],
                        // onCompleted: (v) {
                        //   debugPrint("Completed");
                        // },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                          });
                          if(allfield == true){
                            setState(() {
                              allfield = false;
                            });
                          }
                        },

                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },

                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Forgot ",style: TextStyle(fontSize: 16),),
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>forget_password()));
                            },
                            child: Text("Mpin?",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))
                      ],
                    )
                  ],
                ),

              ),
            ),
          ),
        ),

      ),
    );
  }
}
//
// class PinputExample extends StatefulWidget {
//   String otp;
//   String email;
//   PinputExample({Key? key,required this.otp,required this.email}) : super(key: key);
//
//   @override
//   State<PinputExample> createState() => _PinputExampleState();
// }
//
// class _PinputExampleState extends State<PinputExample> {
//   final pinController = TextEditingController();
//
//   final focusNode = FocusNode();
//   final formKey = GlobalKey<FormState>();
//   bool allfield = false;
//   bool isResendEnabled = false;
//   late Timer resendTimer;
//   int secondsRemaining = 60;
//
//   @override
//   void initState() {
//     super.initState();
//     startResendTimer();
//   }
//
//   void startResendTimer() {
//     resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (secondsRemaining > 0) {
//         setState(() {
//           secondsRemaining--;
//         });
//       } else {
//         timer.cancel();
//         setState(() {
//           isResendEnabled = true;
//         });
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     pinController.dispose();
//     focusNode.dispose();
//     resendTimer.cancel();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     const focusedBorderColor = Colors.black;
//     const fillColor = Color.fromRGBO(243, 246, 249, 0);
//     const borderColor = Colors.grey;
//
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: const TextStyle(
//         fontSize: 22,
//         color: Color.fromRGBO(30, 60, 87, 1),
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: borderColor),
//       ),
//     );
//     return Form(
//       key: formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Pinput(
//             controller:pinController,
//             androidSmsAutofillMethod:
//             AndroidSmsAutofillMethod.smsUserConsentApi,
//             listenForMultipleSmsOnAndroid: true,
//             defaultPinTheme: defaultPinTheme,
//             separatorBuilder: (index) => const SizedBox(width: 8),
//             hapticFeedbackType: HapticFeedbackType.lightImpact,
//             onCompleted: (pin) {
//               debugPrint('onCompleted: $pin');
//               setState(() {
//                 allfield = true;
//               });
//             },
//             validator: (s) {
//               return s == widget.otp ? null : 'OTP is incorrect';
//             },
//             onChanged: (value) {
//               if(allfield == true){
//                 setState(() {
//                   allfield = false;
//                 });
//               }
//               debugPrint('onChanged: $value');
//             },
//
//             focusedPinTheme: defaultPinTheme.copyWith(
//               decoration: defaultPinTheme.decoration!.copyWith(
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: focusedBorderColor),
//               ),
//             ),
//             submittedPinTheme: defaultPinTheme.copyWith(
//               decoration: defaultPinTheme.decoration!.copyWith(
//                 color: fillColor,
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: focusedBorderColor),
//               ),
//             ),
//             errorPinTheme: defaultPinTheme.copyBorderWith(
//               border: Border.all(color: Colors.redAccent),
//             ),
//           ),
//           SizedBox(height: 20,),
//           // if (!isResendEnabled)
//           //   Text(
//           //     'Resend OTP in ${_formatDuration(Duration(seconds: secondsRemaining))}',
//           //     style: TextStyle(
//           //       color: Colors.grey,
//           //     ),
//           //   ),
//           // SizedBox(
//           //   height: 20,
//           // ),
//           // InkWell(
//           //   onTap: (){
//           //     if(allfield && pinController.text == widget.otp){
//           //       Navigator.push(context, MaterialPageRoute(
//           //           builder: (context)=>reset_password(email:widget.email)));
//           //     }
//           //     else{
//           //       Fluttertoast.showToast(msg: "Otp is not matched");
//           //     }
//           //   },
//           //   child: Container(
//           //     width: MediaQuery.of(context).size.width * .6,
//           //     height: 38,
//           //     alignment: Alignment.center,
//           //     decoration: ShapeDecoration(
//           //       color: Colors.black.withOpacity(0.10000000149011612),
//           //       shape: RoundedRectangleBorder(
//           //           borderRadius: BorderRadius.circular(6)),
//           //     ),
//           //     child: Text("Verify Now",style: TextStyle(color: allfield ? Colors.black :Colors.white),),
//           //   ),
//           // ),
//
//           // SizedBox(
//           //   height: 20,
//           // ),
// //           InkWell(
// //               onTap: () {
// //
// //                 if(secondsRemaining == 0){
// //                   sendOtp();
// //                   setState(() {
// //                     isResendEnabled = false;
// //                     secondsRemaining = 60;
// //                     startResendTimer();
// //                   });
// //
// // //                  Fluttertoast.showToast(msg: "New Otp send");
// //                 }
// //                 else{
// //                   Fluttertoast.showToast(msg: "Otp Already send");
// //                 }
// //               },
// //               child: const Text.rich(
// //                 TextSpan(
// //                   children: [
// //                     TextSpan(
// //                       text: 'Didn’t you receive OTP ? ',
// //                       style: TextStyle(
// //                         color: Color(0xFF787878),
// //                         fontSize: 14,
// //                         fontFamily: 'Inter',
// //                         fontWeight: FontWeight.w500,
// //                         height: 0,
// //                       ),
// //                     ),
// //                     TextSpan(
// //                       text: 'Resend OTP',
// //                       style: TextStyle(
// //                         color: Colors.black,
// //                         fontSize: 14,
// //                         fontFamily: 'Inter',
// //                         fontWeight: FontWeight.w700,
// //                         decoration: TextDecoration.underline,
// //                         height: 0,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               )),
//           Text.rich(
//             TextSpan(
//               children: [
//                 TextSpan(
//                   text: 'Forgot ',
//                   style: TextStyle(
//                     color: Color(0xFF787878),
//                     fontSize: 14,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w500,
//                     height: 0,
//                   ),
//                 ),
//                 TextSpan(
//                   text: 'MPIN',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w600,
//                     height: 0,
//                   ),
//                 ),
//                 TextSpan(
//                   text: ' ?',
//                   style: TextStyle(
//                     color: Color(0xFF787878),
//                     fontSize: 14,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w500,
//                     height: 0,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           SizedBox(
//             height: 50,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> sendOtp() async {
//
//
//     final String apiUrl = "${Api().apiUrl}/forget_password.php";
//     final Map<String, String> headers = {
//       'Authorization': 'yp7280uvfkvdirgjkpo',
//       //'Content-Type': 'application/json',
//     };
//     final response = await http.post(
//         Uri.parse(apiUrl),
//         body: {
//           //'mobile_number': mobile_number.text,
//           'email': widget.email,
//         },
//         headers: headers
//     );
//
//     if (response.statusCode == 200) {
//       // Parse the response JSON
//       Map<String, dynamic> data = json.decode(response.body);
//
//       // Check if the request was successful
//       if (data['success'] == '1') {
//         // Get the OTP from the response
//         // String otp = data['Otp'];
//
//         setState(() {
//           print("Otp is ${data['Otp']}");
//           var Otp = data['Otp'].toString();
//           widget.otp = Otp;
//           display_toast("Otp Sent in Email");
//           //send_otp = true;
//         });
//
//         // Show a success message or perform further actions
//         //print('Email OTP sent successfully: $otp');
//       } else {
//         // Handle error case
//         print('Failed to send OTP. Error: ${data['message']}');
//       }
//     } else {
//       // Handle non-200 status code
//       print('Failed to send OTP. Status code: ${response.statusCode}');
//     }
//
//   }
//   String _formatDuration(Duration duration) {
//     return DateFormat('mm:ss')
//         .format(DateTime(0, 0, 0, 0, 0, duration.inSeconds));
//   }
//   display_toast(String message) {
//     Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }
//
// }





