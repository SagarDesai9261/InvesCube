import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_market/authentication/signin.dart';
import 'package:stock_market/screens/privacy_policy.dart';
import 'package:stock_market/screens/terms_and_condition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

import '../authentication/logout.dart';
import '../authentication/profile.dart';
import '../authentication/settings.dart';
import '../model/providers.dart';
import 'basic_education.dart';
import 'holidays.dart';

class MyDrawer extends StatelessWidget {
  Future<Map<String, String>> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accountName = prefs.getString('accountName') ?? 'Default Name';
    String accountEmail = prefs.getString('accountEmail') ?? 'Default Email';
    String accountImage = prefs.getString('accountImage') ?? '';

    return {'accountName': accountName, 'accountEmail': accountEmail,'accountImage':accountImage};
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
  final form_key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future:getUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Handle loading state if needed
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Handle error state if needed
          return Text('Error: ${snapshot.error}');
        }
        final Map<String, String> userInfo = snapshot.data!;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(250),
              ),
              child: SizedBox(
                width: 250,
                child: Drawer(
                  child:  ListView(
                    children: <Widget>[
                      Stack(
                          children: [
                            InkWell(
                              onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                },
                              child:  UserAccountsDrawerHeader(
                                //Color(0xff4367b1)
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                                currentAccountPicture: Provider.of<UserInfoProvider>(context).accountImage =="" ?  Image.asset("assets/img_6.png"):ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.network(Provider.of<UserInfoProvider>(context).accountImage,fit:BoxFit.fill,)),
                                accountName:  Text(
                                  "${userInfo['accountName']!}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    //color: Colors.grey[300],
                                    color: Colors.white,
                                  ),
                                ),
                                accountEmail:  Text(
                                  '${
                                      userInfo['accountEmail']!
                                  }',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              // left: 185,
                              right: 10,
                              child: IconButton(
                                icon: Icon(Icons.close),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ]

                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>basic_education()));
                        },
                        child:  ListTile(
                          title:  Text(
                            'Basic Education',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),

                          leading: Icon(Icons.lightbulb_outline_rounded,color: Colors.black,) /*Image(
                            image: AssetImage('assets/dashboard/img_2.png'),
                            height: 30,
                            width: 30,
                          ),*/
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>holidays()));
                        },
                        child:  ListTile(
                          title:  Text(
                            "Yearly Holiday's",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),

                          leading: Icon(Icons.airplane_ticket_outlined) /*Image(
                            image: AssetImage('assets/dashboard/img_1.png'),
                            height: 30,
                            width: 30,
                          ),*/
                        ),
                      ),
                       ListTile(
                        title:  Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          _composeEmail();
                          Navigator.pop(context);
                        },
                        leading: Icon(Icons.email_outlined) /*Image(
                          image: AssetImage('assets/dashboard/call.png'),
                          height: 30,
                          width: 30,
                        ),*/
                      ),
                       ListTile(
                        title:  Text(
                          'Feedback',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Provider.of<BottomSheetProvider>(context, listen: false)
                              .setBottomSheetState(true);
                          Navigator.pop(context);
                          _handleFABPressed(context);
                        },
                        leading:  /*Image(
                          image: AssetImage('assets/dashboard/feedback.png'),
                          height: 30,
                          width: 30,
                        ),*/Icon(Icons.thumb_up_outlined)
                      ),
                      ListTile(
                          title:  Text(
                            'Terms & Conditions',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>terms_and_condition()));
                          },
                          leading: Icon(Icons.library_books_sharp) /*Image(
                          image: AssetImage('assets/dashboard/call.png'),
                          height: 30,
                          width: 30,
                        ),*/
                      ),
                      ListTile(
                          title:  Text(
                            'Privacy Policy',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>privacy_policy()));
                          },
                          leading: Icon(Icons.policy) /*Image(
                          image: AssetImage('assets/dashboard/call.png'),
                          height: 30,
                          width: 30,
                        ),*/
                      ),
                      ListTile(
                          title:  Text(
                            'Setting',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
                          },
                          leading: Icon(Icons.settings) /*Image(
                          image: AssetImage('assets/dashboard/call.png'),
                          height: 30,
                          width: 30,
                        ),*/
                      ),
                     /* SizedBox(
                        width: 40,
                        child: ElevatedButton(onPressed: (){}, child: Row(
                          children: [
                            Text("Logout"),
                            Icon(Icons.exit_to_app)
                          ],
                        )),
                      )*/
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: (){

                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Logout_screen()));
                              /* QuickAlert.show(
                                onCancelBtnTap: () {
                                  Navigator.pop(context);
                                },
                                onConfirmBtnTap: ()async{
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  //prefs.setString("user_id", "");
                                  prefs.clear();
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));
                                 // FirebaseAuth.instance.signOut();
                                //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Account_type()));
                                },
                                context: context,
                                type: QuickAlertType.confirm,
                                text: 'Do you want to logout',
                                titleAlignment: TextAlign.center,
                                textAlignment: TextAlign.center,
                                confirmBtnText: 'Yes',
                                cancelBtnText: 'No',
                                confirmBtnColor: Colors.green,
                                backgroundColor: Colors.white,
                                headerBackgroundColor: Colors.grey,
                                confirmBtnTextStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                cancelBtnTextStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                barrierColor: Colors.white,
                                titleColor: Colors.black,
                                textColor: Colors.black,
                              );*/
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                            //  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0), // Add border radius for a rounded look
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Logout",style:TextStyle(
                                    color: Colors.white
                                  )),
                                  Icon(Icons.exit_to_app,color:Colors.white)
                                ],
                              )
                            ),
                          ),
                          Text("")
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
  _composeEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@invescube.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Example Subject & Symbols are allowed!',
      }),
    );
    launchUrl(emailLaunchUri);
  }
  void _handleFABPressed(BuildContext context) {
    bool isLoading = Provider.of<FeedbackProvider>(context,listen:false).loading;
    double star = 0.0;
    int _rating = 0;
    TextEditingController message = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
     // expand: true,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child:StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(5, (index) {
                              return IconButton(
                                icon: Icon(
                                  index < _rating ? Icons.star : Icons.star_border,
                                  color: index < _rating ? Colors.yellow : Colors.grey,
                                   size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (_rating == index + 1) {
                                      _rating = _rating - 1;
                                    } else {
                                      _rating = index + 1;
                                    }
                                  });
                                },
                              );
                            }),
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
                                  if(value!.length>100){
                                    return "Please enter maximum 100 characters";
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
                                      print(_rating);
                                      print(message.text);
                                      if(_rating == 0){
                                      Fluttertoast.showToast(msg: "please select the star");
                                      }else{
                                        Provider.of<FeedbackProvider>(context, listen: false).submitFeedback(context,_rating,message.text);
                                        if(isLoading==false){
                                          Navigator.pop(context);
                                          _handlesubmitPressed( context);
                                        }
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
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        ),
      ),
    );

  }
  void _handlesubmitPressed(BuildContext context) {

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
//      expand: true,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
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
            )
          ],
        ),
      ),
    );

  }
}