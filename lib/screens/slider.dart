import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_market/screens/short_term.dart';
import '../model/model.dart';
import '../model/providers.dart';
import '../model/service.dart';
import 'drawer.dart';
import 'holidays.dart';
import 'ipo.dart';
import 'long_term.dart';
import 'medium_term.dart';

void main() {
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
        home: Slider(

        ),
      )));
}

class Slider extends StatefulWidget {
  const Slider({Key? key}) : super(key: key);

  @override
  State<Slider> createState() => _SliderState();
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

class _SliderState extends State<Slider> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    print(h);
    print(w);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
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
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            /*Container(
              width: 430,
              height: 360,
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
            ),*/
            Stack(
              children: [
                Container(
                  width: 430,
                  height: 355,
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
                        padding: MediaQuery.of(context).size.width > 400
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
                                  borderRadius: BorderRadius.circular(7)
                                // image: DecorationImage(
                                //   image:  AssetImage("assets/dashboard/calender.png",),
                                // ),
                              ),
                              child: Image(
                                image:
                                AssetImage('assets/dashboard/calender.png'),
                                height: 22,
                                width: 22,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 38,
                              width: MediaQuery.of(context).size.width * .8,
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
                        padding: MediaQuery.of(context).size.width > 400
                            ? EdgeInsets.all(10)
                            : null,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(context,MaterialPageRoute(builder: (context)=>Intraday_Live_Calls()));
                              },
                              child: Container(
                                height: 38,
                                width: MediaQuery.of(context).size.width * .43,
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
                              onTap: () {
                                //       Navigator.push(context, MaterialPageRoute(builder: (context)=>positional_live_calls()));
                              },
                              child: Container(
                                height: 38,
                                width: MediaQuery.of(context).size.width * .43,
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
                        height: 8,
                      ),
                      Container(
                        height: 242,
                        color: Colors.transparent,
                        child: FutureBuilder<List<DataList>>(
                          future: ApiService().fetchData(
                              2), // Replace 1 with the actual category ID
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return Center(child: Text('No data available'));
                            } else {
                              List<DataList> dataList = snapshot.data!;
                              return CarouselSliderWidget(dataList: dataList);
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
          ],
        ),
      ),
    );
  }
}

class CarouselSliderWidget extends StatefulWidget {
  final List<DataList> dataList;

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
            height: 220,
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
          items: widget.dataList.map((DataList data) {
            return Builder(
              builder: (BuildContext context) {
                final w = MediaQuery.of(context).size.width;
                final h = MediaQuery.of(context).size.height;
                print(h);
                print(w);
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height < 750
                            ? MediaQuery.of(context).size.height * 0.34
                            : MediaQuery.of(context).size.height * .28,
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
                                  "Recent Intraday calls",
                                  style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.width * 0.16,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),),
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
                                            height: 8,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.calendar_month,
                                                size: 10,
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
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                      750
                                                      ? 12
                                                      : 10,
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
                                                size: 10,
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
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height >
                                                      750
                                                      ? 12
                                                      : 10,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
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
                                            fontSize: 12,
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
                                                  'assets/live_calls_arrow.png',
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
                                              text: "${data.target}"),
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
                                              text: "${data.target1}"),
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
                                              text: "${data.target1}"),
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
                                              text: "${data.stoploss}"),
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
                                          child: data.targetStatus =="1" ?  Image.asset("assets/check.png",
                                              height: 30, width: 30): Image.asset("assets/wrong.png",
                                              height: 20, width: 20),
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
                                          child: data.target1Status =="1" ?  Image.asset("assets/check.png",
                                              height: 30, width: 30): Image.asset("assets/wrong.png",
                                              height: 20, width: 20),
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
                                          child: data.target1Status =="1" ?  Image.asset("assets/check.png",
                                              height: 30, width: 30): Image.asset("assets/wrong.png",
                                              height: 20, width: 20),
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
                                          child: data.callstatus =="1" ?  Image.asset("assets/check.png",
                                              height: 30, width: 30): Image.asset("assets/wrong.png",
                                              height: 20, width: 20),
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
            activeShape: RoundedRectangleBorder
              (
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),

      ],
    );
  }
}
