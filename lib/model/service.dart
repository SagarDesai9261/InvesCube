import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widget/Const_data.dart';
import 'model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      GoogleSignIn().signOut();
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      print("hellow");
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}

class ipo_data {
  static const apiUrl = "https://admin.invescube.com/apis/show_ipo.php";

  Future<List<IPO>> getOpenIpos() async {
    final response = await http.post(Uri.parse(apiUrl),
        headers: {"Authorization": "yp7280uvfkvdirgjkpo"});
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return List<IPO>.from(data
          .where((ipo) => ipo['status'] == "1")
          .map((ipo) => IPO.fromJson(ipo)));
    } else {
      throw Exception("Failed to load open IPOs");
    }
  }

  Future<List<IPO>> getUpcomingIpos() async {
    final response = await http.post(Uri.parse(apiUrl),
        headers: {"Authorization": "yp7280uvfkvdirgjkpo"});
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return List<IPO>.from(data
          .where((ipo) => ipo['status'] == "0")
          .map((ipo) => IPO.fromJson(ipo)));
    } else {
      throw Exception("Failed to load upcoming IPOs");
    }
  }
}

class IpoService {
  final String apiUrl = "https://admin.invescube.com/apis/show_ipo_details.php";

  Future<List<Map<String, dynamic>>> getIpoData(String ipoId) async {
    try {
      final Uri uri = Uri.parse(apiUrl);
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
      request.fields['ipo_id'] = ipoId.toString();

      final http.Client client = http.Client();
      final http.StreamedResponse streamedResponse = await client.send(request);
      final http.Response response =
          await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final List<dynamic> rawData = json.decode(response.body)['data'];
        final List<Map<String, dynamic>> ipoData = List.from(rawData);

        return ipoData;
      } else {
        throw Exception('Failed to load IPO data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

class IpoDetailsService {
  final String apiUrl = "${const_data().Api_url}/get_details.php";
  // IpoDetailsService({required this.apiUrl});
  Future<List<DataList>>? getIpoDetails() async {
    try {
      final Uri uri = Uri.parse(apiUrl);
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
      request.fields['cat_id'] = "1";
      request.fields['page'] = "1";


      final http.Client client = http.Client();
      final http.StreamedResponse streamedResponse = await client.send(request);
      final http.Response response =
          await http.Response.fromStream(streamedResponse);
      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> rawDataList = json.decode(response.body)['data'];
        final List<DataList> shareDetailsList =
            rawDataList.map((rawData) => DataList.fromJson(rawData)).toList();
        print(shareDetailsList);
        return shareDetailsList;
      } else {
        throw Exception('Failed to load IPO details');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<DataList>>? getPostionalDetails() async {
    try {
      final Uri uri = Uri.parse(apiUrl);
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
      request.fields['cat_id'] = "2";
      request.fields['page'] = "1";


      final http.Client client = http.Client();
      final http.StreamedResponse streamedResponse = await client.send(request);
      final http.Response response =
          await http.Response.fromStream(streamedResponse);
      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> rawDataList = json.decode(response.body)['data'];
        final List<DataList> shareDetailsList =
            rawDataList.map((rawData) => DataList.fromJson(rawData)).toList();
        print(shareDetailsList);
        return shareDetailsList;
      } else {
        throw Exception('Failed to load IPO details');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
  Future<List<DataList>>? getHistoryData(int index) async {
    try {
      final String apiUrl = "${const_data().Api_url}/intraday_history.php";

      final Uri uri = Uri.parse(apiUrl);
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
      request.fields['cat_id'] = index.toString();
      request.fields['page'] = "1";


      final http.Client client = http.Client();
      final http.StreamedResponse streamedResponse = await client.send(request);
      final http.Response response =
      await http.Response.fromStream(streamedResponse);
      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> rawDataList = json.decode(response.body)['data'];
        final List<DataList> shareDetailsList =
        rawDataList.map((rawData) => DataList.fromJson(rawData)).toList();
        print(shareDetailsList);
        return shareDetailsList;
      } else {
        throw Exception('Failed to load IPO details');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
class mpin_check{
  String api = "https://admin.invescube.com/apis/mpin_check.php";
}

class ApiService {
  final String apiUrl = "${const_data().Api_url}/get_details.php";

  Future<List<DataList>> fetchData(int categoryId) async {
    try {
      final Uri uri = Uri.parse(apiUrl);
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
      request.fields['cat_id'] = categoryId.toString();
      final http.Client client = http.Client();
      final http.StreamedResponse streamedResponse = await client.send(request);
      final http.Response response =
          await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        final List<dynamic> rawDataList = json.decode(response.body)['data'];
        final List<DataList> shareDetailsList =
            rawDataList.map((rawData) => DataList.fromJson(rawData)).toList();

        return shareDetailsList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<DataList>> shorttermData(int categoryId) async {
    try {
      final Uri uri = Uri.parse("${const_data().Api_url}/show_investment.php");
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
      request.fields['cat_id'] = categoryId.toString();
      request.fields['page'] = "1";


      final http.Client client = http.Client();
      final http.StreamedResponse streamedResponse = await client.send(request);
      final http.Response response =
          await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final List<dynamic> rawDataList = json.decode(response.body)['data'];
        final List<DataList> shareDetailsList =
            rawDataList.map((rawData) => DataList.fromJson(rawData)).toList();
        print(rawDataList);
        return shareDetailsList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<DataList>> mediumtermData(int categoryId) async {
    try {
      final Uri uri = Uri.parse("${const_data().Api_url}/show_investment.php");
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
      request.fields['cat_id'] = categoryId.toString();
      request.fields['page'] = "1";

      final http.Client client = http.Client();
      final http.StreamedResponse streamedResponse = await client.send(request);
      final http.Response response =
          await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final List<dynamic> rawDataList = json.decode(response.body)['data'];
        final List<DataList> shareDetailsList =
            rawDataList.map((rawData) => DataList.fromJson(rawData)).toList();
        print(rawDataList);
        return shareDetailsList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<DataList>> longtermData(int categoryId) async {
    try {
      final Uri uri = Uri.parse("${const_data().Api_url}/show_investment.php");
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
      request.fields['cat_id'] = categoryId.toString();
      request.fields['page'] = "1";


      final http.Client client = http.Client();
      final http.StreamedResponse streamedResponse = await client.send(request);
      final http.Response response =
          await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final List<dynamic> rawDataList = json.decode(response.body)['data'];
        final List<DataList> shareDetailsList =
            rawDataList.map((rawData) => DataList.fromJson(rawData)).toList();
        print(rawDataList);
        return shareDetailsList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
  Future<List<DataList>> getHistoryInvestmentData(int categoryId) async {
    try {
      final Uri uri = Uri.parse("${const_data().Api_url}/delivey_history.php");
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
      request.fields['cat_id'] = categoryId.toString();
      request.fields['page'] = "1";

      final http.Client client = http.Client();
      final http.StreamedResponse streamedResponse = await client.send(request);
      final http.Response response =
      await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final List<dynamic> rawDataList = json.decode(response.body)['data'];
        final List<DataList> shareDetailsList =
        rawDataList.map((rawData) => DataList.fromJson(rawData)).toList();
        print(rawDataList);
        return shareDetailsList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Holiday>> fetchHolidays() async {
    try {
      final Uri uri = Uri.parse('${const_data().Api_url}/show_holidays.php');
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});

      final http.Client client = http.Client();
      final http.StreamedResponse streamedResponse = await client.send(request);
      final http.Response response =
          await http.Response.fromStream(streamedResponse);

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

class ipo_allotment_service {
  static String apiUrl = "${const_data().Api_url}/show_allotment.php";

  Future<List<ipo_allotment>> getOpenIpo_allotments() async {
    final response = await http.post(Uri.parse(apiUrl),
        headers: {"Authorization": "yp7280uvfkvdirgjkpo"});
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return List<ipo_allotment>.from(data
          .where((ipo) => ipo['status'] == "1")
          .map((ipo) => ipo_allotment.fromJson(ipo)));
    } else {
      throw Exception("Failed to load open IPOs");
    }
  }

  Future<List<ipo_allotment>> getUpcomingIpo_allotments() async {
    String apiUrl = "${const_data().Api_url}/upcoming_ipo.php";

    final response = await http.post(Uri.parse(apiUrl),
        headers: {"Authorization": "yp7280uvfkvdirgjkpo"});
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return List<ipo_allotment>.from(data
          .where((ipo) => ipo['status'] == "0")
          .map((ipo) => ipo_allotment.fromJson(ipo)));
    } else {
      throw Exception("Failed to load open IPOs");
    }
  }
}

class Basic_Education_Service {
  Future<List<Basic_Education>> fetchStockItems() async {
    String apiUrl = "${const_data().Api_url}/basic_knowledge.php";

    final response = await http.post(Uri.parse(apiUrl),
        headers: {"Authorization": "yp7280uvfkvdirgjkpo"});
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Basic_Education.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load stock items');
    }
  }

  Future<List<Basic_Education>> fetchBasicEducation(String id) async {
    String apiUrl = "${const_data().Api_url}/basic_knowledge.php";

    try {
      final http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
      request.fields['cat_id'] = id.toString();

      final http.Client client = http.Client();
      final http.StreamedResponse streamedResponse = await client.send(request);
      final http.Response response =
          await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final List<dynamic> rawDataList = json.decode(response.body)['data'];
        final List<Basic_Education> shareDetailsList = rawDataList
            .map((rawData) => Basic_Education.fromJson(rawData))
            .toList();
        print(rawDataList);
        return shareDetailsList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

class Slider_data {
  Future<List<SliderData>> fetchSliderData() async {
    String apiUrl = "${const_data().Api_url}/live_call.php";

    final response = await http.post(Uri.parse(apiUrl),
        headers: {"Authorization": "yp7280uvfkvdirgjkpo"});
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body)["data"];
      print(jsonList.length);
      return jsonList.map((json) => SliderData.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load stock items');
    }
  }
}

