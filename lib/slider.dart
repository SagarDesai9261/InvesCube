import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Datalist {
  // Replace with your data model
  String title;
  String date;
  String target1;
  String value1;
  String target2;
  String target3;
  String value2;
  String value3;
  String stoploss;
  String stoplossValue;
  String note;

  Datalist({
    required this.title,
    required this.date,
    required this.target1,
    required this.value1,
    required this.target2,
    required this.value2,
    required this.target3,
    required this.value3,
    required this.stoploss,
    required this.stoplossValue,
    required this.note,
  });
}

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  int button_index = 0; // Replace with your logic for button_index

  List<Datalist> dataList = [
    // Replace with your data
    Datalist(
      title: "Tata Technologies 47000 CMP @ 1300 Rs.",
      date: "03-03-2023",
      target1: "Target 1",
      value1: "1350",
      target2: "Target 2",
      value2: "1400",
      target3: "Target 3",
      value3: "1450",
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
      target3: "Target 3",
      value3: "1450",
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
      target3: "Target 3",
      value3: "1450",
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
      target3: "Target 3",
      value3: "1450",
      stoploss: "Stoploss",
      stoplossValue: "1250",
      note: "Cash Weekly Positional",
    ),
    // Add more data items as needed
  ];

  List<Datalist> closecalldata = [
    // Replace with your data
    Datalist(
      title: 'Item 1 (Close)',
      date: '2023-01-02',
      target1: 'Target 1B',
      value1: 'Value 1B',
      target2: 'Target 2B',
      value2: 'Value 2B',
      target3: "Target 3",
      value3: "1450",
      stoploss: 'Stoploss B',
      stoplossValue: 'Stoploss Value B',
      note: 'Note B',
    ),
    // Add more data items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Title'),
      ),
      body: Container(
         //color: Colors.green,
        child: CarouselSlider.builder(
          itemCount: button_index == 0 ? dataList.length : closecalldata.length,
          options: CarouselOptions(
            //height: MediaQuery.of(context).size.height * 0.82,
            aspectRatio: 16 / 9,
           // viewportFraction: 0.9,
         //   enableInfiniteScroll: false,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              // Handle page change if needed
            },
          ),
          itemBuilder: (context, index, realIndex) {
            Datalist data =
            button_index == 0 ? dataList[index] : closecalldata[index];
            return Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height < 750
                      ? MediaQuery.of(context).size.height * 0.25
                      : MediaQuery.of(context).size.height * 0.27,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
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
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.width * 0.06,
                        decoration: ShapeDecoration(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                          ),
                        ),
                        child: Center(child: Text("Recent Intraday Calls",style: TextStyle(color: Colors.white,fontSize: 10),))

                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
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

                                        color: Colors.black,
                                        fontSize:
                                        MediaQuery.of(context).size.height > 750
                                            ? 8
                                            : 8,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      data.date,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                        MediaQuery.of(context).size.height > 750
                                            ? 8
                                            : 8,
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
                                      fontSize: 8,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width *
                                        0.13, // Adjust the percentage as needed
                                    height: MediaQuery.of(context).size.height > 750
                                        ? 35
                                        : 15,
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
                                        0.13, // Adjust the percentage as needed
                                    height: MediaQuery.of(context).size.height > 750
                                        ? 35
                                        : 15,
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
                                        0.13, // Adjust the percentage as needed
                                    height: MediaQuery.of(context).size.height > 750
                                        ? 35
                                        : 15,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2)),
                                    ),
                                    child: commonText(text: data.target3),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width *
                                        0.13, // Adjust the percentage as needed
                                    height: MediaQuery.of(context).size.height > 750
                                        ? 35
                                        : 15,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2)),
                                    ),
                                    child: commonText(text: data.stoploss)
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
                                        0.13, // Adjust the percentage as needed
                                    height: MediaQuery.of(context).size.height > 750
                                        ? 35
                                        : 15,
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
                                        0.13, // Adjust the percentage as needed
                                    height: MediaQuery.of(context).size.height > 750
                                        ? 35
                                        : 15,
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
                                        0.13, // Adjust the percentage as needed
                                    height: MediaQuery.of(context).size.height > 750
                                        ? 35
                                        : 15,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2)),
                                    ),
                                    child: commonText(text: data.value3),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width *
                                        0.13, // Adjust the percentage as needed
                                    height: MediaQuery.of(context).size.height > 750
                                        ? 35
                                        : 15,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2)),
                                    ),
                                    child: commonText(text: data.stoplossValue),
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
                                        0.13, // Adjust the percentage as needed
                                    height: MediaQuery.of(context).size.height > 750
                                        ? 35
                                        : 15,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2)),
                                    ),
                                    child:Image.asset("assets/check.png",
                                        height: 20, width: 20),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width *
                                        0.13, // Adjust the percentage as needed
                                    height: MediaQuery.of(context).size.height > 750
                                        ? 35
                                        : 15,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2)),
                                    ),
                                    child: Image.asset("assets/check.png",
                                        height: 20, width: 20),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width *
                                        0.13, // Adjust the percentage as needed
                                    height: MediaQuery.of(context).size.height > 750
                                        ? 35
                                        : 15,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2)),
                                    ),
                                    child: Image.asset("assets/check.png",
                                        height: 20, width: 20),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width *
                                        0.13, // Adjust the percentage as needed
                                    height: MediaQuery.of(context).size.height > 750
                                        ? 35
                                        : 15,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2)),
                                    ),
                                    child: Image.asset("assets/wrong.png",
                                        height: 13, width: 13),
                                  ),
                                ],
                              ),
                              /*SizedBox(
                                height: 1,
                              ),
                              Divider(
                                color: Colors.grey,
                                thickness: 1.0,
                                indent: 0.0,
                                endIndent: 0.0,
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width *
                                        0.13, // Adjust the percentage as needed
                                    height: MediaQuery.of(context).size.height > 750
                                        ? 35
                                        : 20,
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
                                        0.13, // Adjust the percentage as needed
                                    height: MediaQuery.of(context).size.height > 750
                                        ? 35
                                        : 20,
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
                                        0.13, // Adjust the percentage as needed
                                    height: MediaQuery.of(context).size.height > 750
                                        ? 35
                                        : 20,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2)),
                                    ),
                                    child: Image.asset("assets/wrong.png",
                                        height: 20, width: 20),
                                  ),
                                ],
                              ),*/
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: commonText(
                                  text: "Note : ${data.note}",
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height > 750
                                      ? 14
                                      : 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}
Widget commonText({
  String text = "",
  Color color = Colors.white,
  double fontSize = 8,
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

void main() {
  runApp(MaterialApp(
    home: YourWidget(),
  ));
}
