import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stock_market/screens/intraday_history.dart';
import '../demo1.dart';
import '../model/model.dart';
import '../model/service.dart';
import 'history.dart';

void main() {
  runApp(Intraday_Live_Calls());
}

class Intraday_Live_Calls extends StatefulWidget {
  String? title ;
  int? call_index;
  Intraday_Live_Calls({this.title,this.call_index});
  @override
  State<Intraday_Live_Calls> createState() => _Intraday_Live_CallsState();
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

class _Intraday_Live_CallsState extends State<Intraday_Live_Calls> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Intraday Live Calls",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w800,
            ),
          ),
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Intraday_history()));
                },
                icon:Icon( Icons.history))
          ],
          centerTitle: true,
          backgroundColor: Colors.transparent, //
          leading: InkWell(
            onTap: (){
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
              widget.title != null ? LiveCalls(title: widget.title,call_index: widget.call_index,) : LiveCalls()
            ]),
          ],
        ),
      ),
    );
  }
}

class LiveCalls extends StatefulWidget {
  String? title;
  int? call_index;
  LiveCalls({this.title,this.call_index});
  @override
  State<LiveCalls> createState() => _LiveCallsState();
}

class _LiveCallsState extends State<LiveCalls> {
  int button_index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    button_index = (widget.call_index != null ? widget.call_index : 0)!;
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    print(h);
    return SwipeDetector(
      onSwipeLeft: () {
        // Handle swipe left action
        if(button_index == 0){
          setState(() {
            button_index = 1;
          });
        }
      },
      onSwipeRight: () {
        // Handle swipe right action
        if(button_index == 1){
          setState(() {
            button_index = 0;
          });
        }

      },
      child: SingleChildScrollView(
        child: Column(
          children:<Widget> [
            Container(
              width: MediaQuery.of(context).size.width * .9,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if(button_index == 1)
                        setState(() {
                          button_index = 0;
                        });
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: button_index == 0 ? Colors.black : Colors.white,
                            borderRadius: button_index == 0
                                ? BorderRadius.only(
                                topLeft: Radius.circular(7),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(7))
                                : BorderRadius.only(
                                topLeft: Radius.circular(7),
                                topRight: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                bottomLeft: Radius.circular(7))),
                        child: Text(
                          'Open Calls',
                          style: TextStyle(
                              color:
                              button_index == 0 ? Colors.white : Colors.black,
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if(button_index == 0)
                        setState(() {
                          button_index = 1;
                        });
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: button_index == 1 ? Colors.black : Colors.white,
                            borderRadius: button_index == 1
                                ? BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(7),
                                bottomRight: Radius.circular(7),
                                bottomLeft: Radius.circular(20))
                                : BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(7),
                                bottomRight: Radius.circular(7),
                                bottomLeft: Radius.circular(0))),
                        child: Text(
                          'Close Calls',
                          style: TextStyle(
                              color:
                              button_index == 1 ? Colors.white : Colors.black,
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .82,
              width: MediaQuery.of(context).size.width *.9,
              child: FutureBuilder<List<DataList>>(
                future: IpoDetailsService().getIpoDetails(),
                builder: (context,snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: SpinKitFadingCube(
                        color: Colors.black,
                        size: 50.0,
                      ),
                    );
                  }
                  if(!snapshot.hasData){
                    return Center(child: Text("No records found"));
                  }
                  print(snapshot.hasData);
                  List<DataList> filteredData = snapshot.data!
                      .where((data) => data.callstatus == button_index.toString())
                      .toList();

                  if (filteredData.isEmpty) {
                    return Center(child: Text("No records Found"));
                  }
                  return ListView.builder(
                    itemCount: filteredData.length,  // button_index == 0 ? dataList.length :closecalldata.length,
                    itemBuilder: (context, index) {
                      DataList data = filteredData[index];
                      print(data.target1Status);
                      print("hello ${data.target1Status}");
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
                                      color: data.id == widget.title ? Colors.red.withOpacity(.5) :Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius:data.id == widget.title ? 3 :0,
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
                                                        data.entry!.length > 10
                                                            ? 7
                                                            :  data.entry!.length > 7 ? 8 : MediaQuery.of(context).size.width > 320? 10 :8 ,
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
                                                          fontSize: MediaQuery.of(context).size.width > 320? 10 :8,
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
                                                          fontSize: MediaQuery.of(context).size.width > 320? 10 :8,
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
                                                      text: data.target!,fontSize: data.target!.length > 10 ? 8 :data.target!.length>8 ? 10:12,),
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
                                                      text: data.target1!,fontSize: data.target!.length > 10 ? 8 :data.target!.length>8 ? 10:12,),
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
                                                      text: data.target2!,fontSize: data.target!.length > 10 ? 8 :data.target!.length>8 ? 10:12,),
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
                                                      text: data.stoploss!,fontSize: data.target!.length > 10 ? 8 :data.target!.length>8 ? 10:12,),
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
                    },
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
class MyCustomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Replace this with your circular logo image
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
           // color: Colors.blue, // Change this to your desired background color
          ),
          child: Center(
            child: Image.asset(
              'assets/vector/logo.png', // Replace with the path to your image asset
              width: 100, // Adjust the width as needed
              height: 100, // Adjust the height as needed
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 20),
        // Circular loader with your logo animation
        /*CircularProgressIndicator(
          strokeWidth: 5,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),*/
      ],
    );
  }
}

class SwipeDetector extends StatelessWidget {
  final Widget child;
  final Function onSwipeLeft;
  final Function onSwipeRight;

  SwipeDetector({required this.child, required this.onSwipeLeft, required this.onSwipeRight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          // Swiped right
          onSwipeRight();
        } else if (details.primaryVelocity! < 0) {
          // Swiped left
          onSwipeLeft();
        }
      },
      child: child,
    );
  }
}
