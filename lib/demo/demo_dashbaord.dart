import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:stock_market/screens/basic_education.dart';
import 'package:stock_market/screens/drawer.dart';
import 'package:stock_market/screens/positional.dart';
import 'package:stock_market/screens/short_term.dart';

import '../ad_helper.dart';
import '../model/model.dart';
import '../model/providers.dart';
import '../model/service.dart';
import '../screens/carousel_slider.dart';
import '../screens/holidays.dart';
import '../screens/intraday.dart';
import '../screens/ipo.dart';
import '../screens/long_term.dart';
import '../screens/medium_term.dart';

void main() {
  runApp(dashboard());
}


class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];
  BannerAd? _bannerAd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print("error $err");
          ad.dispose();
        },
      ),
    ).load();
  }
  final form_key = GlobalKey<FormState>();
  final List<Map<String, dynamic>> dataList = [
    {
      "name": "Tata Technologies 47000 CMP @ 1300 Rs.",
      "date": "03-03-2023",
      "time": "02.53 pm",
      "target_1": "1350",
      "target_2": "1450",
      "target_3": "1550",
      "stopless": "1200",
      "target1_symbol": Icons.check_circle,
      "target2_symbol": Icons.check_circle,
      "target3_symbol": Icons.check_circle,
      "stopless_symbol": Icons.cancel,
    },
    {
      "name": "Technologies 47000 CMP @ 1300 Rs.",
      "date": "03-03-2023",
      "time": "02.53 pm",
      "target_1": "1350",
      "target_2": "1450",
      "target_3": "1550",
      "stopless": "1200",
      "target1_symbol": Icons.check_circle,
      "target2_symbol": Icons.check_circle,
      "target3_symbol": Icons.check_circle,
      "stopless_symbol": Icons.cancel,
    },
    {
      "name": "Tata 47000 CMP @ 1300 Rs.",
      "date": "03-03-2023",
      "time": "02.53 pm",
      "target_1": "1350",
      "target_2": "1450",
      "target_3": "1550",
      "stopless": "1200",
      "target1_symbol": Icons.check_circle,
      "target2_symbol": Icons.check_circle,
      "target3_symbol": Icons.check_circle,
      "stopless_symbol": Icons.cancel,
    },
    // Add more data as needed
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    print(h);
    print(w);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          //1.77
          // backgroundColor: Colors.grey,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Container(
              width: 186,
              height: 32,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
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
              child: Center(
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
            actions: [
              Icon(Icons.notifications_active),
              Icon(Icons.notifications_active,color: Colors.black, size: 10,)
            ],
          ),
          drawer: MyDrawer(),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 430,
                          height: 230,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(158, 158, 158, .5),
                                Color.fromRGBO(108, 108, 108, 1)
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: true,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: w > 400 ? EdgeInsets.all(10) : null,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(7),
                                      height: 38,
                                      width: 38,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(7)
                                        // image: DecorationImage(
                                        //   image:  AssetImage("assets/dashboard/calender.png",),
                                        // ),
                                      ),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/dashboard/calender.png'),
                                        height: 22,
                                        width: 22,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 38,
                                      width: w * .8,
                                      padding: EdgeInsets.only(top: 10, left: 10),
                                      decoration: ShapeDecoration(
                                        color: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(7),
                                        ),
                                      ),
                                      child: Text(
                                        "Today's Live Calls...",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: w > 400 ? EdgeInsets.all(10) : null,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Intraday_Live_Calls()));
                                      },
                                      child: Container(
                                        height: 38,
                                        width: w * .43,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          //color: Colors.white10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
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
                                        child: Center(
                                          child: Text(
                                            'Intraday',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>positional_live_calls()));
                                      },
                                      child: Container(
                                        height: 38,
                                        width: w * .43,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          // color: Colors.white10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
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
                                        child: Center(
                                          child: Text(
                                            'Positional',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
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
                              // CarouselSlider(
                              //   options: CarouselOptions(
                              //     height: 131,
                              //     aspectRatio: 16 / 12,
                              //     viewportFraction: 0.57,
                              //     initialPage: 0,
                              //     //enableInfiniteScroll: true,
                              //     reverse: false,
                              //     // autoPlay: true,
                              //     autoPlayInterval: Duration(seconds: 2),
                              //     autoPlayAnimationDuration:
                              //         Duration(milliseconds: 800),
                              //     autoPlayCurve: Curves.fastOutSlowIn,
                              //     enlargeCenterPage: true,
                              //     scrollDirection: Axis.horizontal,
                              //   ),
                              //   items: containers,
                              // ),
                              FutureBuilder<List<DataList>>(
                                future: ApiService().fetchData(1), // Replace 1 with the actual category ID
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return Center(child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return Center(child: Text('Error: ${snapshot.error}'));
                                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                    return Center(child: Text('No data available'));
                                  } else {
                                    List<DataList> dataList = snapshot.data!;
                                    return CarouselSliderWidget(dataList: dataList);
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Color.fromRGBO(133, 133, 133, 1),
                      height: 8,
                    ),
                    Stack(
                      children: [
                        Container(
                            width: 430,
                            height: 120,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(138, 138, 138, .7),
                                    Color.fromRGBO(87, 87, 87, 1),
                                  ],
                                ))),
                        Visibility(
                          visible: true,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: w > 400 ? EdgeInsets.all(10) : null,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(7),
                                      height: 38,
                                      width: 38,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(7)
                                        // image: DecorationImage(
                                        //   image:  AssetImage("assets/dashboard/calender.png",),
                                        // ),
                                      ),
                                      child: Image(
                                        image: AssetImage('assets/dashboard/home.png'),
                                        height: 22,
                                        width: 22,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 38,
                                      width: w * .8,
                                      padding: EdgeInsets.only(top: 10, left: 10),
                                      decoration: ShapeDecoration(
                                        color: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(7),
                                        ),
                                      ),
                                      child: Text(
                                        'Delivery Calls...',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Container(
                                padding: w > 400 ? EdgeInsets.all(10) : null,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>short_term_live_calls()));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(top: 2),
                                        width: w * .27,
                                        height: 38,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
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
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            // SizedBox(
                                            //   height: 3,
                                            // ),
                                            Text(
                                              "Short Terms",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Inter',

                                              ),
                                            ),
                                            Text(
                                              " Quarterly",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 22,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>mid_term_live_calls()));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(top: 2),
                                        width: w * .27,
                                        height: 38,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(6)),
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
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            // SizedBox(
                                            //   height: 5,
                                            // ),
                                            Text(
                                              "Mid Terms",
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              " Yearly",
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>long_term_live_calls()));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(top: 2),
                                        width: w * .27,
                                        height: 38,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(6)),
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
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            // SizedBox(
                                            //   height: 5,
                                            // ),
                                            Text(
                                              "Long Terms",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "Above Year",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Color.fromRGBO(133, 133, 133, .7),
                      height: 8,
                    ),
                    Stack(
                      children: [
                        Container(
                            width: 430,
                            height: 60,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(158, 158, 158, .5),
                                    Color.fromRGBO(108, 108, 108, 1)
                                  ],
                                ))),
                        Visibility(
                          visible: true,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: w > 400 ? EdgeInsets.all(10) : null,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  height: 38,
                                  width: 38,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                          spreadRadius: 0,
                                        ),
                                      ]
                                    // image: DecorationImage(
                                    //   image:  AssetImage("assets/dashboard/calender.png",),
                                    // ),
                                  ),
                                  child: Image(
                                    image: AssetImage('assets/dashboard/ipo.png'),
                                    height: 22,
                                    width: 22,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.topCenter,
                                  height: 38,
                                  width: w * .8,
                                  padding: EdgeInsets.only(top: 6, left: 10,right: 9),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
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
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 0),
                                        child: Text(
                                          'IPO Allotment Status......',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w700,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(bottom: 8,right: 10),
                                        //                           color: Colors.red,
                                        //  padding: EdgeInsets.only(bottom: 14, right: 10),
                                        child: Icon(
                                          Icons.arrow_forward_rounded,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Color.fromRGBO(133, 133, 133, .7),
                      height: 8,
                    ),
                    Stack(
                      children: [
                        Container(
                            width: 430,
                            height: 60,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(158, 158, 158, .5),
                                    Color.fromRGBO(108, 108, 108, 1)
                                  ],
                                ))),
                        Visibility(
                          visible: true,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: w > 400 ? EdgeInsets.all(10) : null,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  height: 38,
                                  width: 38,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                          spreadRadius: 0,
                                        ),
                                      ]
                                    // image: DecorationImage(
                                    //   image:  AssetImage("assets/dashboard/calender.png",),
                                    // ),
                                  ),
                                  child: Image(
                                    image: AssetImage('assets/dashboard/search.png'),
                                    height: 22,
                                    width: 22,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Ipo_main()));
                                  },
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    height: 38,
                                    width: w * .8,
                                    padding: EdgeInsets.only(top: 6, left: 10,right: 9),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
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
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 0),
                                          child: Text(
                                            'IPO (Initial Public Offering)...',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          //                           color: Colors.red,
                                          // padding:
                                          //     EdgeInsets.only(bottom: 14, right: 10),
                                          child: Icon(
                                            Icons.arrow_forward_rounded,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Color.fromRGBO(133, 133, 133, .7),
                      height: 8,
                    ),
                    Stack(
                      children: [
                        Container(
                            width: 430,
                            height: 60,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(158, 158, 158, .5),
                                    Color.fromRGBO(108, 108, 108, 1)
                                  ],
                                ))),
                        Visibility(
                          visible: true,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: w > 400 ? EdgeInsets.all(10) : null,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  height: 38,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      ),
                                    ],
                                    // image: DecorationImage(
                                    //   image:  AssetImage("assets/dashboard/calender.png",),
                                    // ),
                                  ),
                                  child: Image(
                                    image: AssetImage('assets/dashboard/img_1.png'),
                                    height: 22,
                                    width: 22,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>holidays()));
                                  },
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    height: 38,
                                    width: w * .8,
                                    padding: EdgeInsets.only(top: 6, left: 10,right: 9),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
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
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 0),
                                          child: Text(
                                            "Yearly Holiday's...",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          //                           color: Colors.red,
                                          // padding:
                                          //     EdgeInsets.only(bottom: 14, right: 10),
                                          child: Icon(
                                            Icons.arrow_forward_rounded,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Color.fromRGBO(133, 133, 133, .7),
                      height: 8,
                    ),
                    Stack(
                      children: [
                        Container(
                            width: 430,
                            height: 60,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(158, 158, 158, .5),
                                    Color.fromRGBO(108, 108, 108, 1)
                                  ],
                                ))),
                        Visibility(
                          visible: true,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: w > 400 ? EdgeInsets.all(10) : null,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  height: 38,
                                  width: 38,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                          spreadRadius: 0,
                                        ),
                                      ]
                                    // image: DecorationImage(
                                    //   image:  AssetImage("assets/dashboard/calender.png",),
                                    // ),
                                  ),
                                  child: Image(
                                    image: AssetImage('assets/dashboard/img_2.png'),
                                    height: 22,
                                    width: 22,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> basic_education()));
                                  },
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    height: 38,
                                    width: w * .8,
                                    padding: EdgeInsets.only(top: 6, left: 10,right: 9),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
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
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 0),
                                          child: Text(
                                            'Basic Education...',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          //                           color: Colors.red,
                                          // padding:
                                          //     EdgeInsets.only(bottom: 14, right: 10),
                                          child: Icon(
                                            Icons.arrow_forward_rounded,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Color.fromRGBO(133, 133, 133, .7),
                      height: 8,
                    ),
                    Stack(
                      children: [
                        Container(
                            width: 430,
                            height: 60,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(158, 158, 158, .5),
                                    Color.fromRGBO(108, 108, 108, 1)
                                  ],
                                ))),
                        Visibility(
                          visible: true,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: w > 400 ? EdgeInsets.all(10) : null,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  height: 38,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: Image(
                                    image: AssetImage('assets/dashboard/call.png'),
                                    height: 22,
                                    width: 22,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: w * .32,
                                  height: 38,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                          spreadRadius: 0,
                                        ),
                                      ]),
                                  child: Center(
                                    child: Text(
                                      "Contact Us...",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 11,
                                ),
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(7),
                                    height: 38,
                                    width: 38,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(7),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Image(
                                      image: AssetImage('assets/dashboard/feedback.png'),
                                      height: 22,
                                      width: 22,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: (){
                                    _handleFABPressed();
                                  },
                                  child: Container(
                                    width: w *.32,
                                    height: 38,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          ),
                                        ]),
                                    child: Center(
                                      child: Text(
                                        "Feedback...",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Color.fromRGBO(133, 133, 133, .7),
                      height: 8,
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(color: Colors.green,width: 300,height: 20,))
            ],
          ),

        ),
      ),
    );
  }
  void _handleFABPressed() {
    bool isLoading = Provider.of<FeedbackProvider>(context,listen:false).loading;
    double star = 0.0;
    TextEditingController message = TextEditingController();
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 450,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(50.0),
                topRight: const Radius.circular(50.0),
              ),
            ),
            child:
            Form(
              key: form_key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      width: 60,
                      height: 5,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'Write a feedback here...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'How would you rate this application ?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0.11,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RatingBar.builder(
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          //allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 35,
                          unratedColor: Colors.white,

                          itemBuilder: (context, _) {
                            return Icon(
                              Icons.star,
                              color: Colors.amber,
                            );
                          },
                          onRatingUpdate: (rating) {
                            star = rating;
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Write a feedback here... ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0.11,
                                ),
                              ),
                              TextSpan(
                                text: '(Optional)',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0.19,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value){
                            if(value!.length<100){
                              return "Please enter minimum 100 characters";
                            }
                            return null;
                          },
                          // controller: _text,

                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "Share your feel good experience with this application...",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,

                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 16), // Adjust padding as needed
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          'Write minimum 100 characters...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0.28,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Center(
                          child: InkWell(
                            onTap: ()async{

                              if(form_key.currentState!.validate()){
                                print(star);
                                print(message.text);
                           //     Provider.of<FeedbackProvider>(context, listen: false).submitFeedback(context,star,message.text);
                                if(isLoading==false){
                                  Navigator.pop(context);
                                  _handlesubmitPressed();
                                }
                              }

                            },
                            child: Container(
                              width: 95,
                              height: 38,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                              ),
                              child:isLoading ==false?  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Submit"),
                                  Icon(Icons.arrow_forward)
                                ],
                              ):Container(
                                padding: EdgeInsets.all(5),
                                child: Center(child: CircularProgressIndicator(),
                                ),),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
  void _handlesubmitPressed() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 400,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(50.0),
                topRight: const Radius.circular(50.0),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: 60,
                    height: 5,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset("assets/img_3.png",height: 180,width: 100,),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Thank You !',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 250,
                    child: Text(
                      'Thank you for your valuable feedback for our application !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 159,
                    height: 38,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Go to dashboard',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                )

              ],

            ),
          );
        });
  }
  buildContainerContent(Map<String, dynamic> dataList) {
    return Container(
      height: 109,
      width: 193,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 210,
              height: 17.938201904296875,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.only(left: 60, top: 3),
                child: Text("Recent Intraday Calls",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
            // SizedBox(height: 5,),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 4),
                      child: Container(
                        child: Text(dataList["name"] ?? "",
                            style: TextStyle(
                              fontSize: 6,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18, bottom: 2),
                      child: Row(children: [
                        Stack(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                            ),
                            Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                child: Icon(
                                  Icons.calendar_month,
                                  color: Colors.black,
                                  size: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Text(dataList["date"] ?? "",
                              style: TextStyle(
                                fontSize: 6,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                            ),
                            Center(
                              child: Container(
                                width: 12,
                                height: 12,
                                child: Icon(
                                  Icons.watch_later,
                                  color: Colors.black,
                                  size: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Text(dataList["time"] ?? "",
                              style: TextStyle(
                                fontSize: 6,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ]),
                    ),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 0.5224719047546387,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                ),
                SizedBox(
                  width: 6,
                ),
                Stack(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                    ),
                    Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        child: Image(
                          image: AssetImage('assets/dashboard/img_4.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 6),
                Text(
                  "Buy",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 8,
            // ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Container(
                    width: 40,
                    height: 12.539325714111328,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.black),
                    child: Center(
                        child: Text(
                          "Target 1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 7,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  width: 40,
                  height: 12.539325714111328,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.black),
                  child: Center(
                      child: Text(
                        "Target 2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                        ),
                      )),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  width: 40,
                  height: 12.539325714111328,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.black),
                  child: Center(
                      child: Text(
                        "Target 3",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                        ),
                      )),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  width: 40,
                  height: 12.539325714111328,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.black),
                  child: Center(
                    child: Text(
                      "Stopless",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 7,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 5,
            ),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Container(
                    width: 40,
                    height: 12.539325714111328,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.black),
                    child: Center(
                        child: Text(
                          dataList["target_1"] ?? "",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 7,
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  width: 40,
                  height: 12.539325714111328,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.black),
                  child: Center(
                      child: Text(
                        dataList["target_2"] ?? "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                        ),
                      )),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  width: 40,
                  height: 12.539325714111328,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.black),
                  child: Center(
                      child: Text(
                        dataList["target_3"] ?? "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                        ),
                      )),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  width: 40,
                  height: 12.539325714111328,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.black),
                  child: Center(
                      child: Text(
                        dataList["stopless"] ?? "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Container(
                    width: 40,
                    height: 12.539325714111328,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.black),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 10,
                    ),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  width: 40,
                  height: 12.539325714111328,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.black),
                  child: Icon(
                    dataList["target1_symbol"],
                    color: Colors.green,
                    size: 10,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  width: 40,
                  height: 12.539325714111328,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.black),
                  child: Icon(
                    dataList["target1_symbol"],
                    color: Colors.green,
                    size: 10,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  width: 40,
                  height: 12.539325714111328,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.black),
                  child: Icon(
                    dataList["stopless_symbol"],
                    color: Colors.red,
                    size: 10,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text("Note : Only for educational purpose...",
                style: TextStyle(
                  fontSize: 5,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
      ),
    );
  }
}
