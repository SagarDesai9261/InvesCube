import 'package:flutter/material.dart';
import '../demo1.dart';

void main() {
  runApp(Live_Calls());
}

class Live_Calls extends StatefulWidget {
  @override
  State<Live_Calls> createState() => _Live_CallsState();
}

Widget commonText({
  String text = "",
  Color color = Colors.white,
  double fontSize = 12,
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

class _Live_CallsState extends State<Live_Calls> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Live Calls",
            style: TextStyle(color: Colors.white),
          ),
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
    return SingleChildScrollView(
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
                                button_index == 0 ? Colors.white : Colors.black),
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
                                button_index == 1 ? Colors.white : Colors.black),
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
            child: ListView.builder(
              itemCount: button_index == 0 ? dataList.length :closecalldata.length,
              itemBuilder: (context, index) {

                Datalist data = button_index == 0 ?  dataList[index] :closecalldata[index];
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height < 750
                          ? MediaQuery.of(context).size.height * 0.32
                          : MediaQuery.of(context).size.height * 0.29,
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
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.width * 0.14,
                            decoration: ShapeDecoration(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.only(topRight: Radius.circular(15)),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.title,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                MediaQuery.of(context).size.height > 750
                                                    ? 14
                                                    : 12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          data.date,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                MediaQuery.of(context).size.height > 750
                                                    ? 12
                                                    : 10,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0.34,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 1),
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
                                          fontSize: 16,
                                          color: Colors.green,
                                        ),
                                        children: [
                                          WidgetSpan(
                                            alignment: PlaceholderAlignment.middle,
                                            baseline: TextBaseline.ideographic,
                                            child: Padding(
                                              padding: EdgeInsets.only(right: 4.0),
                                              child: Image.asset(
                                                "assets/live_calls_arrow.png",
                                                width: 12,
                                                height: 12,
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Buy',
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
                              padding:
                                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
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
                                        child: commonText(text: data.target1),
                                      ),
                                      Container(
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
                                        child: commonText(text: data.value1),
                                      ),
                                      Container(
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
                                        child: Image.asset("assets/check.png",
                                            height: 30, width: 30),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
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
                                        child: commonText(text: data.target2),
                                      ),
                                      Container(
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
                                        child: commonText(text: data.value2),
                                      ),
                                      Container(
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
                                        child: Image.asset("assets/check.png",
                                            height: 30, width: 30),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
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
                                        child: commonText(text: data.stoploss),
                                      ),
                                      Container(
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
                                        child: commonText(text: data.stoplossValue),
                                      ),
                                      Container(
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
                                        child: Image.asset("assets/wrong.png",
                                            height: 20, width: 20),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  commonText(
                                    text: "Note : ${data.note}",
                                    color: Colors.black,
                                    fontSize: MediaQuery.of(context).size.height > 750
                                        ? 14
                                        : 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class Datalist {
  final String title;
  final String date;
  final String target1;
  final String value1;
  final String target2;
  final String value2;
  final String stoploss;
  final String stoplossValue;
  final String note;

  Datalist({
    required this.title,
    required this.date,
    required this.target1,
    required this.value1,
    required this.target2,
    required this.value2,
    required this.stoploss,
    required this.stoplossValue,
    required this.note,
  });
}

List<Datalist> dataList = [
  Datalist(
    title: "Tata Technologies 47000 CMP @ 1300 Rs.",
    date: "03-03-2023",
    target1: "Target 1",
    value1: "1350",
    target2: "Target 2",
    value2: "1400",
    stoploss: "Stoploss",
    stoplossValue: "1250",
    note: "Cash Weekly Positional",
  ),
  Datalist(
    title: "Tata Technologies 47000 CMP @ 1300 Rs.",
    date: "03-03-2023",
    target1: "Target 1",
    value1: "1350",
    target2: "Target 2",
    value2: "1400",
    stoploss: "Stoploss",
    stoplossValue: "1250",
    note: "Cash Weekly Positional",
  ),
  Datalist(
    title: "Tata Technologies 47000 CMP @ 1300 Rs.",
    date: "03-03-2023",
    target1: "Target 1",
    value1: "1350",
    target2: "Target 2",
    value2: "1400",
    stoploss: "Stoploss",
    stoplossValue: "1250",
    note: "Cash Weekly Positional",
  ),
  Datalist(
    title: "Tata Technologies 47000 CMP @ 1300 Rs.",
    date: "03-03-2023",
    target1: "Target 1",
    value1: "1350",
    target2: "Target 2",
    value2: "1400",
    stoploss: "Stoploss",
    stoplossValue: "1250",
    note: "Cash Weekly Positional",
  ),
  // Add more data items as needed
];

List<Datalist> closecalldata = [
  Datalist(
    title: "Tata Tech 47000 CMP @ 1300 Rs.",
    date: "03-03-2023",
    target1: "Target 1",
    value1: "1350",
    target2: "Target 2",
    value2: "1400",
    stoploss: "Stoploss",
    stoplossValue: "1250",
    note: "Cash Weekly Positional",
  ),
  Datalist(
    title: "Tata Tech 47000 CMP @ 1300 Rs.",
    date: "03-03-2023",
    target1: "Target 1",
    value1: "1350",
    target2: "Target 2",
    value2: "1400",
    stoploss: "Stoploss",
    stoplossValue: "1250",
    note: "Cash Weekly Positional",
  ),
  Datalist(
    title: "Tata Tech 47000 CMP @ 1300 Rs.",
    date: "03-03-2023",
    target1: "Target 1",
    value1: "1350",
    target2: "Target 2",
    value2: "1400",
    stoploss: "Stoploss",
    stoplossValue: "1250",
    note: "Cash Weekly Positional",
  ),
  Datalist(
    title: "Tata Tech 47000 CMP @ 1300 Rs.",
    date: "03-03-2023",
    target1: "Target 1",
    value1: "1350",
    target2: "Target 2",
    value2: "1400",
    stoploss: "Stoploss",
    stoplossValue: "1250",
    note: "Cash Weekly Positional",
  ),
  // Add more data items as needed
];


