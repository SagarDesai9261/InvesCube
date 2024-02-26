import 'package:flutter/material.dart';
import 'package:stock_market/screens/what_is_bse.dart';
import 'package:stock_market/screens/what_is_stock_market.dart';
import 'package:stock_market/screens/who_is_stock_king_of_india.dart';

import '../model/model.dart';
import '../model/service.dart';
import 'basic_ knowledge.dart';
import 'basic_education_details.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: basic_education(),
    ),
  );
}

class  basic_education extends StatefulWidget {
  const basic_education({super.key});

  @override
  State<basic_education> createState() => _MyAppState();
}

class _MyAppState extends State<basic_education> {
  List<Map<String, dynamic>> yourData = [
    {"title": "What is stock market ?", "imagePath": 'assets/dashboard/img123.png'},
    {"title": "What is BSE ?", "imagePath": 'assets/dashboard/image102.png'},
    // Add more data as needed
  ];
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: Container(
            margin: EdgeInsets.all(13),
            width: 30,
            height: 20,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
                child: Icon(Icons.arrow_back_outlined)),
          ),
          title: Container(
            margin: EdgeInsets.only(left: 40),
            child: Text(
              'Basic Educations',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
                height: 1,
              ),
            ),
          ),
        ),
        body:

      /*  SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(41, 41, 41, .9),
                      Color.fromRGBO(
                        92,
                        92,
                        92,
                        .9,
                      ),
                      Color.fromRGBO(73, 73, 73, .2),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    // SizedBox(height: 10,),

                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(101, 101, 101, 1),
                            Color.fromRGBO(118, 118, 118, .6),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // SizedBox(height: 10,),
                          Container(
                            height: 130,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            // color: Colors.green,
                            child: Column(
                              children: [
                                Container(
                                  height: 27,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "What is stock market ?",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  child: Image.asset(
                                    'assets/dashboard/img123.png',
                                    fit: BoxFit.cover,
                                    height: 103,
                                    width: 150,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> what_is_bsc(),));
                            },
                            child: Container(
                              height: 130,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              // color: Colors.green,
                              child: Column(
                                children: [
                                  Container(
                                    height: 27,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "What is BSE ?",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    child: Image.asset(
                                      "assets/dashboard/image102.png",
                                      fit: BoxFit.cover,
                                      height: 103,
                                      width: 150,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(111, 111, 111, 1),
                            Color.fromRGBO(120, 120, 120, .6),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // SizedBox(height: 10,),
                          Container(
                            height: 130,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            // color: Colors.green,
                            child: Column(
                              children: [
                                Container(
                                  height: 27,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Center(
                                    child: Text("What is NSE",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  child: Image.asset(
                                    "assets/dashboard/image103.png",
                                    fit: BoxFit.cover,
                                    height: 103,
                                    width: 150,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 130,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            // color: Colors.green,
                            child: Column(
                              children: [
                                Container(
                                  height: 27,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Center(child:Text("What is IPO ?",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ), ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  child: Image.asset(
                                    "assets/dashboard/image104.png",
                                    fit: BoxFit.cover,
                                    height: 103,
                                    width: 150,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(133, 133, 133, 1),
                            Color.fromRGBO(145, 145, 145, .6),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // SizedBox(height: 10,),
                          Container(
                            height: 130,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            // color: Colors.green,
                            child: Column(
                              children: [
                                Container(
                                  height: 27,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Center(child: Text("Difference : NSE & BSE",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  child: Image.asset(
                                    "assets/dashboard/image105.png",
                                    fit: BoxFit.cover,
                                    height: 103,
                                    width: 150,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> who_is_stock_king_of_india(),));
                            },
                            child: Container(
                              height: 130,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              // color: Colors.green,
                              child: Column(
                                children: [
                                  Container(
                                    height: 27,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    child: Center(child:
                                    Text("Who is stock king of India ? ",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    child: Image.asset(
                                      "assets/dashboard/image106.png",
                                      fit: BoxFit.cover,
                                      height: 103,
                                      width: 150,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(156, 156, 156, 1),
                            Color.fromRGBO(169, 169, 169, .6),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // SizedBox(height: 10,),
                          Container(
                            height: 130,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            // color: Colors.green,
                            child: Column(
                              children: [
                                Container(
                                  height: 27,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Center(child: Text
                                    ("Bull market vs Bear market",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  child: Image.asset(
                                    "assets/dashboard/image107.png",
                                    fit: BoxFit.cover,
                                    height: 103,
                                    width: 150,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 130,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            // color: Colors.green,
                            child: Column(
                              children: [
                                Container(
                                  height: 27,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Center(child: Text("Trading vs Demat Account",style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),)),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  child: Image.asset(
                                    "assets/dashboard/image108.png",
                                    fit: BoxFit.cover,
                                    height: 103,
                                    width: 150,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>basic_Knowledge(),));
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(182, 182, 182, 1),
                              Color.fromRGBO(197, 197, 197, .6),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 20,),
                            Container(
                              height: 130,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              // color: Colors.green,
                              child: Column(
                                children: [
                                  Container(
                                    height: 27,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    child: Center(child: Text
                                      ("Basic Knowledge",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    child: Image.asset(
                                      "assets/dashboard/image109.png",
                                      fit: BoxFit.cover,
                                      height: 103,
                                      width: 150,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 38,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),*/
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(41, 41, 41, .9),
                    Color.fromRGBO(
                      92,
                      92,
                      92,
                      .9,
                    ),
                    Color.fromRGBO(73, 73, 73, .2),
                  ],
                ),
              ),
            ),
            FutureBuilder<List<Basic_Education>>(
                future: Basic_Education_Service().fetchStockItems(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState ==  ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());

                  }
                  if(snapshot.data!.isEmpty){
                    return Center(child: Text("No Data Found"));
                  }
                  return Basic_Education_display(yourData: snapshot.data,);
                }
            ),
          ],
        ),
      );
  }
}

class Basic_Education_display extends StatelessWidget {
  List<Basic_Education>? yourData = [];

  Basic_Education_display({required this.yourData});


  @override
  Widget build(BuildContext context) {


    List<Widget> rows = [];

    for (int i = 0; i < yourData!.length; i += 2) {
      Widget firstItem = InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Basic_Education_Details(basic_education: yourData![i],)));
          },
          child: buildItem(yourData![i]));
      Widget secondItem = i + 1 < yourData!.length ? InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Basic_Education_Details(basic_education: yourData![i +1],)));
          },
          child: buildItem(yourData![i + 1])) : SizedBox(
        width: 150,
      );

      rows.add(
        Column(
          children: [
            Container(
              height: 150 ,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(101, 101, 101, 1),
                    Color.fromRGBO(118, 118, 118, .6),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                children: [
                  firstItem,
                  secondItem,
                ],
              ),
            ),
            SizedBox(height:20,)
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: rows,
      ),
    );
  }

  Widget buildItem(Basic_Education data) {
    return Container(
      height: 130,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
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
            height: 27,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                data.name,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            child: Image.network(
              data.image,
              fit: BoxFit.cover,
              height: 103,
              width: 150,
            ),
          ),
        ],
      ),
    );
  }
}
