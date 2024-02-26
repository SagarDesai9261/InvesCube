import 'dart:async';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_market/screens/short_term.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Notification.dart';
import '../ad_helper.dart';
import '../model/model.dart';
import '../model/providers.dart';
import '../model/service.dart';
import '../screens/Ipo_allotment_status.dart';
import '../screens/drawer.dart';
import '../screens/intraday.dart';
import '../screens/ipo.dart';
import '../screens/long_term.dart';
import '../screens/medium_term.dart';
import '../screens/positional.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CarouselIndexProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        ),
        home: dashboard(),
      )));
}

class dashboard extends StatefulWidget {
  List? ipo_detail;
  Map<String, dynamic>? banner_data;
  bool? isbannerDisplay;
  dashboard({Key? key, this.ipo_detail, this.banner_data,this.isbannerDisplay}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
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

class _dashboardState extends State<dashboard> {
  BannerAd? _bannerAd;
  bool banner = true;
  late Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      // Fetch notifications every 60 seconds
      int pastlength = context.read<CountDataProvider>().count;
      context.read<CountDataProvider>().fetchCountData();
      int currentlength = context.read<CountDataProvider>().count ;
      if(pastlength < currentlength){
        setState(() {

        });
      }
    });
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

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    print(w);
    print(h);
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationPage()),
                      );
                    },
                    child: Consumer<CountDataProvider>(
                      builder: (context, notificationProvider, _) {
                        return Stack(
                          children: <Widget>[
                            Icon(Icons.notifications),
                            if(notificationProvider.count != 0)
                              Positioned(
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  constraints: BoxConstraints(
                                    minWidth: 12,
                                    minHeight: 12,
                                  ),
                                  child: Text(
                                    '${notificationProvider.count}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                  Icon(
                    Icons.notifications_active,
                    color: Colors.black,
                    size: 10,
                  ),
                ],
            ),
            drawer: MyDrawer(),
            body: InkWell(
              onTap: () {
                /*Provider.of<BottomSheetProvider>(context, listen: false)
                    .setBottomSheetState(false);*/
              },
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(158, 158, 158, .5),
                              Color.fromRGBO(108, 108, 108, .4),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.width > 400
                                          ? 400
                                          : 355,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromRGBO(158, 158, 158, .5),
                                        Color.fromRGBO(108, 108, 108, 1),
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
                                        padding:
                                            MediaQuery.of(context).size.width >
                                                    400
                                                ? EdgeInsets.all(10)
                                                : null,
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
                                                  borderRadius:
                                                      BorderRadius.circular(7)
                                                  // image: DecorationImage(
                                                  //   image:  AssetImage("assets/dashboard/calender.png",),
                                                  // ),
                                                  ),
                                              child: Icon(Icons.calendar_month,color:Colors.white)/*Image(
                                                image: AssetImage(
                                                    'assets/dashboard/calender.png'),
                                                height: 22,
                                                width: 22,
                                              ),*/
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              height: 38,
                                              width: w > 500
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .85
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .8,
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 10),
                                              decoration: ShapeDecoration(
                                                color: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
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
                                        padding:
                                            MediaQuery.of(context).size.width >
                                                    400
                                                ? EdgeInsets.all(10)
                                                : null,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Intraday_Live_Calls()));
                                              },
                                              child: Container(
                                                height: 38,
                                                width: w > 500
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .44
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .43,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  //color: Colors.white10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
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
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            positional_live_calls()));
                                              },
                                              child: Container(
                                                height: 38,
                                                width: w > 500
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .44
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .42,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  // color: Colors.white10,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
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
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                        height: 8,
                                      ),
                                      Container(
                                        height: 252,
                                        color: Colors.transparent,
                                        child: FutureBuilder<List<SliderData>>(
                                          future: Slider_data()
                                              .fetchSliderData(), // Replace 1 with the actual category ID
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            } else if (snapshot.hasError) {
                                              return Center(
                                                  child: Text(
                                                      'Error: ${snapshot.error}'));
                                            } else if (!snapshot.hasData ||
                                                snapshot.data!.isEmpty) {
                                              return Center(
                                                  child: Text(
                                                      'No data available'));
                                            } else {
                                              List<SliderData> dataList =
                                                  snapshot.data!;
                                              return CarouselSliderWidget(
                                                  dataList: dataList);
                                            }
                                          },
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
                                    width: MediaQuery.of(context).size.width,
                                    height: 150,
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
                                        padding:
                                            w > 400 ? EdgeInsets.all(10) : null,
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
                                                  borderRadius:
                                                      BorderRadius.circular(7)
                                                  // image: DecorationImage(
                                                  //   image:  AssetImage("assets/dashboard/calender.png",),
                                                  // ),
                                                  ),
                                              child:Icon(Icons.bar_chart_outlined,color:Colors.white) /*Image(
                                                image: AssetImage(
                                                    'assets/dashboard/home.png'),
                                                height: 22,
                                                width: 22,
                                              ),*/
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              height: 38,
                                              width: w > 500
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .85
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .8,
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 10),
                                              decoration: ShapeDecoration(
                                                color: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
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
                                      if (MediaQuery.of(context).size.width <
                                          400)
                                        SizedBox(
                                          height: 18,
                                        ),
                                      Container(
                                        padding:
                                            w > 400 ? EdgeInsets.all(10) : null,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            short_term_live_calls()));
                                              },
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(top: 2),
                                                width: w > 500
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .28
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .27,
                                                height: 58,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
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
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      // SizedBox(
                                                      //   height: 3,
                                                      // ),
                                                      Text(
                                                        "Short Terms",
                                                        style: TextStyle(
                                                          fontSize:
                                                              w > 400 ? 16 : 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily: 'Inter',
                                                        ),
                                                      ),
                                                      Text(
                                                        " Quarterly",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 22,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            mid_term_live_calls()));
                                              },
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(top: 2),
                                                width: w > 500
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .28
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .27,
                                                height: 58,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
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
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    // SizedBox(
                                                    //   height: 5,
                                                    // ),
                                                    Text(
                                                      "Mid Terms",
                                                      style: TextStyle(
                                                          fontFamily: 'Inter',
                                                          fontSize:
                                                              w > 400 ? 16 : 14,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Text(
                                                      " Yearly",
                                                      style: TextStyle(
                                                          fontFamily: 'Inter',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 21,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            long_term_live_calls()));
                                              },
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(top: 2),
                                                width: w > 500
                                                    ? MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .29
                                                    : MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .27,
                                                height: 58,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
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
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    // SizedBox(
                                                    //   height: 5,
                                                    // ),
                                                    Text(
                                                      "Long Terms",
                                                      style: TextStyle(
                                                          fontSize:
                                                              w > 400 ? 16 : 14,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Text(
                                                      "Above Year",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width > 400
                                            ? 80
                                            : 60,
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
                                    padding:
                                        w > 400 ? EdgeInsets.all(10) : null,
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
                                              borderRadius:
                                                  BorderRadius.circular(7),
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
                                          child: Icon(Icons.category_rounded,)
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
    if(widget.ipo_detail![0]["status"] == "0"){
    Fluttertoast.showToast(msg: "Coming Soon...");
    }
    else{
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Ipo_allotment_status()));}
                                          },
                                          child: Container(
                                            alignment: Alignment.topCenter,
                                            height: 38,
                                            width: w > 500 ? w * .85 : w * .8,
                                            padding: EdgeInsets.only(
                                                top: 6, left: 10, right: 9),
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 0),
                                                  child: Text(
                                                    'IPO Allotment Status......',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w700,
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
                            Container(
                              color: Color.fromRGBO(133, 133, 133, .7),
                              height: 8,
                            ),
                            Stack(
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width > 400
                                            ? 80
                                            : 60,
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
                                    padding:
                                        w > 400 ? EdgeInsets.all(10) : null,
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
                                              borderRadius:
                                                  BorderRadius.circular(7),
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
                                          child:Icon(Icons.query_stats_rounded,), /* Image(
                                            image: AssetImage(
                                                'assets/dashboard/search.png'),
                                            height: 22,
                                            width: 22,
                                          ),*/
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                          //  print(widget.ipo_detail!["count"]);
                                            if(widget.ipo_detail![1]["status"] == "0"){
                                                      Fluttertoast.showToast(msg: "Coming Soon...");
                                            }
                                            else{
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Ipo_main()));
                                            }

                                          },
                                          child: Container(
                                            alignment: Alignment.topCenter,
                                            height: 38,
                                            width: w > 500 ? w * .85 : w * .8,
                                            padding: EdgeInsets.only(
                                                top: 6, left: 10, right: 9),
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 0),
                                                  child: Text(
                                                    'IPO (Initial Public Offering)...',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w700,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  /*if (Provider.of<BottomSheetProvider>(context,listen: false).isBottomSheetOpen)
                        buildBlurBackground()*/
                ],
              ),
            ),
            bottomNavigationBar: _bannerAd == null
                ? Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .8,
                    height: MediaQuery.of(context).size.height * .06,
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Text("No Ads "),
                  )
                : SizedBox(
                    width: _bannerAd!.size.width.toDouble(),
                    height: _bannerAd!.size.height.toDouble(),
                    child: AdWidget(ad: _bannerAd!),
                  ),
            /*bottomNavigationBar: _bannerAd != null ?
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            )
                :
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .04,
                decoration: BoxDecoration(border: Border.all()),
                child: const Text("No Ads "),
              ),
            ),*/
          ),
          if (widget.banner_data!.isNotEmpty && widget.banner_data!["status"] == "1" && banner&& widget.isbannerDisplay!)
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      banner = false;
                    });
                  },
                  child: Container(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color: Colors.black
                            .withOpacity(0.5), // Adjust the opacity as needed
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: 450,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              //      padding: const EdgeInsets.all(20.0),
                              child: Text("${widget.banner_data!["title"]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "${widget.banner_data!["body"]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    // overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () async {
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                String id = prefs.getString("user_id").toString();
                                 prefs.setString("banner_click_id",id.toString());
                                String url = widget.banner_data!["url"];
                                if (await canLaunch(url)) {
                                  await launch(url, forceWebView: true, enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0), // Set your desired radius
                                ),
                              ),
                              child: Text("Click here...", style: TextStyle(color: Colors.black)),
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget buildBlurBackground() {
    return Container(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          color: Colors.black.withOpacity(0.5), // Adjust the opacity as needed
        ),
      ),
    );
  }
}

class CarouselSliderWidget extends StatefulWidget {
  final List<SliderData> dataList;

  CarouselSliderWidget({required this.dataList});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CarouselIndexProvider>(context);

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 230,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            //enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              provider.setIndex(index);
            },
          ),

          // options: CarouselOptions(
          //   // height: 108,
          //   aspectRatio: 16 / 11,
          //   // enlargeCenterPage: true,
          //    autoPlay: true,
          //   // viewportFraction: 0.8,
          //   height: 126,
          //   viewportFraction: 0.6,
          //   enlargeCenterPage: true,
          // ),
          items: widget.dataList.map((SliderData data) {
            return Builder(
              builder: (BuildContext context) {
                final w = MediaQuery.of(context).size.width;
                final h = MediaQuery.of(context).size.height;

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 220,
                        /*MediaQuery.of(context).size.height < 750
                            ? MediaQuery.of(context).size.height * 100
                            : MediaQuery.of(context).size.height * .28,*/
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
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
                              height: 24,
                              decoration: ShapeDecoration(
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  )),
                              child: Center(
                                child: Text(
                                  "Recent ${data.call_name} calls",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 60,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 15,
                                          top: 10,
                                          bottom: 10,
                                          right: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.name!,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .height >
                                                      750
                                                  ? 14
                                                  : 12,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0, // Adjust the width as needed
                                                ),
                                              ),
                                            ),
                                            padding: EdgeInsets.only(top: 6),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text("Entry: ${data.entry}",style: TextStyle(
                                                  fontSize:
                                                  data.entry!.length > 10
                                                      ? 7
                                                      :  data.entry!.length > 7 ? 8 : MediaQuery.of(context).size.width > 320? 10 :8 ,
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
                                                  color:Colors.black
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(
                                                  Icons.calendar_month,
                                                  size: 12,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  data.showDate!,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                    MediaQuery.of(context).size.width > 320? 10 :8,
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
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  data.time!,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                    MediaQuery.of(context).size.width > 320? 10 :8,
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
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 1),
                                      padding: EdgeInsets.only(
                                          top: 10, bottom: 10, left: 5),
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
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    400
                                                ? 14
                                                : 12,
                                            color: data.type == "Sell"
                                                ? Colors.red
                                                : Colors.green,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          children: [
                                            WidgetSpan(
                                              alignment:
                                                  PlaceholderAlignment.middle,
                                              baseline:
                                                  TextBaseline.ideographic,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 4.0),
                                                child: Image.asset(
                                                  'assets/slider_arrow.png',
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
                                    horizontal: 10, vertical: 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18, // Adjust the percentage as needed
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                  750
                                              ? 30
                                              : 30,
                                          decoration: ShapeDecoration(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          child: commonText(text: "Target 1"),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18, // Adjust the percentage as needed
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                  750
                                              ? 30
                                              : 30,
                                          decoration: ShapeDecoration(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          child: commonText(text: "Target 2"),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18, // Adjust the percentage as needed
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                  750
                                              ? 30
                                              : 30,
                                          decoration: ShapeDecoration(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          child: commonText(text: "Target 3"),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18, // Adjust the percentage as needed
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                  750
                                              ? 30
                                              : 30,
                                          decoration: ShapeDecoration(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          child: commonText(text: "Stopless"),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18, // Adjust the percentage as needed
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                  750
                                              ? 30
                                              : 30,
                                          decoration: ShapeDecoration(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          child: commonText(
                                              text: "${data.target}",fontSize: data.target!.length > 10 ? 8 :data.target!.length>8 ? 10:12,),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18, // Adjust the percentage as needed
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                  750
                                              ? 30
                                              : 30,
                                          decoration: ShapeDecoration(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          child: commonText(
                                              text: "${data.target1}",fontSize: data.target!.length > 10 ? 8 :data.target!.length>8 ? 10:12,),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18, // Adjust the percentage as needed
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                  750
                                              ? 30
                                              : 30,
                                          decoration: ShapeDecoration(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          child: commonText(
                                              text: "${data.target2}",fontSize: data.target!.length > 10 ? 8 :data.target!.length>8 ? 10:12,),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18, // Adjust the percentage as needed
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                  750
                                              ? 30
                                              : 30,
                                          decoration: ShapeDecoration(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          child: commonText(
                                              text: "${data.stoploss}",fontSize: data.target!.length > 10 ? 8 :data.target!.length>8 ? 10:12,),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18, // Adjust the percentage as needed
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                  750
                                              ? 30
                                              : 30,
                                          decoration: ShapeDecoration(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          child: data.targetStatus == "1"
                                              ? Image.asset("assets/check.png",
                                                  height: 30, width: 30)
                                              : Icon(Icons.more_horiz,color: Colors.white,size: 30,)
                                          /*Image.asset("assets/wrong.png",
                                              height: 20, width: 20 )*/,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18, // Adjust the percentage as needed
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                  750
                                              ? 30
                                              : 30,
                                          decoration: ShapeDecoration(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          child: data.target1Status == "1"
                                              ? Image.asset("assets/check.png",
                                                  height: 30, width: 30)
                                              : Icon(Icons.more_horiz,color: Colors.white,size: 30,)
                                          /*Image.asset("assets/wrong.png",
                                              height: 20, width: 20 )*/
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18, // Adjust the percentage as needed
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                  750
                                              ? 30
                                              : 30,
                                          decoration: ShapeDecoration(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          child: data.target2Status == "1"
                                              ? Image.asset("assets/check.png",
                                                  height: 30, width: 30)
                                              :Icon(Icons.more_horiz,color: Colors.white,size: 30,)
                                          /*Image.asset("assets/wrong.png",
                                              height: 20, width: 20 )*/,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18, // Adjust the percentage as needed
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                  750
                                              ? 30
                                              : 30,
                                          decoration: ShapeDecoration(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          child: data.stoplessStatus == "1"
                                              ? Image.asset("assets/check.png",
                                                  height: 30, width: 30)
                                              :  Icon(Icons.more_horiz,color: Colors.white,size: 30,)
                                          /*Image.asset("assets/wrong.png",
                                              height: 20, width: 20 )*/,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Center(
                                      child: Text(
                                        "${data.des1}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                  750
                                              ? 12
                                              : 10,
                                        ),
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
                        height: 10,
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        DotsIndicator(
          dotsCount: widget.dataList.length,
          position: provider.currentIndex,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            color: Colors.white,
            activeColor: Colors.black,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
