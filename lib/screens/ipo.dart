import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../model/model.dart';
import '../model/service.dart';
import 'ipo_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Ipo_main extends StatefulWidget {
  String? title = "";
  Ipo_main({
    this.title});
  @override
  State<Ipo_main> createState() => _Ipo_mainState();
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

class _Ipo_mainState extends State<Ipo_main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "IPO",
          style: TextStyle(color: Colors.white,
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
          ListView(
              children: [
                Ipo(title: widget.title,),
              ]),
        ],
      ),
    );
  }
}

class Ipo extends StatefulWidget {
  String? title;
  Ipo({this.title});
  @override
  State<Ipo> createState() => _IpoState();
}

class _IpoState extends State<Ipo> {
  @override
  void initState() {
    super.initState();
    //   fetchData();
  }
  int button_index = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                        'Open IPOs',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                            color: button_index == 0
                                ? Colors.white
                                : Colors.black),
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
                      // width: MediaQuery.of(context).size.width,
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
                        'Upcoming IPOs',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            color: button_index == 1
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .85,
            width: MediaQuery.of(context).size.width * 99,
            //  padding: EdgeInsets.symmetric(
            //      horizontal: (MediaQuery.of(context).size.width * .1) / 2,
            //  ),
            child:
            FutureBuilder(
              future: button_index == 0 ? ipo_data().getOpenIpos() : ipo_data().getUpcomingIpos()  ,
              builder: (context,snapshot){
                print(snapshot.hasData);
                if(snapshot.connectionState == ConnectionState.waiting){
                  return  Center(
                    child: SpinKitFadingCube(
                      color: Colors.black,
                      size: 50.0,
                    ),
                  );
                }
                if(snapshot.data!.isEmpty){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/no_ipo.png",
                        height: 300,
                        width: 300,
                      ),
                      Text(
                        'Sorry ! No open IPOs.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                      Text(
                        ' Please wait for upcoming IPOs to open.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  );

                }
                else if(snapshot.hasData){
                  return  ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final List<IPO>? selectedList = snapshot.data;
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Ipo_Detail(id: selectedList[index].id,)));
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 20.0),
                              child: Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: selectedList![index].id == widget.title
                                              ? Colors.red.withOpacity(.5)
                                              : Color(0x3F000000),
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                          spreadRadius: selectedList![index].id == widget.title ? 3 : 0,
                                        ),]),

                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(1),
                                        width: 70,
                                        height: 70,
                                        child: Image.network(
                                            selectedList![index].image),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                selectedList[index].name,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Inter',
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  height: 0,
                                                ),
                                              ),
                                              Text(
                                                selectedList[index].openDate,
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  fontSize: 12,
                                                  fontFamily: 'Inter',
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  height: 0,
                                                ),
                                              ),
                                            ]
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      );
                    },
                  );
                }

                return Container();
              },

            ),


            /* */
          ),
        ],
      ),
    );
  }

}
