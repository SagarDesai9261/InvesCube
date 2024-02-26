import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_market/authentication/signin.dart';

import '../widget/Const_data.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Logout_screen()));
}

class Logout_screen extends StatefulWidget {
  const Logout_screen({super.key});

  @override
  State<Logout_screen> createState() => _Logout_screenState();
}

class _Logout_screenState extends State<Logout_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: 430,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(25, 25, 25, 1),
              Color.fromRGBO(98, 98, 98, .7),
              Color.fromRGBO(25, 25, 25, 1),
            ],
          ),
        ),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment(0.00, 1.00),
        //     end: Alignment(0, -1),
        //     colors: [Colors.white, Colors.black],
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // width: 300,
              width: 300,
              height: 300,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.30000001192092896),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 373,
                    height: 100,
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Center(
                        child: Image.asset(
                      'assets/images/img_21.png',
                      height: 40,
                      width: 40,
                    )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Are you sure ? ",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Do you want to logout...',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.07,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          //Navigator.of(context).pop();
                        },
                        child: Text(
                          'No',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String mobile = prefs.getString("accountMobile")!;
                          final Uri uri = Uri.parse(
                              "${const_data().Api_url}/logout_token_remove.php");
                          final http.MultipartRequest request =
                              http.MultipartRequest('POST', uri);
                          request.headers
                              .addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
                          request.fields['mobile_number'] = mobile.toString();
                          final http.Client client = http.Client();
                          final http.StreamedResponse streamedResponse =
                              await client.send(request);
                          final http.Response response =
                              await http.Response.fromStream(streamedResponse);
                          print(response.body);
                          List<String> keysToExclude = [
                            'banner_click_id',
                          ]; // Add keys you want to keep here
                          Set<String> keys = prefs.getKeys();
                          for (String key in keys) {
                            if (!keysToExclude.contains(key)) {
                              await prefs.remove(key);
                            }
                          }

                          prefs.clear();

                          print(prefs.getKeys());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signin()));
                        },
                        child: Container(
                          width: 81,
                          height: 32,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
