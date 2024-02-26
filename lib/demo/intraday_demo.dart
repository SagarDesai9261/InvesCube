import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../model/model.dart';
import '../model/service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    // demoapp()
    DevicePreview(
      enabled: true,
      tools: [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => demoapp(),
    ),
  );
}

class Intraday_Live_Calls extends StatefulWidget {
  @override
  State<Intraday_Live_Calls> createState() => _Intraday_Live_CallsState();
}

Widget commonText({
  String text = "",
  Color color = Colors.white,
  double fontSize = 15,
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
          centerTitle: true,
          backgroundColor: Colors.transparent, //
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
              LiveCalls(),
            ]),
          ],
        ),
      ),
    );
  }
}

class LiveCalls extends StatefulWidget {
  @override
  State<LiveCalls> createState() => _LiveCallsState();
}

class _LiveCallsState extends State<LiveCalls> {
  int button_index = 0;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    print(h);
    return SwipeDetector(
      onSwipeLeft: () {
        // Handle swipe left action
        if (button_index == 0) {
          setState(() {
            button_index = 1;
          });
        }
      },
      onSwipeRight: () {
        // Handle swipe right action
        if (button_index == 1) {
          setState(() {
            button_index = 0;
          });
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                        setState(() {
                          button_index = 0;
                        });
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color:
                                button_index == 0 ? Colors.black : Colors.white,
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
                        setState(() {
                          button_index = 1;
                        });
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color:
                                button_index == 1 ? Colors.black : Colors.white,
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
              width: MediaQuery.of(context).size.width * .9,
              child: FutureBuilder<List<DataList>>(
                  future: IpoDetailsService().getIpoDetails(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: SpinKitFadingCube(
                          color: Colors.black,
                          size: 50.0,
                        ),
                      );
                    }

                    if (!snapshot.hasData) {
                      return Center(child: Text("No records found"));
                    }
                    print(snapshot.hasData);
                    List<DataList> filteredData = snapshot.data!
                        .where((data) =>
                            data.callstatus == button_index.toString())
                        .toList();

                    if (filteredData.isEmpty) {
                      return Center(child: Text("No records Found"));
                    }
                    return ListView.builder(
                      itemCount: filteredData
                          .length, // button_index == 0 ? dataList.length :closecalldata.length,
                      itemBuilder: (context, index) {
                        DataList data = filteredData[index];
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 220,
                              /* height: MediaQuery.of(context).size.height < 750
                                  ?MediaQuery.of(context).size.height < 718 ? MediaQuery.of(context).size.height * 0.33
                                  : MediaQuery.of(context).size.height * 0.30 : MediaQuery.of(context).size.height * .30,*/
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
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
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height: 60,
                                        // height: MediaQuery.of(context).size.width * 0.16,
                                        decoration: ShapeDecoration(
                                          color: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(15)),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      data.name!,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'Inter',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height >
                                                                750
                                                            ? 14
                                                            : 12,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons.calendar_month,
                                                          size: 10,
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
                                                            fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height >
                                                                    750
                                                                ? 12
                                                                : 10,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Icon(
                                                          Icons.timer,
                                                          size: 10,
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
                                                            fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height >
                                                                    750
                                                                ? 12
                                                                : 10,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 1),
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    left: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                child: Text.rich(
                                                  TextSpan(
                                                    style: TextStyle(
                                                      color: data.type == "Sell"
                                                          ? Colors.red
                                                          : Colors.green,
                                                      fontSize: 12,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width *
                                                        0.18, // Adjust the percentage as needed
                                                    height:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .height >
                                                                750
                                                            ? 30
                                                            : 30,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                    ),
                                                    child: commonText(
                                                        text: "Target 1"),
                                                  ),

                                                  /* Container(
                                                    alignment: Alignment.center,
                                                    width: MediaQuery.of(context).size.width *
                                                        0.25, // Adjust the percentage as needed
                                                    height: MediaQuery.of(context).size.height > 750
                                                        ? 35
                                                        : 25,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.black,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(2)),
                                                    ),
                                                    child: commonText(text: "Target 1",),
                                                  ),*/
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width *
                                                        0.25, // Adjust the percentage as needed
                                                    height:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .height >
                                                                750
                                                            ? 35
                                                            : 25,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2)),
                                                    ),
                                                    child: commonText(
                                                        text: data.target!),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width *
                                                        0.25, // Adjust the percentage as needed
                                                    height:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .height >
                                                                750
                                                            ? 35
                                                            : 25,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2)),
                                                    ),
                                                    child: data.targetStatus ==
                                                            "1"
                                                        ? Image.asset(
                                                            "assets/check.png",
                                                            height: 30,
                                                            width: 30)
                                                        : Image.asset(
                                                            "assets/wrong.png",
                                                            height: 20,
                                                            width: 20),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width *
                                                        0.25, // Adjust the percentage as needed
                                                    height:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .height >
                                                                750
                                                            ? 35
                                                            : 25,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2)),
                                                    ),
                                                    child: commonText(
                                                        text: "Target 2"),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width *
                                                        0.25, // Adjust the percentage as needed
                                                    height:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .height >
                                                                750
                                                            ? 35
                                                            : 25,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2)),
                                                    ),
                                                    child: commonText(
                                                        text: data.target1!),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width *
                                                        0.25, // Adjust the percentage as needed
                                                    height:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .height >
                                                                750
                                                            ? 35
                                                            : 25,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2)),
                                                    ),
                                                    child: data.target1Status ==
                                                            "1"
                                                        ? Image.asset(
                                                            "assets/check.png",
                                                            height: 30,
                                                            width: 30)
                                                        : Image.asset(
                                                            "assets/wrong.png",
                                                            height: 20,
                                                            width: 20),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Divider(
                                                color: Colors.grey,
                                                thickness: 1.0,
                                                indent: 0.0,
                                                endIndent: 0.0,
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width *
                                                        0.25, // Adjust the percentage as needed
                                                    height:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .height >
                                                                750
                                                            ? 35
                                                            : 25,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2)),
                                                    ),
                                                    child: commonText(
                                                        text: "Stoploss"),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width *
                                                        0.25, // Adjust the percentage as needed
                                                    height:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .height >
                                                                750
                                                            ? 35
                                                            : 25,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2)),
                                                    ),
                                                    child: commonText(
                                                        text: data.stoploss!),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width *
                                                        0.25, // Adjust the percentage as needed
                                                    height:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .height >
                                                                750
                                                            ? 35
                                                            : 25,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2)),
                                                    ),
                                                    child: data.stoplessStatus ==
                                                            "1"
                                                        ? Image.asset(
                                                            "assets/check.png",
                                                            height: 30,
                                                            width: 30)
                                                        : Image.asset(
                                                            "assets/wrong.png",
                                                            height: 20,
                                                            width: 20),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 8,
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (data.callstatus == "1")
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                      ),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 3, sigmaY: 3),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height <
                                                  750
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.33
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.30,
                                          color: Colors.transparent,
                                          child: Transform.rotate(
                                            angle:
                                                -.5, // 0.785 radians = 45 degrees
                                            child: Center(
                                              child: Text(
                                                'E x i t ', // Text label
                                                style: TextStyle(
                                                  fontSize: 40,
                                                  color:
                                                      Colors.red, // Text color
                                                  fontWeight: FontWeight
                                                      .bold, // Bold text
                                                ),
                                              ),
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
                            )
                          ],
                        );
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class SwipeDetector extends StatelessWidget {
  final Widget child;
  final Function onSwipeLeft;
  final Function onSwipeRight;

  SwipeDetector(
      {required this.child,
      required this.onSwipeLeft,
      required this.onSwipeRight});

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

class demoapp extends StatefulWidget {
  const demoapp({Key? key}) : super(key: key);

  @override
  State<demoapp> createState() => _demoappState();
}

class _demoappState extends State<demoapp> {
  int button_index = 0;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    print(h);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder<List<DataList>>(
            future: IpoDetailsService().getIpoDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SpinKitFadingCube(
                    color: Colors.black,
                    size: 50.0,
                  ),
                );
              }

              if (!snapshot.hasData) {
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
                itemCount: filteredData
                    .length, // button_index == 0 ? dataList.length :closecalldata.length,
                itemBuilder: (context, index) {
                  DataList data = filteredData[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    height: MediaQuery.of(context).size.width > 800 ? 400 : 260,
                    // width: MediaQuery.of(context).size.width > 800 ? 300 : 260,

                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width > 800
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
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 10),
                                      height:
                                          MediaQuery.of(context).size.width >
                                                  800
                                              ? 55
                                              : 30,
                                      // color: Colors.cyan,
                                      child: Text(
                                        data.name!,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      height:
                                          MediaQuery.of(context).size.width >
                                                  800
                                              ? 45
                                              : 20,
                                      //  color: Colors.pink,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
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
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              height: 1,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
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
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
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
                                  height:
                                      MediaQuery.of(context).size.width > 800
                                          ? 100
                                          : 70,
                                  margin: EdgeInsets.symmetric(vertical: 10),
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
                                                PlaceholderAlignment.middle,
                                            baseline: TextBaseline.ideographic,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 4.0),
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
                          height: MediaQuery.of(context).size.width > 800
                              ? 300
                              : 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .28,
                                    height:
                                        MediaQuery.of(context).size.width > 800
                                            ? 60
                                            : 35,
                                    // color: Colors.green
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    child: Center(
                                      child: commonText(
                                        text: "Target 1",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .28,
                                    height:
                                        MediaQuery.of(context).size.width > 800
                                            ? 60
                                            : 35,
                                    //    color: Colors.green
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                    child: Center(
                                      child: commonText(text: data.target!),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .28,
                                    height:
                                        MediaQuery.of(context).size.width > 800
                                            ? 60
                                            : 35,
                                    //    color: Colors.green,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                    child: data.targetStatus == "1"
                                        ? Image.asset("assets/check.png",
                                            height: 15, width: 15)
                                        : Image.asset("assets/wrong.png",
                                            height: 15, width: 15),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .28,
                                    height:
                                        MediaQuery.of(context).size.width > 800
                                            ? 60
                                            : 35,
                                    // color: Colors.green,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                    child: Center(
                                      child: commonText(text: "Target 2"),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .28,
                                    height:
                                        MediaQuery.of(context).size.width > 800
                                            ? 60
                                            : 35,
                                    //    color: Colors.green,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                    child: Center(
                                      child: commonText(text: data.target1!),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .28,
                                    height:
                                        MediaQuery.of(context).size.width > 800
                                            ? 60
                                            : 35,
                                    //  color: Colors.green,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                    child: data.target1Status == "1"
                                        ? Image.asset("assets/check.png",
                                            height: 15, width: 15)
                                        : Image.asset("assets/wrong.png",
                                            height: 15, width: 15),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .28,
                                    height:
                                        MediaQuery.of(context).size.width > 800
                                            ? 60
                                            : 35,
                                    // color: Colors.green,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                    child: Center(
                                      child: commonText(text: "Stoploss"),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .28,
                                    height:
                                        MediaQuery.of(context).size.width > 800
                                            ? 60
                                            : 35,
                                    //   color: Colors.green,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                    child: Center(
                                      child: commonText(text: data.stoploss!),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .28,
                                    height:
                                        MediaQuery.of(context).size.width > 800
                                            ? 60
                                            : 35,
                                    //    color: Colors.green,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                    child: data.stoplessStatus == "1"
                                        ? Image.asset("assets/check.png",
                                            height: 15, width: 15)
                                        : Image.asset(
                                            "assets/wrong.png",
                                            height: 15,
                                            width: 15,
                                          ),
                                  ),
                                ],
                              ),

                              commonText(
                                text: "${data.des1}",
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.height > 750
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
                  );
                },
              );
            }),
      ),
    );
  }
}
//
// Container(
// margin: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
// height: MediaQuery.of(context).size.height > 800 ? 400 : 260,
// // width: MediaQuery.of(context).size.width > 800 ? 300 : 260,
//
// decoration: BoxDecoration(
// color: Colors.grey,
// borderRadius: BorderRadius.only(topRight:Radius.circular(30),bottomLeft: Radius.circular(30) ),),
// child: Column(
// children: [
// Container(
// height:MediaQuery.of(context).size.width > 800 ? 100 : 70,
// decoration: BoxDecoration(
// color: Colors.yellow,
// borderRadius: BorderRadius.only(topRight:Radius.circular(30),)),
// child: Row(
// children: [
// Expanded(
// flex: 6,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// height: MediaQuery.of(context).size.width > 800 ? 55 : 40,
// color: Colors.cyan,
// // child: Text(
// //   "No records Found",
// //   overflow: TextOverflow.ellipsis,
// //   style: TextStyle(
// //     color: Colors.black,
// //     fontFamily: 'Inter',
// //     fontWeight: FontWeight.w600,
// //     fontSize:20,
// //   ),
// // ),
// ),
// Container(
// height: MediaQuery.of(context).size.width > 800 ? 45 : 30,
// color: Colors.pink,
// ),
// ],
// ),
// ),
// Expanded(
// flex: 2,
// child: Container(
// height: MediaQuery.of(context).size.width > 800 ? 100 : 70,
// color: Colors.brown,
// ))
// ],
// ),
// ),
// Container(
// height: MediaQuery.of(context).size.width > 800 ? 300 : 190,
// decoration: BoxDecoration(
// color: Colors.tealAccent,
// borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30) )),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Container(
// width: MediaQuery.of(context).size.width * .28,
// height:  MediaQuery.of(context).size.width > 800 ? 60 : 35,
// color:Colors.green
// ),
// Container(
// width: MediaQuery.of(context).size.width * .28,
// height: MediaQuery.of(context).size.width > 800 ? 60 : 35,
// color:Colors.green
// ),
// Container(
// width: MediaQuery.of(context).size.width * .28,
// height: MediaQuery.of(context).size.width > 800 ? 60 : 35,
// color:Colors.green
// ),
//
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Container(
// width: MediaQuery.of(context).size.width * .28,
// height: MediaQuery.of(context).size.width > 800 ? 60 : 35,
// color:Colors.green
// ),
// Container(
// width: MediaQuery.of(context).size.width * .28,
// height: MediaQuery.of(context).size.width > 800 ? 60 : 35,
// color:Colors.green
// ),
// Container(
// width: MediaQuery.of(context).size.width * .28,
// height: MediaQuery.of(context).size.width > 800 ? 60 : 35,
// color:Colors.green
// ),
//
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Container(
// width: MediaQuery.of(context).size.width * .28,
// height: MediaQuery.of(context).size.width > 800 ? 60 : 35,
// color:Colors.green
// ),
// Container(
// width: MediaQuery.of(context).size.width * .28,
// height: MediaQuery.of(context).size.width > 800 ? 60 : 35,
// color:Colors.green
// ),
// Container(
// width: MediaQuery.of(context).size.width * .28,
// height: MediaQuery.of(context).size.width > 800 ? 60 : 35,
// color:Colors.green
// ),
//
// ],
// ),
// Container(
// width: MediaQuery.of(context).size.width * .4,
// height: MediaQuery.of(context).size.width > 800 ? 50 : 20,
// color: Colors.teal,
// )
//
//
// ],
// ),
// )
//
// ],
// ),
// ),
