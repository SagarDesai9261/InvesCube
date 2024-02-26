import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:stock_market/screens/longterm_history.dart';
import '../model/providers.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Longterm_data(),
      )
    ],
    child: MaterialApp(
      home: long_term_live_calls(),
    ),
  ));
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

class long_term_live_calls extends StatefulWidget {
  String? title;
  long_term_live_calls({this.title});
  @override
  _long_term_live_callsState createState() => _long_term_live_callsState();
}

class _long_term_live_callsState extends State<long_term_live_calls> {
  late ScrollController _scrollController;
  late Longterm_data _apiService;

  @override
  void initState() {
    super.initState();
    _apiService = Provider.of<Longterm_data>(context, listen: false);
    _apiService.fetchData(); // Initially fetch data
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _apiService.dataList.clear();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (_apiService.hasMore)
        _apiService.loadMoreData(); // Load more data when scrolled to bottom
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Short Terms Calls",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.89), //
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Longterm_history(title:"")));
              },
              icon:Icon( Icons.history,color:Colors.white))
        ],
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
                borderRadius: BorderRadius.circular(4),
              ),
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
          ChangeNotifierProvider.value(
            value: _apiService,
            child: Consumer<Longterm_data>(
              builder: (context, apiService, _) {
                final dataList = apiService.dataList;
                if(_apiService.isLoading){
                  return Center(
                    child: SpinKitFadingCube(
                      color: Colors.black,
                      size: 50.0,
                    ),
                  );
                }

                if(dataList.length == 0){
                  return Center(child: Text("No Records Found"));
                }
                return Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width *.9,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: dataList.length + 1, // Add 1 for loading indicator
                      itemBuilder: (context, index) {

                        if (index < dataList.length) {
                          final data = dataList[index];
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
                                        color: data.id == widget.title
                                            ? Colors.red.withOpacity(.5)
                                            : Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        spreadRadius: data.id == widget.title ? 3 : 0,
                                      ),
                                    ],
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
                                                      height: 1,
                                                      margin: EdgeInsets.symmetric(
                                                          horizontal: 10),
                                                      color: Colors.white),
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
                                                        Text(
                                                          "Entry: ${data.entry}",
                                                          style: TextStyle(
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
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                            height: 12,
                                                            width: 2,
                                                            color: Colors.white),
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
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                            fontFamily: 'Poppins',
                                                            fontWeight: FontWeight.w600,
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
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
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
                                                MediaQuery.of(context).size.width >
                                                    800
                                                    ? 100
                                                    : 70,
                                                margin:
                                                EdgeInsets.symmetric(vertical: 10),
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
                                                          baseline:
                                                          TextBaseline.ideographic,
                                                          child: Padding(
                                                            padding: EdgeInsets.only(
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
                                        height: MediaQuery.of(context).size.width > 800
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
                                                        BorderRadius.circular(5)),
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
                                                        BorderRadius.circular(5)),
                                                  ),
                                                  child: Center(
                                                    child: commonText(
                                                      text: data.target!,
                                                      fontSize: data.target!.length > 10
                                                          ? 8
                                                          : data.target!.length > 8
                                                          ? 10
                                                          : 12,
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
                                                    //    color: Colors.green,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.black,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(5)),
                                                    ),
                                                    child: Center(
                                                      child: data.targetStatus == "1"
                                                          ? Image.asset(
                                                          "assets/check.png",
                                                          height: 40,
                                                          width: 40)
                                                          : Icon(
                                                        Icons.more_horiz,
                                                        color: Colors.white,
                                                        size: 30,
                                                      )
                                                      /*Image.asset("assets/wrong.png",
                                                      height: 20, width: 20 )*/
                                                      ,
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
                                                        BorderRadius.circular(5)),
                                                  ),
                                                  child: Center(
                                                    child: commonText(text: "Target 2"),
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
                                                        BorderRadius.circular(5)),
                                                  ),
                                                  child: Center(
                                                    child: commonText(
                                                      text: data.target1!,
                                                      fontSize: data.target!.length > 10
                                                          ? 8
                                                          : data.target!.length > 8
                                                          ? 10
                                                          : 12,
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
                                                  //  color: Colors.green,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.black,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(5)),
                                                  ),
                                                  child: Center(
                                                    child: data.target1Status == "1"
                                                        ? Image.asset(
                                                        "assets/check.png",
                                                        height: 40,
                                                        width: 40)
                                                        : Icon(
                                                      Icons.more_horiz,
                                                      color: Colors.white,
                                                      size: 30,
                                                    )
                                                    /*Image.asset("assets/wrong.png",
                                                      height: 20, width: 20 )*/
                                                    ,
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
                                                        BorderRadius.circular(5)),
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
                                                        BorderRadius.circular(5)),
                                                  ),
                                                  child: Center(
                                                    child: commonText(
                                                      text: data.target2!,
                                                      fontSize: data.target!.length > 10
                                                          ? 8
                                                          : data.target!.length > 8
                                                          ? 10
                                                          : 12,
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
                                                    //    color: Colors.green,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.black,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(5)),
                                                    ),
                                                    child: Center(
                                                      child: data.target2Status == "1"
                                                          ? Image.asset(
                                                          "assets/check.png",
                                                          height: 40,
                                                          width: 40)
                                                          : Icon(
                                                        Icons.more_horiz,
                                                        color: Colors.white,
                                                        size: 30,
                                                      )
                                                      /*Image.asset("assets/wrong.png",
                                                      height: 20, width: 20 )*/
                                                      ,
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
                                                        BorderRadius.circular(5)),
                                                  ),
                                                  child: Center(
                                                    child: commonText(text: "Stoploss"),
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
                                                        BorderRadius.circular(5)),
                                                  ),
                                                  child: Center(
                                                    child: commonText(
                                                      text: data.stoploss!,
                                                      fontSize: data.target!.length > 10
                                                          ? 8
                                                          : data.target!.length > 8
                                                          ? 10
                                                          : 12,
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
                                                  //    color: Colors.green,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.black,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(5)),
                                                  ),
                                                  child: Center(
                                                    child: data.stoplessStatus == "1"
                                                        ? Image.asset(
                                                        "assets/check.png",
                                                        height: 40,
                                                        width: 40)
                                                        : Icon(
                                                      Icons.more_horiz,
                                                      color: Colors.white,
                                                      size: 30,
                                                    )
                                                    /*Image.asset("assets/wrong.png",
                                                      height: 20, width: 20 )*/
                                                    ,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            commonText(
                                              text: "${data.des1}",
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                              MediaQuery.of(context).size.height >
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
                                margin: EdgeInsets.only(
                                    left: 12, right: 12, top: 5, bottom: 5),
                                //color:Colors.tealAccent,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(40),
                                  ),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                                    child: Container(
                                      margin: EdgeInsets.only(left: 20),
                                      width: MediaQuery.of(context).size.width * 0.8,
                                      height: MediaQuery.of(context).size.width > 800
                                          ? 400
                                          : 275,
                                      color: Colors.transparent,
                                      child: Transform.rotate(
                                        angle: -.5, // 0.785 radians = 45 degrees
                                        child: Center(
                                          child: Text(
                                            'C l o s e d', // Text label
                                            style: TextStyle(
                                              fontSize: 60,
                                              color: Colors.red, // Text color
                                              fontWeight: FontWeight.w900, // Bold text
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ]);
                        } else {
                          return _buildLoadingIndicator();
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Provider.of<Longterm_data>(context).hasMore
            ? CircularProgressIndicator(color: Colors.black,)
            : Container(),
      ),
    );
  }
}
