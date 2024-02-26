import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: dashboard()));
}

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);
  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
            width: 186,
            height: 32,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),

          child: Center(child: Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Inter',
                color: Colors.black ,
                fontWeight: FontWeight.w600,
              )
          )),
        ),
      ),
    );
  }
}
