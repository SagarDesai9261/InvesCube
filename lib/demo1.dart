import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isSecure = true;
  bool isSecure1 = true;

  final List<String> staticData = [
    'Tata Technologies Delivery Calls Added...',
    'Tata Technologies Delivery Calls...',
    'Tata Technologies Delivery Calls...',

  ];

  final List<String> staticData1 = [
    'Gandhar Intraday Calls Added...',
    'Gandhar Intraday Calls Added...',
    'Gandhar Intraday Calls Added...',

  ];

  List<String> currentList = [];

  @override
  void initState() {
    super.initState();
    currentList = staticData;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: CustomAppBar(),
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: MediaQuery.of(context).size.height,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.white.withOpacity(1),
                ],
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 90,
            child: Image.asset(
              "assets/img_4.png",
              height: 200,
              width: 200,
            ),
          ),
          Positioned(
            top: 330,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: screenWidth,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ToggleButton(
                        onReadPressed: () {
                          setState(() {
                            currentList = staticData;
                          });
                        },
                        onUnreadPressed: () {
                          setState(() {
                            currentList = staticData1;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: h > 700 ?  MediaQuery.of(context).size.height * 0.45 : h * .4,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: currentList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                            width: 334,
                            height: 42,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 1, color: Color(0xFFCFCFCF)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    currentList[index],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top:  h > 700 ? h * .36: h * .47,
            left: screenWidth > 370 ? 70 : 50,
            child: Container(
              alignment: Alignment.center,
              width: 262,
              height: 50,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadows: [
                  const BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: const Text(
                'Notifications',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: const Icon(Icons.arrow_back_outlined,color: Colors.white,),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ToggleButton extends StatefulWidget {
  final VoidCallback onReadPressed;
  final VoidCallback onUnreadPressed;

  ToggleButton({required this.onReadPressed, required this.onUnreadPressed});

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

const double width = 300.0;
const double height = 40.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black;

class _ToggleButtonState extends State<ToggleButton> {
  double xAlign = 0.0;
  Color? loginColor;
  Color? signInColor;

  @override
  void initState() {
    super.initState();
    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(xAlign, 0),
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: width * 0.45,
              height: height,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: xAlign == loginAlign
                    ? const BorderRadius.only(
                  topRight: Radius.circular(50.0),
                  topLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(50.0),
                  bottomLeft: Radius.circular(10.0),
                )
                    : const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0),
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = loginAlign;
                loginColor = selectedColor;
                signInColor = normalColor;
                widget.onReadPressed();
              });
            },
            child: Align(
              alignment: const Alignment(-1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  'Read',
                  style: TextStyle(
                    color: loginColor,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = signInAlign;
                signInColor = selectedColor;
                loginColor = normalColor;
                widget.onUnreadPressed();
              });
            },
            child: Align(
              alignment: const Alignment(1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  'Unread',
                  style: TextStyle(
                    color: signInColor,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(),
      toolbarHeight: appBarHeight,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}