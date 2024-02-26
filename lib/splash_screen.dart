import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_market/authentication/signin.dart';
import 'package:stock_market/widget/Const_data.dart';

import 'authentication/mpin.dart'; // Import your dashboard screen

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: SplashScreen()));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _bounceTextAnimation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);

    _simulateLoading();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  void _simulateLoading() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? mpin = prefs.getString('accountMpin') ?? "";
    String? mobile = prefs.getString('accountMobile') ?? "";
    await Future.delayed(Duration(seconds: 5));

    // Verify user status via API
    bool isUserActive = await mobile_verify(mpin,mobile);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return isUserActive ? Enter_Mpin(mobile: mpin,) : signin();
      }),
    );
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      // User is exiting the app
      // Redirect to login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return signin();
        }),
      );
    }
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
            Center(
              child: FadeTransition(
                opacity: _animation,
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
            ),
            SizedBox(height: 15),
            FadeTransition(
              opacity: _animation,
              child: Text(
                "InvesCube",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }
}
