import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';


import '../widget/Const_data.dart';
import 'dashboard.dart';
class Loader_screen extends StatefulWidget {
  const Loader_screen({Key? key}) : super(key: key);

  @override
  State<Loader_screen> createState() => _Loader_screenState();
}

class _Loader_screenState extends State<Loader_screen> {
  bool loader = true;
  Navigate()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? banner_id = prefs.getString("banner_click_id")??"";
    String? id = prefs.getString("user_id")??"";

    var response = await http.get( Uri.parse("${const_data().Api_url}/check_ipo_status.php"),headers: {
    "Authorization":"yp7280uvfkvdirgjkpo"
    });
    List data = json.decode(response.body);
    print(data);
    var response_data = await http.get(Uri.parse("${const_data().Api_url}/grt_customer_review.php"),headers: {
      "Authorization":"yp7280uvfkvdirgjkpo"
    });


    print(response_data.body);
    Map<String,dynamic> banner_data = json.decode(response_data.body)[0];
    bool check_value = banner_id == id ? false : true;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>dashboard(ipo_detail:data,banner_data: banner_data,isbannerDisplay: check_value,)));

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Navigate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: CircularProgressIndicator(color: Colors.white,)),
    );
  }
}
