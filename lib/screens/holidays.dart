import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:stock_market/model/service.dart';

import '../model/model.dart';
import '../widget/Const_data.dart';

void main() {
  runApp(holidays());
}

class holidays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all(13),
              width: 30,
              height: 20,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
              child: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
            ),
          ),
          title: Text(
            "Yearly Holiday's",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w800,
              height: 0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 30,
                color: Colors.black,
              ),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height -100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(41, 42, 41, 5),
                          Color.fromRGBO(90, 90, 90, .6),
                          Color.fromRGBO(41, 42, 41, 5),
                        ],
                      ),
                    ),
                  ),
                  CustomTable(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTable extends StatelessWidget {
  String formatDate(DateTime date) {
    print(date);
    return DateFormat('MMMM dd, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Holiday>>(
      future: fetchHolidays(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpinKitFadingCube(
                  color: Colors.black,
                  size: 50.0,
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final holidayData = snapshot.data!;
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Holiday\'s name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Day',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.0),
                for (var item in holidayData) ...[
                  Container(
                    color: Color.fromRGBO(122, 122, 122, 1),
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            item.name,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                             formatDate(DateTime.parse(item.date))  ,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            item.day,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                ],
              ],
            ),
          );
        }
      },
    );
  }

  Future<List<Holiday>> fetchHolidays() async {
    print("object");
    try {
      final Uri uri = Uri.parse('${const_data().Api_url}/show_holidays.php');
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});

      final http.Client client = http.Client();
      final http.StreamedResponse streamedResponse = await client.send(request);
      final http.Response response =
          await http.Response.fromStream(streamedResponse);
      print(response.body);

      if (response.statusCode == 200) {
        final List<dynamic> rawDataList = json.decode(response.body);
        print(rawDataList);
        final List<Holiday> shareDetailsList =
            rawDataList.map((rawData) => Holiday.fromJson(rawData)).toList();

        return shareDetailsList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(holidays());
// }
//
// class holidays extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//
//         //backgroundColor: Colors.black,
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.black,
//           leading: Row(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStatePropertyAll(Colors.white),
//                   shape: MaterialStatePropertyAll(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                   ),
//                 ),
//                 icon: Icon(
//                   Icons.arrow_back,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//           title: Text(
//             'Yearly Holiday’s',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontFamily: 'Inter',
//               fontWeight: FontWeight.w800,
//               height: 0,
//             ),
//           ),
//         ),
//         body: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color.fromRGBO(90, 90, 90, 5),
//                   Color.fromRGBO(90, 90, 90, .1),
//                 ],
//               ),
//             ),
//             child: CustomTable()),
//       ),
//     );
//   }
// }
//
// class CustomTable extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Table(
//       defaultColumnWidth: IntrinsicColumnWidth(),
//       children: [
//         TableRow(
//           children: [
//             TableCell(
//               child: Container(
//                 color: Colors.white,
//                 padding: EdgeInsets.all(8.0),
//                 child: Text('Name'),
//               ),
//             ),
//             TableCell(
//               child: Container(
//                 color: Colors.white,
//                 padding: EdgeInsets.all(8.0),
//                 child: Text('Date'),
//               ),
//             ),
//             TableCell(
//               child: Container(
//                 color: Colors.white,
//                 padding: EdgeInsets.all(8.0),
//                 child: Text('Day'),
//               ),
//             ),
//           ],
//         ),
//         for (var item in data) ...[
//           TableRow(
//             children: [
//               TableCell(
//                 child: Container(
//                   color: Color.fromRGBO(122,122, 122, 1),
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(item['name']),
//                 ),
//               ),
//               TableCell(
//                 child: Container(
//                   color: Color.fromRGBO(122,122, 122, 1),
//                   //  color: Colors.transparent,
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(item['date']),
//                 ),
//               ),
//               TableCell(
//                 child: Container(
//                   color: Color.fromRGBO(122,122, 122, 1),
//                   //  color: Colors.transparent,
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(item['day']),
//                 ),
//               ),
//             ],
//           ),
//           // Add a blank row after each data row
//           TableRow(
//             children: [
//               TableCell(
//                 child: Container(
//                   color: Colors.transparent,
//                   // decoration: BoxDecoration(
//                   //   gradient: LinearGradient(
//                   //     begin: Alignment.topCenter,
//                   //     end: Alignment.bottomCenter,
//                   //     colors: [
//                   //       Color.fromRGBO(90, 90, 90, 5),
//                   //       Color.fromRGBO(90, 90, 90, .1),
//                   //     ],
//                   //   ),
//                   // ),
//                   height: 5.0,
//                 ),
//               ),
//               TableCell(
//                 child: Container(
//                   color: Colors.transparent,
//                   // decoration: BoxDecoration(
//                   //   gradient: LinearGradient(
//                   //     begin: Alignment.topCenter,
//                   //     end: Alignment.bottomCenter,
//                   //     colors: [
//                   //       Color.fromRGBO(90, 90, 90, 5),
//                   //       Color.fromRGBO(90, 90, 90, .1),
//                   //     ],
//                   //   ),
//                   // ),
//                   height: 5.0,
//                 ),
//               ),
//               TableCell(
//                 child: Container(
//                   color: Colors.transparent,
//                   // decoration: BoxDecoration(
//                   //   gradient: LinearGradient(
//                   //     begin: Alignment.topCenter,
//                   //     end: Alignment.bottomCenter,
//                   //     colors: [
//                   //       Color.fromRGBO(90, 90, 90, 5),
//                   //       Color.fromRGBO(90, 90, 90, .1),
//                   //     ],
//                   //   ),
//                   // ),
//                   height: 5.0,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ],
//     );
//   }
// }
//
// final List<Map<String, dynamic>> data = [
//   {"name": "Republic Day", "date": "January 26, 2024", "day": "Friday"},
//   {"name": "Maha Shivratri", "date": "January 26, 2024", "day": "Friday"},
//   {"name": "Holi", "date": "January 26, 2024", "day": "Friday"},
//   {"name": "Good Friday", "date": "January 26, 2024", "day": "Friday"},
//   {"name": "Eid-Ul-Fitr (Ramzan Eid)", "date": "January 26, 2024", "day": "Friday"},
//   {"name": "Maharashtra Day", "date": "January 26, 2024", "day": "Friday"},
//   {"name": "Bakri Eid", "date": "January 26, 2024", "day": "Friday"},
//   {"name": "Moharram'", "date": "January 26, 2024", "day": "Friday"},
//   {"name": "Independence Day", "date": "January 26, 2024", "day": "Friday"},
//   {"name": "Mahatma Gandhi Jayanti", "date": "January 26, 2024", "day": "Friday"},
//   {"name": "Diwali-Laxmi Pujan", "date": "January 26, 2024", "day": "Friday"},
//   {"name": "Gurunanak Jayanti", "date": "January 26, 2024", "day": "Friday"},
//   {"name": "Christmas", "date": "January 26, 2024", "day": "Friday"},
// ];

