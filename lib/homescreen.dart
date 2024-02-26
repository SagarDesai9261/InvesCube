

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';
import 'package:stock_market/simple_splash.dart';
import 'package:url_launcher/url_launcher.dart';


import 'Helper_noti.dart';
import 'abc.dart';
import 'authentication/mpin.dart';
import 'authentication/signin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  NotificationServices notificationServices = NotificationServices();
  void checkForAppUpdate(String latestAppVersion) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String currentAppVersion = packageInfo.version;

  //  final String latestAppVersion = await fetchLatestAppVersion();
    if (currentAppVersion != latestAppVersion) {
      // Show update dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            icon: Image.asset("assets/vector/update_icon.png",height: 100,width: 100,),
            title:  Text(
              "Update App",
              textAlign: TextAlign.center,
            ),
            titleTextStyle: TextStyle(
                color: Colors.black,//as per your color
                fontSize: 20,
                fontWeight: FontWeight.w700),
            content:  Text(
              "Please update the app to the latest version to continue.",
              textAlign: TextAlign.center,
            ),
            contentTextStyle: TextStyle(
                color: Colors.grey,//as per your color
                fontSize: 18,
                fontWeight: FontWeight.w500),
            actionsAlignment: MainAxisAlignment.center,
            actionsOverflowButtonSpacing: 8.0,
            actions: [
              GestureDetector(
                onTap: () async{
                  final url = 'https://play.google.com/store/apps/details?id=com.InvesCube';
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                child: Container(
                  height: 60,
                  width:MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.grey,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(27.5),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Update',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),

                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'ProductSans',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      );
    }
  }

  Future<void> fetchLatestAppVersion() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> versionDoc = await FirebaseFirestore.instance.collection('AppVersions').doc('latest').get();
      final String latestAppVersion = versionDoc.data()!['latestVersion'];
      checkForAppUpdate(latestAppVersion);
    } catch (e) {
      print('Error fetching latest version: $e');
    }
  }


  void pacakge_display()async{
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String currentAppVersion = packageInfo.version;

    print(currentAppVersion);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
   // pacakge_display();
    fetchLatestAppVersion();
  }
  @override
  Widget build(BuildContext context) {

    return demo_app();

        /* Center(
        child: TextButton(onPressed: (){

          // send notification from one device to another
          notificationServices.getDeviceToken().then((value)async{

            var data = {
              'to' : value.toString(),
              'notification' : {
                'title' : 'Asif' ,
                'body' : 'Subscribe to my channel' ,
                "sound": "jetsons_doorbell.mp3"
              },

              'data' : {
                'type' : 'positional' ,
                'id' : 'Asif Taj'
              }
            };

            await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
                body: jsonEncode(data) ,
                headers: {
                  'Content-Type': 'application/json; charset=UTF-8',
                  'Authorization' : 'key=AAAACfmsbHQ:APA91bH3q_jd6JnmhMDdrzEe3I1lJQ7NUjQNfnjK-eUSdxNc1hcRg7gcWxMnpK7_4erCdTN_fQ6EmJ8c6nyTpiEL_sD1v3BenGIzwZ1iF4R2zHUvtP92xujobWVEa6BTilxClL-bH3h8'
                }
            ).then((value){
              if (kDebugMode) {
                print(value.body.toString());
              }
            }).onError((error, stackTrace){
              if (kDebugMode) {
                print(error);
              }
            });
          });
        },
            child: Text('Send Notifications')),
      ),
    );*/

  }
}