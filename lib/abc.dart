import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_market/authentication/mpin.dart';
import 'package:http/http.dart' as http;
import 'package:stock_market/simple_splash.dart';
import 'package:stock_market/widget/Const_data.dart';

import 'authentication/signin.dart';

class demo_app extends StatefulWidget {
  const demo_app({Key? key}) : super(key: key);

  @override
  State<demo_app> createState() => _demo_appState();
}

class _demo_appState extends State<demo_app> {
  String mpin_value = "";
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String,dynamic>>(
        future: _simulateLoading(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While the future is resolving, you can show a loading indicator or splash screen
      return   Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.white,
                    Colors.grey,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image(
                        image: AssetImage(
                          'assets/vector/logo.png',
                        ),
                        fit: BoxFit.fill,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "InvesCube",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 28,
                      color: Colors.black,
                      //fontWeight: FontWeight.w800,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ); // Show a splash screen while loading
          } else {
            if (snapshot.hasError) {
              // Handle error
              return Text('Error: ${snapshot.error}');
            } else {

              // Use the result of the future to decide which widget to show
              bool isMpinEmpty = bool.parse( snapshot.data!["isUserActive"].toString())  ?? true; // Default to true if data is null
              return isMpinEmpty ? Enter_Mpin(mobile:  snapshot.data!["mpin"]):signin();
            }
          }
        },
      ),
    );
  }

  Future<Map<String,dynamic>> _simulateLoading() async {
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? mpin = prefs.getString('accountMpin') ?? "";
    String? mobile = prefs.getString('accountMobile') ?? "";

    bool isUserActive = await mobile_verify(mpin,mobile);
    Map<String, dynamic> userData = {
      'mpin': mpin ?? "",
      'isUserActive': isUserActive ,
    };
    return userData;
  }
  Future<bool> mobile_verify(String? value,String mobile) async {
    if (value == null) return false; // No value to verify

    final String apiUrl = "${const_data().Api_url}/check_status.php";
    final Map<String, String> headers = {
      'Authorization': 'yp7280uvfkvdirgjkpo',
    };

    try {
      final response = await http.post(Uri.parse(apiUrl),
          body: {'mobile_number': mobile},
          headers: headers);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        print(data);
        if (data["message"] == "Mobile Number is Already Registered") {
          String message = data['message'];
          // Assuming your API returns a message indicating user's status
          return true; // Change condition as per your API response
        } else {
          print('Unexpected response format');
          return false;
        }
      } else {
        print('Failed to verify user status. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error verifying user status: $e');
      return false;
    }
  }

}
