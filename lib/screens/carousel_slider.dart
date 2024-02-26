import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List<DataList> dataList;

  CarouselSliderWidget({required this.dataList});

  @override
  Widget build(BuildContext context) {
    return
      CarouselSlider(
        options:  CarouselOptions(
          height: 110,
          aspectRatio: 16 / 11,
          viewportFraction: 0.57,
          initialPage: 0,
          //enableInfiniteScroll: true,
          reverse: false,
          // autoPlay: true,
          autoPlayInterval: Duration(seconds: 2),
          autoPlayAnimationDuration:
          Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
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
        items: dataList.map((DataList item) {
          return Builder(
            builder: (BuildContext context) {
              return
                Container(
                  height: 108,
                  width: 193,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: SingleChildScrollView(
                    child:
                    Column(
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
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(height: 5,),
                        Container(
                          margin: EdgeInsets.only(top: 5,bottom: 2  ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Container(
                                //  color: Colors.red,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 2),
                                        child: Text(
                                          item.name!,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w700,
                                            fontSize:
                                            MediaQuery.of(context).size.height > 750
                                                ? 8
                                                : 8,
                                          ),
                                        ),
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.calendar_month,size: 10,color: Colors.black,),
                                          SizedBox(width: 3,),
                                          Text(
                                            item.showDate!,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                              MediaQuery.of(context).size.height > 750
                                                  ? 6
                                                  : 6,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              height: 1,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Icon(Icons.timer,size: 10,color: Colors.black,),
                                          SizedBox(width: 3,),
                                          Text(
                                            item.time!,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                              MediaQuery.of(context).size.height > 750
                                                  ? 6
                                                  : 6,
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
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                  //  color: Colors.green,
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
                                        fontSize: 10,
                                        color: item.type == "Sell" ?Colors.red : Colors.green,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
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
                                          text: '${item.type}',

                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                                      item.target ?? "",
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
                                    item.target1 ?? "",
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
                                    item.stoploss ?? "",
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
                                Icons.check_circle,
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
                                Icons.check_circle,
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
                                Icons.cancel,
                                color: Colors.red,
                                size: 10,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("${item.des1}",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 6,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    ),
                  ),
                );
              //   Container(
              //   width: MediaQuery.of(context).size.width * .6 , // Adjust the factor as needed
              //   // margin: EdgeInsets.symmetric(horizontal: 5.0), // You can add margin if needed
              //   child: Card(
              //     child:
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Container(
              //           width: 210,
              //           height: 17.938201904296875,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.only(
              //                   topLeft: Radius.circular(8),
              //                   topRight: Radius.circular(8)),
              //               color: Colors.black),
              //           child: Padding(
              //             padding: const EdgeInsets.only(left: 60, top: 3),
              //             child: Text("Recent Intraday Calls",
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 8,
              //                 fontWeight: FontWeight.w600,
              //               ),
              //             ),
              //           ),
              //         ),
              //         // SizedBox(height: 5,),
              //         Row(
              //           children: [
              //             Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.only(left: 8, top: 4),
              //                   child: Container(
              //                     child: Text(item.name??"",
              //                         style: TextStyle(
              //                           fontSize: 6,
              //                           fontWeight: FontWeight.w700,
              //                         )),
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.only(right: 18, bottom: 2),
              //                   child:
              //                   Row(
              //                       children: [
              //                         Stack(
              //                           children: [
              //                             Container(
              //                               width: 12,
              //                               height: 12,
              //                             ),
              //                             Center(
              //                               child: Container(
              //                                 width: 12,
              //                                 height: 12,
              //                                 child: Icon(
              //                                   Icons.calendar_month,
              //                                   color: Colors.black,
              //                                   size: 12,
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                         SizedBox(
              //                           width: 5,
              //                         ),
              //                         Container(
              //                           child: Text(item.date ?? "",
              //                               style: TextStyle(
              //                                 fontSize: 6,
              //                                 fontWeight: FontWeight.w700,
              //                               )),
              //                         ),
              //                         SizedBox(
              //                           width: 5,
              //                         ),
              //                         Stack(
              //                           children: [
              //                             Container(
              //                               width: 12,
              //                               height: 12,
              //                             ),
              //                             Center(
              //                               child: Container(
              //                                 width: 12,
              //                                 height: 12,
              //                                 child: Icon(
              //                                   Icons.watch_later,
              //                                   color: Colors.black,
              //                                   size: 12,
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                         SizedBox(
              //                           width: 5,
              //                         ),
              //                         Container(
              //                           child: Text(item.time ?? "",
              //                               style: TextStyle(
              //                                 fontSize: 6,
              //                                 fontWeight: FontWeight.w700,
              //                               )),
              //                         ),
              //                       ]),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 5,
              //             ),
              //             Container(
              //               width: 0.5224719047546387,
              //               height: 20,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(10),
              //                   color: Colors.black),
              //             ),
              //             SizedBox(
              //               width: 6,
              //             ),
              //             Stack(
              //               children: [
              //                 Container(
              //                   width: 12,
              //                   height: 12,
              //                 ),
              //                 Center(
              //                   child: Container(
              //                     width: 12,
              //                     height: 12,
              //                     child: Image(
              //                       image: AssetImage('assets/images/img_4.png'),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(width: 6),
              //             Text(
              //               "Buy",
              //               style: TextStyle(
              //                 fontSize: 10,
              //                 color: Colors.green,
              //                 fontWeight: FontWeight.w600,
              //               ),
              //             ),
              //           ],
              //         ),
              //         // SizedBox(
              //         //   height: 8,
              //         // ),
              //         Row(
              //           children: [
              //             Padding(
              //               padding: EdgeInsets.only(left: 8),
              //               child: Container(
              //                 width: 40,
              //                 height: 12.539325714111328,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(2),
              //                     color: Colors.black),
              //                 child: Center(
              //                     child: Text(
              //                       "Target 1",
              //                       style: TextStyle(
              //                         color: Colors.white,
              //                         fontSize: 7,
              //                       ),
              //                     )),
              //               ),
              //             ),
              //             SizedBox(
              //               width: 6,
              //             ),
              //             Container(
              //               width: 40,
              //               height: 12.539325714111328,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(2),
              //                   color: Colors.black),
              //               child: Center(
              //                   child: Text(
              //                     "Target 2",
              //                     style: TextStyle(
              //                       color: Colors.white,
              //                       fontSize: 7,
              //                     ),
              //                   )),
              //             ),
              //             SizedBox(
              //               width: 6,
              //             ),
              //             Container(
              //               width: 40,
              //               height: 12.539325714111328,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(2),
              //                   color: Colors.black),
              //               child: Center(
              //                   child: Text(
              //                     "Target 3",
              //                     style: TextStyle(
              //                       color: Colors.white,
              //                       fontSize: 7,
              //                     ),
              //                   )),
              //             ),
              //             SizedBox(
              //               width: 6,
              //             ),
              //             Container(
              //               width: 40,
              //               height: 12.539325714111328,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(2),
              //                   color: Colors.black),
              //               child: Center(
              //                 child: Text(
              //                   "Stopless",
              //                   style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 7,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //
              //         SizedBox(
              //           height: 5,
              //         ),
              //
              //         Row(
              //           children: [
              //             Padding(
              //               padding: EdgeInsets.only(left: 8),
              //               child: Container(
              //                 width: 40,
              //                 height: 12.539325714111328,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(2),
              //                     color: Colors.black),
              //                 child: Center(
              //                     child: Text(
              //                       item.target?? "",
              //                       style: TextStyle(
              //                         color: Colors.white,
              //                         fontSize: 7,
              //                       ),
              //                     )),
              //               ),
              //             ),
              //             SizedBox(
              //               width: 6,
              //             ),
              //             Container(
              //               width: 40,
              //               height: 12.539325714111328,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(2),
              //                   color: Colors.black),
              //               child: Center(
              //                   child: Text(
              //                     item.target1??"",
              //                     style: TextStyle(
              //                       color: Colors.white,
              //                       fontSize: 7,
              //                     ),
              //                   )),
              //             ),
              //             SizedBox(
              //               width: 6,
              //             ),
              //             Container(
              //               width: 40,
              //               height: 12.539325714111328,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(2),
              //                   color: Colors.black),
              //               child: Center(
              //                   child: Text(
              //                      "target 3",
              //                     style: TextStyle(
              //                       color: Colors.white,
              //                       fontSize: 7,
              //                     ),
              //                   )),
              //             ),
              //             SizedBox(
              //               width: 6,
              //             ),
              //             Container(
              //               width: 40,
              //               height: 12.539325714111328,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(2),
              //                   color: Colors.black),
              //               child: Center(
              //                   child: Text(
              //                     item.stoploss ?? "",
              //                     style: TextStyle(
              //                       color: Colors.white,
              //                       fontSize: 7,
              //                     ),
              //                   )),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 5,
              //         ),
              //         Row(
              //           children: [
              //             Padding(
              //               padding: EdgeInsets.only(left: 8),
              //               child: Container(
              //                 width: 40,
              //                 height: 12.539325714111328,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(2),
              //                     color: Colors.black),
              //                 child: Icon(
              //                   Icons.check_circle,
              //                   color: Colors.green,
              //                   size: 10,
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               width: 6,
              //             ),
              //             Container(
              //               width: 40,
              //               height: 12.539325714111328,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(2),
              //                   color: Colors.black),
              //               child: Icon(
              //                 Icons.check_circle,
              //                // dataList["target1_symbol"],
              //                 color: Colors.green,
              //                 size: 10,
              //               ),
              //             ),
              //             SizedBox(
              //               width: 6,
              //             ),
              //             Container(
              //               width: 40,
              //               height: 12.539325714111328,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(2),
              //                   color: Colors.black),
              //               child: Icon(
              //                 Icons.check_circle,
              //                 color: Colors.green,
              //                 size: 10,
              //               ),
              //             ),
              //             SizedBox(
              //               width: 6,
              //             ),
              //             Container(
              //               width: 40,
              //               height: 12.539325714111328,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(2),
              //                   color: Colors.black),
              //               child: Icon(
              //                 Icons.cancel,
              //                 //dataList["stopless_symbol"],
              //                 color: Colors.red,
              //                 size: 10,
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 5,
              //         ),
              //         Text("Note : Only for educational purpose...",
              //             style: TextStyle(
              //               fontSize: 5,
              //               fontWeight: FontWeight.w700,
              //             )),
              //       ],
              //     ),
              //   ),
              // );
            },
          );
        }).toList(),
      );

  }
}