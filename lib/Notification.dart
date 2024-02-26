import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_market/screens/intraday.dart';
import 'package:stock_market/screens/intraday_history.dart';
import 'package:stock_market/screens/ipo.dart';
import 'package:stock_market/screens/long_term.dart';
import 'package:stock_market/screens/longterm_history.dart';
import 'package:stock_market/screens/medium_term.dart';
import 'package:stock_market/screens/midterm_history.dart';
import 'package:stock_market/screens/positional.dart';
import 'package:stock_market/screens/positional_history.dart';
import 'package:stock_market/screens/short_term.dart';
import 'package:stock_market/screens/shortterm_history.dart';
import 'package:stock_market/widget/Const_data.dart';

import 'model/model.dart';
import 'model/providers.dart';

class Data {
  final String id;
  final String typeId;
  final String callId;
  final String callName;
  final String data;
  final String bodyData;
  final String date;

  Data({
    required this.id,
    required this.typeId,
    required this.callId,
    required this.callName,
    required this.data,
    required this.bodyData,
    required this.date,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      typeId: json['type_id'],
      callId: json['call_id'],
      callName: json['call_name'],
      data: json['data'],
      bodyData: json['body_data'],
      date: json['date'],
    );
  }
}

Future<List<Data>> fetchNotificationDatas() async {
  final response = await http.post(
      Uri.parse('${const_data().Api_url}/notification.php'),
      headers: {"Authorization": "yp7280uvfkvdirgjkpo"});

  if (response.statusCode == 200) {
    final parsed =
    json.decode(response.body)['data'].cast<Map<String, dynamic>>();
    return parsed.map<Data>((json) => Data.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late ScrollController _scrollController;
  late Notification_data _apiService;

  List<String> currentList = [];
  @override
  void initState() {
    // TODO: implement initState

  }
  @override


  void fetchNotificationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? notificationData = prefs.getStringList("notifications");
    if (notificationData != null) {
      setState(() {
        currentList = notificationData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Notification_data provider = Provider.of<Notification_data>(context,listen: false);

    return ChangeNotifierProvider(
      create: (context) => Notification_data(),
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "assets/img_11.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: h > 700
                  ? h > 850
                  ? 330
                  : 320
                  : 220,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                //color: Colors.pink,
                width: screenWidth,
                height: MediaQuery.of(context).size.height * .6,
                child: StreamBuilder<List<Data>>(
                  stream: fetchNotificationDatas().asStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData) {
                      List<Data> dataList = snapshot.data!;
                      // Group data by date
                      Map<String, List<Data>> groupedData = {};
                      for (var data in dataList) {
                        String date = _formatDate(data.date.toString());
                        if (!groupedData.containsKey(date)) {
                          groupedData[date] = [];
                        }
                        groupedData[date]!.add(data);
                      }
                      print(groupedData);
                      if (snapshot.data!.isEmpty) {
                        return Center(child: Text("No data Found"));
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: groupedData.length,
                        itemBuilder: (context, index) {
                          var entry = groupedData.entries.elementAt(index);
                          var notificationIds = provider.id ?? []; // Get stored notification IDs or an empty list if null

                          // Split entry.value into two lists: storedIds and nonStoredIds
                          var storedIds = entry.value.where((data) => notificationIds.contains(data.id)).toList();
                          var nonStoredIds = entry.value.where((data) => !notificationIds.contains(data.id)).toList();

                          // Combine the nonStoredIds list followed by the storedIds list
                          var combinedList = [...nonStoredIds, ...storedIds];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                entry.key,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ...combinedList.map((data) => InkWell(
                                onTap: () {
                                  provider.setId(data.id);

                                  bool close_call = data.data
                                      .contains("Trade Close");
                                  bool exit_call = data.data
                                      .contains("Stoploss Occurred Exit");
                                  print("Trade is Close $close_call");
                                  print("Trade is Exit $exit_call");

                                  //print(data.read);
                                  if (data.typeId.isNotEmpty) {
                                    String notificationType =
                                        data.typeId;
                                    if (notificationType == "1") {
                                      if (exit_call) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Intraday_history(
                                                        title:
                                                        data.callId
                                                            .trim())));
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Intraday_Live_Calls(
                                                      title: data.callId
                                                          .trim(),
                                                      call_index: close_call
                                                          ? 1
                                                          : 0,
                                                    )));
                                      }
                                    } else if (notificationType == "2") {
                                      print(
                                          "====> ${data.callId}");
                                      if (exit_call) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Positional_history(
                                                        title:
                                                        data.callId
                                                            .trim())));
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    positional_live_calls(
                                                      title: data.callId
                                                          .trim(),
                                                      call_index: close_call
                                                          ? 1
                                                          : 0,
                                                    )));
                                      }
                                    } else if (notificationType == "11") {
                                      if (close_call || exit_call) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Short_history(
                                                        title:
                                                        data.callId
                                                            .trim())));
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    short_term_live_calls(
                                                        title:
                                                        data.callId
                                                            .trim())));
                                      }
                                    } else if (notificationType == "13") {
                                      if (close_call || exit_call) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Longterm_history(
                                                        title:
                                                        data.callId
                                                            .trim())));
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    long_term_live_calls(
                                                        title:
                                                        data.callId
                                                            .trim())));
                                      }
                                    } else if (notificationType == "12") {
                                      if (close_call || exit_call) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    midterm_history(
                                                        title:
                                                        data.callId
                                                            .trim())));
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    mid_term_live_calls(
                                                        title: data.callId
                                                            .trim())));
                                      }
                                    }
                                    else if (notificationType == "3") {
                                      if (close_call || exit_call) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    midterm_history(
                                                        title:
                                                        data.callId
                                                            .trim())));
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Ipo_main(
                                                        title: data.callId
                                                            .trim())));
                                      }
                                    }
                                  }
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 5),
                                  padding: EdgeInsets.only(bottom: 5, top: 5),
                                  width: MediaQuery.of(context).size.width * .9,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: notificationIds.contains(data.id) ? Color(0xFFCFCFCF) : Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          data.data,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: notificationIds.contains(data.id) ? Color(0xFFCFCFCF) : Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          data.bodyData,
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: notificationIds.contains(data.id) ? Color(0xFFCFCFCF) : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                            ],
                          );
                        },
                      );

                    }
                    /*else if(snapshot.data!.isEmpty){
                      return Text("No Notification found");
                    }*/
                    /*else {
                      return Center(child: CircularProgressIndicator());
                    }*/
                    return Container();
                  },
                ),
              ),
            ),
            /*Positioned(
              top: h > 700
                  ? h > 850
                      ? 330
                      : 300
                  : 220,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: screenWidth,
                decoration: const BoxDecoration(
                  //  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: StreamBuilder<List<Data>>(
                  stream: Stream.periodic(Duration(seconds: 10)).asyncMap((_) => fetchNotificationDatas()),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Data> dataList = snapshot.data!;
                      return ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(dataList[index].name),
                            subtitle: Text(dataList[index].data),
                            // Add more fields as needed
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),*/
            Positioned(
              top: 40,
              left: 20,
              child: InkWell(
                onTap: () async {
                  /*SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                      Provider.of<NotificationProvider>(context,listen: false).notifications.clear();
*/
                  //                display();
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _formatDate(String dateStr) {
    DateTime date = DateTime.parse(dateStr);
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime.now().subtract(Duration(days: 1));

    if (DateFormat('yyyy-MM-dd').format(date) ==
        DateFormat('yyyy-MM-dd').format(now)) {
      return 'Today';
    } else if (DateFormat('yyyy-MM-dd').format(date) ==
        DateFormat('yyyy-MM-dd').format(yesterday)) {
      return 'Yesterday';
    } else {
      return DateFormat('dd MMM yyyy').format(date);
    }
  }
}
