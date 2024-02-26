import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/model.dart';
import '../model/service.dart';
import '../widget/webview.dart';
import 'ipo_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Ipo_allotment_status extends StatefulWidget {
  @override
  State<Ipo_allotment_status> createState() => _Ipo_allotment_statusState();
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

class _Ipo_allotment_statusState extends State<Ipo_allotment_status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "IPO Allotment",
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
                Ipo(),
              ]),
        ],
      ),
    );
  }
}

class Ipo extends StatefulWidget {
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
            height: MediaQuery.of(context).size.height * .85,
            width: MediaQuery.of(context).size.width * 99,
            //  padding: EdgeInsets.symmetric(
            //      horizontal: (MediaQuery.of(context).size.width * .1) / 2,
            //  ),
            child:
            FutureBuilder<List<ipo_allotment>>(
              future: button_index == 0 ? ipo_allotment_service().getOpenIpo_allotments() : ipo_allotment_service().getUpcomingIpo_allotments(),
              builder: (context,snapshot){
               // print(snapshot.hasData);
                if(snapshot.connectionState == ConnectionState.waiting){
                  return  Center(
                    child: SpinKitFadingCube(
                      color: Colors.black,
                      size: 50.0,
                    ),
                  );
                }
                else if(!snapshot.hasData || snapshot.data!.length == 0){
                  return Center(child: Text("No ipos allotment found",style: TextStyle(fontSize: 18),));
                }
                else if(snapshot.hasData){
                  return  ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final List<ipo_allotment>? selectedList = snapshot.data;
                      return InkWell(
                        onTap: () {


//                          WebViewScreen(url: selectedList[index].allotmentLink,);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>   WebViewScreen(url: selectedList[index].allotmentLink,title: "${selectedList[index].name} Allotment",)));
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
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(1),
                                        width: 70,
                                        height: 70,
                                        child: Image.network(
                                            selectedList![index].image!),
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
                                                selectedList[index].name!,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Inter',
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  height: 0,
                                                ),
                                              ),
                                           /*   Text(
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
                                              ),*/
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
                if(!snapshot.hasData){
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
                        'Sorry ! No open IPOs. Please wait for upcoming IPOs to open.',
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
                return Container();
              },

            ),


            /* */
          ),
        ],
      ),
    );
  }
  _launchURL() async {
    const url = 'https://www.bseindia.com/investors/appli_check.aspx';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
