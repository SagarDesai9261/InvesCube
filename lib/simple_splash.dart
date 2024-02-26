import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_market/authentication/signin.dart';


import 'authentication/mpin.dart'; // Import your dashboard screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    _simulateLoading();

  }

  void _simulateLoading() async {

    bool isSignedIn = await checkIfUserIsSignedIn();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Retrieve the user's authentication status from SharedPreferences
    // Replace 'isLoggedIn' with the key you used when saving the status
    String? mpin = prefs.getString('accountMpin') ?? "";

    await Future.delayed(Duration(seconds: 5));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return isSignedIn ? Enter_Mpin(mobile: mpin,) : signin();
      }),
    );
  }

  Future<bool> checkIfUserIsSignedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Retrieve the user's authentication status from SharedPreferences
    // Replace 'isLoggedIn' with the key you used when saving the status
    String? isLoggedIn = prefs.getString('accountMpin') ?? "";

    if(isLoggedIn!.isEmpty){
      return false;
    } else{
      return true;
    }
    // return isLoggedIn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
   // _controller.dispose();
    super.dispose();
  }
}
