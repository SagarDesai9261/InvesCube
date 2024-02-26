import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isOverlayVisible = false;

  void _toggleOverlay() {
    setState(() {
      isOverlayVisible = !isOverlayVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overlay Demo'),
      ),
      body: Stack(
        children: [
          // Main content goes here
          Column(
            children: [
              ElevatedButton(
                onPressed: _handlesubmitPressed,
                child: Text('Toggle Overlay'),
              ),
              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  //controller: textarea,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.19,
                    ),
                    fillColor: Colors.black,
                    filled: true,
                    hintText:
                        "'Share your feel good experience with this application...",
                  ),
                ),
              )*/
            ],
          ),

          // Overlay container with blur effect or opacity
         /* Center(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height < 750
                      ? MediaQuery.of(context).size.height * 0.33
                      : MediaQuery.of(context).size.height * 0.30,
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
                  child: Center(
                      child: Text(
                    "hello",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height < 750
                      ? MediaQuery.of(context).size.height * 0.33
                      : MediaQuery.of(context).size.height * 0.30,
                  decoration: ShapeDecoration(
                    color: Colors.black12.withOpacity(.1),
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
                  // child: Center(child: Text("hello",style: TextStyle(color: Colors.black,fontSize: 25),)),
                ),
              ],
            ),
          )*/
        ],
      ),
    );
  }

  void _handleFABPressed() {
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
                      fontSize: 16,
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
                          print(rating);
                        },
                      ),
                      SizedBox(
                        height: 30,
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
                      TextField(
                        //controller: textarea,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.19,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText:
                              "'Share your feel good experience with this application...",
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'Write minimum 100 characters...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0.28,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: Container(
                          width: 95,
                          height: 38,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Submit"),
                              Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
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
               Container(
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
               )

             ],

            ),
          );
        });
  }
}
