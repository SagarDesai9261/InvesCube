import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';
import '../model/service.dart';

class CarouselIndexProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
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

void main(){
  runApp(MaterialApp(
    home:YourCarousel()
  ));
}

class YourCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CarouselIndexProvider(),
      child:
      FutureBuilder<List<DataList>>(
        future: ApiService().fetchData(
            1), // Replace 1 with the actual category ID
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
            return _CarouselContent(dataList: dataList);
          }
        },
      ),
      /*_CarouselContent()*/
    );
  }
}

class _CarouselContent extends StatefulWidget {
  final List<DataList> dataList;
  _CarouselContent({required this.dataList});
  @override
  _CarouselContentState createState() => _CarouselContentState();
}

class _CarouselContentState extends State<_CarouselContent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Ensure that the mixin is included

    var provider = Provider.of<CarouselIndexProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 240,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              //enableInfiniteScroll: true,
              reverse: false,
              // autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
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
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height < 750
                              ? MediaQuery.of(context).size.height * 0.33
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
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: MediaQuery.of(context).size.width * 0.15,
                                decoration: ShapeDecoration(
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
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
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.name!,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.white,
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
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: MediaQuery.of(context)
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
                                                    fontSize: MediaQuery.of(context)
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
                                                baseline: TextBaseline.ideographic,
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
                                      horizontal: 10, vertical: 10),
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
                                            width: MediaQuery.of(context).size.width *
                                                0.18, // Adjust the percentage as needed
                                            height:
                                            MediaQuery.of(context).size.height >
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
                                            width: MediaQuery.of(context).size.width *
                                                0.18, // Adjust the percentage as needed
                                            height:
                                            MediaQuery.of(context).size.height >
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
                                            width: MediaQuery.of(context).size.width *
                                                0.18, // Adjust the percentage as needed
                                            height:
                                            MediaQuery.of(context).size.height >
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
                                            width: MediaQuery.of(context).size.width *
                                                0.18, // Adjust the percentage as needed
                                            height:
                                            MediaQuery.of(context).size.height >
                                                750
                                                ? 30
                                                : 30,
                                            decoration: ShapeDecoration(
                                              color: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                            child: commonText(text: "Target 4"),
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
                                            width: MediaQuery.of(context).size.width *
                                                0.18, // Adjust the percentage as needed
                                            height:
                                            MediaQuery.of(context).size.height >
                                                750
                                                ? 30
                                                : 30,
                                            decoration: ShapeDecoration(
                                              color: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                            child: commonText(text: "${data.target}"),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: MediaQuery.of(context).size.width *
                                                0.18, // Adjust the percentage as needed
                                            height:
                                            MediaQuery.of(context).size.height >
                                                750
                                                ? 30
                                                : 30,
                                            decoration: ShapeDecoration(
                                              color: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                            child:
                                            commonText(text: "${data.target1}"),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: MediaQuery.of(context).size.width *
                                                0.18, // Adjust the percentage as needed
                                            height:
                                            MediaQuery.of(context).size.height >
                                                750
                                                ? 30
                                                : 30,
                                            decoration: ShapeDecoration(
                                              color: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                            child:
                                            commonText(text: "${data.target1}"),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: MediaQuery.of(context).size.width *
                                                0.18, // Adjust the percentage as needed
                                            height:
                                            MediaQuery.of(context).size.height >
                                                750
                                                ? 30
                                                : 30,
                                            decoration: ShapeDecoration(
                                              color: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                            ),
                                            child:
                                            commonText(text: "${data.stoploss}"),
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
                                            width: MediaQuery.of(context).size.width *
                                                0.18, // Adjust the percentage as needed
                                            height:
                                            MediaQuery.of(context).size.height >
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
                                            width: MediaQuery.of(context).size.width *
                                                0.18, // Adjust the percentage as needed
                                            height:
                                            MediaQuery.of(context).size.height >
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
                                            width: MediaQuery.of(context).size.width *
                                                0.18, // Adjust the percentage as needed
                                            height:
                                            MediaQuery.of(context).size.height >
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
                                            width: MediaQuery.of(context).size.width *
                                                0.18, // Adjust the percentage as needed
                                            height:
                                            MediaQuery.of(context).size.height >
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
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Text(
                                          "${data.des1}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                            MediaQuery.of(context).size.height >
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
                        )
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
    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    )
        
        ],
      ),
    );
  }
}

/*
class DataList {
  final String? target;

  DataList(this.target);
}

List<DataList> dataList = [
  DataList("Item 1"),
  DataList("Item 2"),
  DataList("Item 3"),
  // Add more items as needed
];
*/
