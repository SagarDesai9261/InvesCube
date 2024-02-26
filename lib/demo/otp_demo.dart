import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/model.dart';
import '../widget/Const_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<IPO> upcomingIPOs = [];
  List<IPO> openIPOs = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final String apiUrl = '${const_data().Api_url}/show_ipo.php';
    final String authToken = 'yp7280uvfkvdirgjkpo';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Authorization': authToken},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      upcomingIPOs = data
          .where((ipo) => ipo['status'] == '0')
          .map<IPO>((ipo) => IPO.fromJson(ipo))
          .toList();
      openIPOs = data
          .where((ipo) => ipo['status'] == '1')
          .map<IPO>((ipo) => IPO.fromJson(ipo))
          .toList();
      setState(() {});
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('IPOs'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Upcoming IPOs',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              children: upcomingIPOs.map((ipo) {
                return ListTile(
                  title: Text(ipo.name),
                  subtitle: Text('Open Date: ${ipo.openDate}'),
                  leading: Image.network(ipo.image),
                );
              }).toList(),
            ),
            Text(
              'Open IPOs',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              children: openIPOs.map((ipo) {
                return ListTile(
                  title: Text(ipo.name),
                  subtitle: Text('Open Date: ${ipo.openDate}'),
                  leading: Image.network(ipo.image),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
