import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:stock_market/demo1.dart';

import '../model/model.dart';
import '../model/service.dart';

class history_calls extends StatefulWidget {
  String type;
  int index;
  history_calls({ required this.type,required this.index});
  @override
  State<history_calls> createState() => _history_callsState();
}

Widget commonText({
  String text = "",
  Color color = Colors.white,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.bold,
  TextAlign textAlign = TextAlign.center,
}) {
  return Text(
    text ?? '', // Default to an empty string if text is null
    style: TextStyle(
      color: color ?? Colors.black, // Default to black if color is null
      fontSize:
      fontSize ?? 14.0, // Default to fontSize 14.0 if fontSize is null
      fontWeight: fontWeight ??
          FontWeight.normal, // Default to normal if fontWeight is null
    ),
    textAlign:
    textAlign ?? TextAlign.start, // Default to start if textAlign is null
  );
}

class _history_callsState extends State<history_calls> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "History Calls",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,

          //
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all(13),
              width: 30,
              height: 20,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
              child: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [
                    Colors.black.withOpacity(0.8999999761581421),
                    Colors.white.withOpacity(0)
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
              ),
            ),
            ListView(children: [
              LiveCalls(index: widget.index,type: widget.type,),
            ]),
          ],
        ),
      ),
    );
  }
}

class LiveCalls extends StatefulWidget {
  String? type;
  int? index;
  LiveCalls({this.type,this.index});
  @override
  State<LiveCalls> createState() => _LiveCallsState();
}

class _LiveCallsState extends State<LiveCalls> {
  int button_index = 0;
  @override
  Widget build(BuildContext context) {

    final h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // Container(
          //   width: MediaQuery.of(context).size.width * .9,
          //   height: 40,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(7),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black.withOpacity(0.2),
          //         spreadRadius: 2,
          //         blurRadius: 5,
          //         offset: Offset(0, 3),
          //       ),
          //     ],
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: InkWell(
          //           onTap: () {
          //             setState(() {
          //               button_index = 0;
          //             });
          //           },
          //           child: Container(
          //             height: 40,
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //                 color: button_index == 0 ? Colors.black : Colors.white,
          //                 borderRadius: button_index == 0
          //                     ? BorderRadius.only(
          //                     topLeft: Radius.circular(7),
          //                     topRight: Radius.circular(20),
          //                     bottomRight: Radius.circular(20),
          //                     bottomLeft: Radius.circular(7))
          //                     : BorderRadius.only(
          //                     topLeft: Radius.circular(7),
          //                     topRight: Radius.circular(0),
          //                     bottomRight: Radius.circular(0),
          //                     bottomLeft: Radius.circular(7))),
          //             child: Text(
          //               'Open Calls',
          //               style: TextStyle(
          //                   color:
          //                   button_index == 0 ? Colors.white : Colors.black),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: InkWell(
          //           onTap: () {
          //             setState(() {
          //               button_index = 1;
          //             });
          //           },
          //           child: Container(
          //             height: 40,
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //                 color: button_index == 1 ? Colors.black : Colors.white,
          //                 borderRadius: button_index == 1
          //                     ? BorderRadius.only(
          //                     topLeft: Radius.circular(20),
          //                     topRight: Radius.circular(7),
          //                     bottomRight: Radius.circular(7),
          //                     bottomLeft: Radius.circular(20))
          //                     : BorderRadius.only(
          //                     topLeft: Radius.circular(0),
          //                     topRight: Radius.circular(7),
          //                     bottomRight: Radius.circular(7),
          //                     bottomLeft: Radius.circular(0))),
          //             child: Text(
          //               'Close Calls',
          //               style: TextStyle(
          //                   color:
          //                   button_index == 1 ? Colors.white : Colors.black),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .87,
            width: MediaQuery.of(context).size.width * .9,
            child: FutureBuilder<List<DataList>>(
                future: widget.type =="intraday" ? IpoDetailsService().getHistoryData(1) : widget.type =="positional" ? IpoDetailsService().getHistoryData(2) :  widget.type =="short_term" ?  ApiService().getHistoryInvestmentData(11) :  widget.type =="med_term" ? ApiService().getHistoryInvestmentData(12) : ApiService().getHistoryInvestmentData(13),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SpinKitFadingCube(
                        color: Colors.black,
                        size: 50.0,
                      ),
                    );
                  }
                  if ( !snapshot.hasData) {
                    return Center(child: Text("No records found"));
                  }
                  print(snapshot.hasData);
                  if(snapshot.data!.isEmpty){
                    return Center(child: Text("No records found"));
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!
                        .length,
                    itemBuilder: (context, index) {
                      DataList data = snapshot.data![index];

                        return Stack(children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: MediaQuery.of(context).size.width > 800
                                    ? 400
                                    : 290,
                                // width: MediaQuery.of(context).size.width > 800 ? 300 : 260,

                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30)),
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
                                      height:
                                      MediaQuery.of(context).size.width > 800
                                          ? 100
                                          : 60,
                                      decoration: BoxDecoration(
                                        //   color: Colors.yellow,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(30),
                                          )),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 6,
                                            child:Column(
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                      800
                                                      ? 55
                                                      : 30,
                                                  // color: Colors.cyan,
                                                  child: Text(
                                                    data.name!,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Inter',
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    height: 1,
                                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                                    color:Colors.white
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: 5, left: 10),
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                      800
                                                      ? 45
                                                      : 20,

                                                  //  color: Colors.pink,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Text("Entry: ${data.entry}",style: TextStyle(
                                                        fontSize:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height >
                                                            750
                                                            ? 10
                                                            : 10,
                                                        color: Colors.white,
                                                        fontFamily: 'inter',
                                                        fontWeight: FontWeight.w600,
                                                        height: 1,
                                                      ),),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Container(
                                                          height: 12,
                                                          width: 2,
                                                          color:Colors.white
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Icon(
                                                        Icons.calendar_month,
                                                        size: 12,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 3,
                                                      ),
                                                      Text(
                                                        data.showDate!,
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          height: 1,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Icon(
                                                        Icons.timer,
                                                        size: 12,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 3,
                                                      ),
                                                      Text(
                                                        data.time!,
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          height: 1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .width >
                                                  800
                                                  ? 100
                                                  : 70,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  left: BorderSide(
                                                    color: Colors.white,
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: TextStyle(
                                                      color: data.type == "Sell"
                                                          ? Colors.red
                                                          : Colors.green,
                                                      fontSize: 16,
                                                      fontFamily: 'Inter',
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                    children: [
                                                      WidgetSpan(
                                                        alignment:
                                                        PlaceholderAlignment
                                                            .middle,
                                                        baseline: TextBaseline
                                                            .ideographic,
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                              right: 4.0),
                                                          child: Image.asset(
                                                            "assets/live_calls_arrow.png",
                                                            width: 12,
                                                            height: 12,
                                                          ),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '${data.type}',
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height:
                                      MediaQuery.of(context).size.width > 800
                                          ? 300
                                          : 230,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    .25,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .width >
                                                    800
                                                    ? 60
                                                    : 35,
                                                // color: Colors.green
                                                decoration: ShapeDecoration(
                                                  color: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                ),
                                                child: Center(
                                                  child: commonText(
                                                    text: "Target 1",
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    .25,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .width >
                                                    800
                                                    ? 60
                                                    : 35,
                                                //    color: Colors.green
                                                decoration: ShapeDecoration(
                                                  color: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                ),
                                                child: Center(
                                                  child: commonText(
                                                      text: data.target!),
                                                ),
                                              ),
                                              Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      .25,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                      800
                                                      ? 60
                                                      : 35,
                                                  //    color: Colors.green,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.black,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                  ),
                                                  child: Center(
                                                    child: data.targetStatus == "1"
                                                        ? Image.asset(
                                                        "assets/check.png",
                                                        height: 40,
                                                        width: 40)
                                                        : Icon(Icons.more_horiz,color: Colors.white,size: 30,)
                                                    /*Image.asset("assets/wrong.png",
                                              height: 20, width: 20 )*/,
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    .25,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .width >
                                                    800
                                                    ? 60
                                                    : 35,
                                                // color: Colors.green,
                                                decoration: ShapeDecoration(
                                                  color: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                ),
                                                child: Center(
                                                  child: commonText(
                                                      text: "Target 2"),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    .25,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .width >
                                                    800
                                                    ? 60
                                                    : 35,
                                                //    color: Colors.green,
                                                decoration: ShapeDecoration(
                                                  color: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                ),
                                                child: Center(
                                                  child: commonText(
                                                      text: data.target1!),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    .25,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .width >
                                                    800
                                                    ? 60
                                                    : 35,
                                                //  color: Colors.green,
                                                decoration: ShapeDecoration(
                                                  color: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                ),
                                                child: Center(
                                                  child: data.target1Status == "1"
                                                      ? Image.asset(
                                                      "assets/check.png",
                                                      height: 40,
                                                      width: 40)
                                                      : Icon(Icons.more_horiz,color: Colors.white,size: 30,)
                                                  /*Image.asset("assets/wrong.png",
                                              height: 20, width: 20 )*/,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    .25,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .width >
                                                    800
                                                    ? 60
                                                    : 35,
                                                // color: Colors.green
                                                decoration: ShapeDecoration(
                                                  color: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                ),
                                                child: Center(
                                                  child: commonText(
                                                    text: "Target 3",
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    .25,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .width >
                                                    800
                                                    ? 60
                                                    : 35,
                                                //    color: Colors.green
                                                decoration: ShapeDecoration(
                                                  color: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                ),
                                                child: Center(
                                                  child: commonText(
                                                      text: data.target2!),
                                                ),
                                              ),
                                              Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      .25,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                      800
                                                      ? 60
                                                      : 35,
                                                  //    color: Colors.green,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.black,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                  ),
                                                  child: Center(
                                                    child: data.target2Status == "1"
                                                        ? Image.asset(
                                                        "assets/check.png",
                                                        height: 40,
                                                        width: 40)
                                                        : Icon(Icons.more_horiz,color: Colors.white,size: 30,)
                                                    /*Image.asset("assets/wrong.png",
                                              height: 20, width: 20 )*/,
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    .25,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .width >
                                                    800
                                                    ? 60
                                                    : 35,
                                                // color: Colors.green,
                                                decoration: ShapeDecoration(
                                                  color: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                ),
                                                child: Center(
                                                  child: commonText(
                                                      text: "Stoploss"),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    .25,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .width >
                                                    800
                                                    ? 60
                                                    : 35,
                                                //   color: Colors.green,
                                                decoration: ShapeDecoration(
                                                  color: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                ),
                                                child: Center(
                                                  child: commonText(
                                                      text: data.stoploss!),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    .25,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .width >
                                                    800
                                                    ? 60
                                                    : 35,
                                                //    color: Colors.green,
                                                decoration: ShapeDecoration(
                                                  color: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                                ),
                                                child: Center(
                                                  child:
                                                  data.stoplessStatus == "1"
                                                      ? Image.asset(
                                                      "assets/check.png",
                                                      height: 40,
                                                      width: 40)
                                                      : Icon(Icons.more_horiz,color: Colors.white,size: 30,)
                                                  /*Image.asset("assets/wrong.png",
                                              height: 20, width: 20 )*/,
                                                ),
                                              ),
                                            ],
                                          ),

                                          commonText(
                                            text: "${data.des1}",
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: MediaQuery.of(context)
                                                .size
                                                .height >
                                                750
                                                ? 14
                                                : 12,
                                          ),
                                          // Container(
                                          //   width: MediaQuery.of(context).size.width * .4,
                                          //   height: MediaQuery.of(context).size.width > 800
                                          //       ? 50
                                          //       : 20,
                                          //   //color: Colors.teal,
                                          //
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          if (data.callstatus == "1")
                            Container(
                              //margin:EdgeInsets.only(bottom: ),
                              margin: EdgeInsets.only(left:12,right: 12,top: 5,bottom: 5),
                              //color:Colors.tealAccent,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(40),
                                ),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                  child: Container(
                                    margin: EdgeInsets.only(left:20),
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height:
                                    MediaQuery.of(context).size.width > 800 ? 400 : 275,
                                    color: Colors.transparent,
                                    child: Transform.rotate(
                                      angle: -.5, // 0.785 radians = 45 degrees
                                      child: Center(
                                        child: Text(
                                          'C l o s e d', // Text label
                                          style: TextStyle(
                                            fontSize: 60,
                                            color: Colors.red, // Text color
                                            fontWeight:
                                            FontWeight.w900, // Bold text
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ]);
                      return Container();
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
//
// Future<List<DataList>> fetchData0(int categoryId) async {
//   try {
//     final Uri uri = Uri.parse("${const_data().Api_url}/get_details.php");
//     final http.MultipartRequest request = http.MultipartRequest('POST', uri);
//     request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
//     request.fields['cat_id'] = categoryId.toString();
//
//     final http.Client client = http.Client();
//     final http.StreamedResponse streamedResponse = await client.send(request);
//     final http.Response response = await http.Response.fromStream(streamedResponse);
//
//     if (response.statusCode == 200) {
//       final List<dynamic> rawDataList = json.decode(response.body)['data'];
//       final List<DataList> shareDetailsList = rawDataList
//           .map((rawData) => DataList.fromJson(rawData))
//           .toList();
//       print(rawDataList);
//       return shareDetailsList;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   } catch (e) {
//     throw Exception('Error: $e');
//   }
// }
