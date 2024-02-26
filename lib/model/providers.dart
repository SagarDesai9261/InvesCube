import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Notification.dart';
import '../widget/Const_data.dart';
import 'model.dart';

class ToggleProvider with ChangeNotifier {
  bool _showStrengthRisk = true;
  bool _showAboutDisplay = true;

  bool get showStrengthRisk => _showStrengthRisk;
  bool get showAboutDisplay => _showAboutDisplay;

  void toggleStrengthRisk() {
    _showStrengthRisk = !_showStrengthRisk;
    notifyListeners();
  }

  void toggleAboutDisplay() {
    _showAboutDisplay = !_showAboutDisplay;
    notifyListeners();
  }
}

class AboutDisplayProvider with ChangeNotifier {
  bool _isAboutDisplay = false;

  bool get isAboutDisplay => _isAboutDisplay;

  void toggleAboutDisplay() {
    _isAboutDisplay = !_isAboutDisplay;
    notifyListeners();
  }
}

class StrengthDisplayProvider with ChangeNotifier {
  bool _isStrengthDisplay = false;
  bool _strengthRisk = false;

  bool get isStrengthDisplay => _isStrengthDisplay;
  bool get strengthRisk => _strengthRisk;

  void toggleStrengthDisplay() {
    _isStrengthDisplay = !_isStrengthDisplay;
    notifyListeners();
  }

  void setStrengthRisk(bool value) {
    _strengthRisk = value;
    notifyListeners();
  }
}

class FeedbackProvider with ChangeNotifier {
  Future<void> submitFeedback(
      BuildContext context, int star, String description) async {
    try {
      // Set loading state
      _setLoadingState(true);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString("user_id");

      // Your existing code to get star and description

      // API endpoint
      final String apiUrl = '${const_data().Api_url}/feedback.php';

      // Create a MultipartRequest
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
      // Add form data to the request
      request.fields['user_id'] = userId!;
      request.fields['star'] = star.toString();
      request.fields['description'] = description;

      // Send the request
      var response = await request.send();

      // Check the status code of the response
      if (response.statusCode == 200) {
        // Request successful
        print('Feedback submitted successfully');
      } else {
        // Request failed
        print('Failed to submit feedback. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle errors
      print('Error submitting feedback: $error');
    } finally {
      // Set loading state to false when the operation is complete
      _setLoadingState(false);
    }
  }

  void _setLoadingState(bool isLoading) {
    // Update the loading state
    loading = isLoading;
    notifyListeners();
  }

  bool loading = false;
}

class CarouselIndexProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int _totalIndexValue = 0;
  int get currentIndex => _currentIndex;
  int get totalIndexValue => _totalIndexValue;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setTotal(int index) {
    _totalIndexValue = index;
    notifyListeners();
  }
}

class BottomSheetProvider extends ChangeNotifier {
  bool _isBottomSheetOpen = true;

  bool get isBottomSheetOpen => _isBottomSheetOpen;

  void setBottomSheetState(bool isOpen) {
    _isBottomSheetOpen = isOpen;
    print(isOpen);
    notifyListeners();
  }
}

class UserInfoProvider with ChangeNotifier {
  String _accountName = 'Default Name';
  String _accountEmail = 'Default account Mobile';
  String _accountImage = '';
  String _accountID = '';

  String get accountName => _accountName;
  String get accountEmail => _accountEmail;
  String get accountImage => _accountImage;
  String get accountID => _accountID;

  setImage(String image) {
    _accountImage = image;

    notifyListeners();
  }

  UserInfoProvider() {
    // Call the method to initialize values from SharedPreferences
    getUserInfo();
  }
  Future<void> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _accountName = prefs.getString('accountName') ?? 'Default Name';
    _accountEmail =
        prefs.getString('accountMobile') ?? 'Default account Mobile';
    _accountImage = prefs.getString('accountImage') ?? '';
    _accountID = prefs.getString('accountId') ?? '';

    notifyListeners();
  }
}

class NotificationProvider extends ChangeNotifier {
  List<NotificationData> notifications = [];

  void addNotification(NotificationData notification) {
    notifications.add(notification);
    notifyListeners();
  }

  Future<List<NotificationData>> getNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedNotifications = prefs.getStringList("notifications") ?? [];

    notifications.clear();
    if (storedNotifications!.length != 0) {
      for (String notificationString in storedNotifications!) {
        Map<String, dynamic> notificationMap = json.decode(notificationString);
        NotificationData notification = NotificationData(
          message: notificationMap['message'],
          type: notificationMap['type'],
          read: notificationMap['read'],
          title: notificationMap["title"],
          call_type: notificationMap["call_type"] ?? "",
          id: notificationMap['id'] ?? "",
          timestamp: notificationMap['timestamp'] ?? "", // Add timestamp field
        );

        // Check if a similar notification already exists
        bool alreadyExists = notifications.any((existingNotification) =>
        existingNotification.message == notification.message &&
            existingNotification.type == notification.type &&
            existingNotification.title == notification.title &&
            existingNotification.timestamp == notification.timestamp); // Check timestamp

        if (!alreadyExists) {
          addNotification(notification);
        }
      }
    }

    return notifications;
  }

}

class Midterm_history_data with ChangeNotifier {
  final String apiUrl = "${const_data().Api_url}/delivey_history.php";
  int _pageNumber = 1; // initial page number
  bool _isLoading = false;
  List<DataList> _dataList = [];
  int _totalRecords = 0;
  bool _hasMore = true;
  List<DataList> get dataList => _dataList;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> fetchData() async {
    //try {
      _isLoading = true;
      notifyListeners();

      final Uri uri = Uri.parse(apiUrl);
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
      request.fields['cat_id'] = "12";
      request.fields['page'] = _pageNumber.toString(); // add pagination

      final http.Client client = http.Client();
      final http.StreamedResponse streamedResponse = await client.send(request);
      final http.Response response =
      await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final ApiResponse apiResponse = ApiResponse.fromJson(jsonData);
        if(apiResponse.data!.length < 10){

          _hasMore = false;
        }
        print(apiResponse.data!.length);
        _dataList.addAll(apiResponse.data ?? []);
        _totalRecords = apiResponse.pagination?.totalRecords ?? 0;
        _isLoading = false;
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    /*} catch (e) {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error: $e');
    }*/
  }

  void loadMoreData() {
    if (_dataList.length < _totalRecords) {
      _pageNumber++; // increase page number for pagination
      fetchData(); // fetch more data
    }
  }
}
class Short_history_data with ChangeNotifier {
  final String apiUrl = "${const_data().Api_url}/delivey_history.php";
  int _pageNumber = 1; // initial page number
  bool _isLoading = false;
  List<DataList> _dataList = [];
  int _totalRecords = 0;
  bool _hasMore = true;
  List<DataList> get dataList => _dataList;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> fetchData() async {
    //try {
    _isLoading = true;
    notifyListeners();

    final Uri uri = Uri.parse(apiUrl);
    final http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
    request.fields['cat_id'] = "11";
    request.fields['page'] = _pageNumber.toString(); // add pagination

    final http.Client client = http.Client();
    final http.StreamedResponse streamedResponse = await client.send(request);
    final http.Response response =
    await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final ApiResponse apiResponse = ApiResponse.fromJson(jsonData);
      if(apiResponse.data!.length < 10){

        _hasMore = false;
      }
      _dataList.addAll(apiResponse.data ?? []);
      _totalRecords = apiResponse.pagination?.totalRecords ?? 0;
      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
    /*} catch (e) {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error: $e');
    }*/
  }

  void loadMoreData() {
    if (_dataList.length < _totalRecords) {
      _pageNumber++; // increase page number for pagination
      fetchData(); // fetch more data
    }
  }
}
class Longterm_history_data with ChangeNotifier {
  final String apiUrl = "${const_data().Api_url}/delivey_history.php";
  int _pageNumber = 1; // initial page number
  bool _isLoading = false;
  List<DataList> _dataList = [];
  int _totalRecords = 0;
  bool _hasMore = true;
  List<DataList> get dataList => _dataList;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> fetchData() async {
    //try {
    _isLoading = true;
    notifyListeners();

    final Uri uri = Uri.parse(apiUrl);
    final http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
    request.fields['cat_id'] = "13";
    request.fields['page'] = _pageNumber.toString(); // add pagination

    final http.Client client = http.Client();
    final http.StreamedResponse streamedResponse = await client.send(request);
    final http.Response response =
    await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final ApiResponse apiResponse = ApiResponse.fromJson(jsonData);
      if(apiResponse.data!.length < 10){

        _hasMore = false;
      }
      _dataList.addAll(apiResponse.data ?? []);
      _totalRecords = apiResponse.pagination?.totalRecords ?? 0;
      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
    /*} catch (e) {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error: $e');
    }*/
  }

  void loadMoreData() {
    if (_dataList.length < _totalRecords) {
      _pageNumber++; // increase page number for pagination
      fetchData(); // fetch more data
    }
  }
}


class Intraday_history_data with ChangeNotifier {
  final String apiUrl = "${const_data().Api_url}/intraday_history.php";
  int _pageNumber = 1; // initial page number
  bool _isLoading = false;
  List<DataList> _dataList = [];
  int _totalRecords = 0;
  bool _hasMore = true;
  List<DataList> get dataList => _dataList;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> fetchData() async {
    //try {
    _isLoading = true;
    notifyListeners();

    final Uri uri = Uri.parse(apiUrl);
    final http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
    request.fields['cat_id'] = "1";
    request.fields['page'] = _pageNumber.toString(); // add pagination

    final http.Client client = http.Client();
    final http.StreamedResponse streamedResponse = await client.send(request);
    final http.Response response =
    await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final ApiResponse apiResponse = ApiResponse.fromJson(jsonData);
      if(apiResponse.data!.length < 10){

        _hasMore = false;
      }
      _dataList.addAll(apiResponse.data ?? []);
      _totalRecords = apiResponse.pagination?.totalRecords ?? 0;
      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
    /*} catch (e) {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error: $e');
    }*/
  }

  void loadMoreData() {
    if (_dataList.length < _totalRecords) {
      _pageNumber++; // increase page number for pagination
      fetchData(); // fetch more data
    }
  }
}

class Positional_history_data with ChangeNotifier {
  final String apiUrl = "${const_data().Api_url}/intraday_history.php";
  int _pageNumber = 1; // initial page number
  bool _isLoading = false;
  List<DataList> _dataList = [];
  int _totalRecords = 0;
  bool _hasMore = true;
  List<DataList> get dataList => _dataList;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> fetchData() async {
    //try {
    _isLoading = true;
    notifyListeners();

    final Uri uri = Uri.parse(apiUrl);
    final http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
    request.fields['cat_id'] = "2";
    request.fields['page'] = _pageNumber.toString(); // add pagination

    final http.Client client = http.Client();
    final http.StreamedResponse streamedResponse = await client.send(request);
    final http.Response response =
    await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final ApiResponse apiResponse = ApiResponse.fromJson(jsonData);
      if(apiResponse.data!.length < 10){

        _hasMore = false;
      }
      _dataList.addAll(apiResponse.data ?? []);
      _totalRecords = apiResponse.pagination?.totalRecords ?? 0;
      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
    /*} catch (e) {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error: $e');
    }*/
  }

  void loadMoreData() {
    if (_dataList.length < _totalRecords) {
      _pageNumber++; // increase page number for pagination
      fetchData(); // fetch more data
    }
  }
}

class Close_call with ChangeNotifier {
  final String apiUrl = "${const_data().Api_url}/close_call.php";
  int _pageNumber = 1; // initial page number
  bool _isLoading = false;
  List<DataList> _dataList = [];
  int _totalRecords = 0;
  bool _hasMore = true;
  List<DataList> get dataList => _dataList;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> fetchData() async {
    try {
      _isLoading = true;
      notifyListeners();

      final Uri uri = Uri.parse(apiUrl);
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
      request.fields['cat_id'] = "1";
      request.fields['page'] = _pageNumber.toString(); // add pagination

      final http.Client client = http.Client();
      final http.StreamedResponse streamedResponse = await client.send(request);
      final http.Response response =
      await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final ApiResponse apiResponse = ApiResponse.fromJson(jsonData);
        if(apiResponse.data!.length < 10){

          _hasMore = false;
        }
        _dataList.addAll(apiResponse.data ?? []);
        _totalRecords = apiResponse.pagination?.totalRecords ?? 0;
        _isLoading = false;
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error: $e');
    }
  }

  void loadMoreData() {
    if (_dataList.length < _totalRecords) {
      _pageNumber++; // increase page number for pagination
      fetchData(); // fetch more data
    }
  }
}

class Midterm_data with ChangeNotifier {
  final String apiUrl = "${const_data().Api_url}/show_investment.php";
  int _pageNumber = 1; // initial page number
  bool _isLoading = false;
  List<DataList> _dataList = [];
  int _totalRecords = 0;
  bool _hasMore = true;
  List<DataList> get dataList => _dataList;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> fetchData() async {
    //try {
    _isLoading = true;
    notifyListeners();

    final Uri uri = Uri.parse(apiUrl);
    final http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
    request.fields['cat_id'] = "12";
    request.fields['page'] = _pageNumber.toString(); // add pagination

    final http.Client client = http.Client();
    final http.StreamedResponse streamedResponse = await client.send(request);
    final http.Response response =
    await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final ApiResponse apiResponse = ApiResponse.fromJson(jsonData);
      if(apiResponse.data!.length < 10){

        _hasMore = false;
      }
      _dataList.addAll(apiResponse.data ?? []);
      _totalRecords = apiResponse.pagination?.totalRecords ?? 0;
      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
    /*} catch (e) {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error: $e');
    }*/
  }

  void loadMoreData() {
    if (_dataList.length < _totalRecords) {
      _pageNumber++; // increase page number for pagination
      fetchData(); // fetch more data
    }
  }
}
class Short_data with ChangeNotifier {
  final String apiUrl = "${const_data().Api_url}/show_investment.php";
  int _pageNumber = 1; // initial page number
  bool _isLoading = false;
  List<DataList> _dataList = [];
  int _totalRecords = 0;
  bool _hasMore = true;
  List<DataList> get dataList => _dataList;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> fetchData() async {
    //try {
    _isLoading = true;
    notifyListeners();

    final Uri uri = Uri.parse(apiUrl);
    final http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
    request.fields['cat_id'] = "11";
    request.fields['page'] = _pageNumber.toString(); // add pagination

    final http.Client client = http.Client();
    final http.StreamedResponse streamedResponse = await client.send(request);
    final http.Response response =
    await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final ApiResponse apiResponse = ApiResponse.fromJson(jsonData);
      if(apiResponse.data!.length < 10){

        _hasMore = false;
      }
      _dataList.addAll(apiResponse.data ?? []);
      _totalRecords = apiResponse.pagination?.totalRecords ?? 0;
      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
    /*} catch (e) {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error: $e');
    }*/
  }

  void loadMoreData() {
    if (_dataList.length < _totalRecords) {
      _pageNumber++; // increase page number for pagination
      fetchData(); // fetch more data
    }
  }
}
class Longterm_data with ChangeNotifier {
  final String apiUrl = "${const_data().Api_url}/show_investment.php";
  int _pageNumber = 1; // initial page number
  bool _isLoading = false;
  List<DataList> _dataList = [];
  int _totalRecords = 0;
  bool _hasMore = true;
  List<DataList> get dataList => _dataList;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> fetchData() async {
    //try {
    _isLoading = true;
    notifyListeners();

    final Uri uri = Uri.parse(apiUrl);
    final http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.headers.addAll({"Authorization": "yp7280uvfkvdirgjkpo"});
    request.fields['cat_id'] = "13";
    request.fields['page'] = _pageNumber.toString(); // add pagination

    final http.Client client = http.Client();
    final http.StreamedResponse streamedResponse = await client.send(request);
    final http.Response response =
    await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final ApiResponse apiResponse = ApiResponse.fromJson(jsonData);
      if(apiResponse.data!.length < 10){

        _hasMore = false;
      }
      _dataList.addAll(apiResponse.data ?? []);
      _totalRecords = apiResponse.pagination?.totalRecords ?? 0;
      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
    /*} catch (e) {
      _isLoading = false;
      notifyListeners();
      throw Exception('Error: $e');
    }*/
  }

  void loadMoreData() {
    if (_dataList.length < _totalRecords) {
      _pageNumber++; // increase page number for pagination
      fetchData(); // fetch more data
    }
  }
}
class CountDataProvider with ChangeNotifier {
  int _count = 0;
  List<String>? _id = [];

  int get count => _count;

  // Function to fetch count data from the API
  Future<void> fetchCountData() async {
    // try {
    _loadIdsFromPrefs();
    final response = await http.post(Uri.parse('${const_data().Api_url}/notification.php'),headers: {"Authorization": "yp7280uvfkvdirgjkpo"});
    if (response.statusCode == 200) {
      final parsed =
      json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      List<Data> data =  parsed.map<Data>((json) => Data.fromJson(json)).toList();
      int notStoredCount = 0;
      for (Data item in data) {
        if(_id != null){
          if(!_id!.contains(item.id)){
            notStoredCount ++ ;
          }
        }


      }
      //   print(notStoredCount);
      _count = notStoredCount ;
      notifyListeners();
    } else {
      throw Exception('Failed to load count data');
    }
    /* } catch (error) {
      throw Exception('Error: $error');
    }*/
  }
  Future<void> _loadIdsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedIds = prefs.getStringList('notificationIds') ?? [];
    if (savedIds.isNotEmpty) {
      _id = savedIds;
      notifyListeners();
    }
  }
}

class Notification_data with ChangeNotifier {
  List<String>? _id;

  List<String>? get id => _id;

  Notification_data() {
    _id = []; // Initialize the list
    _loadIdsFromPrefs(); // Load IDs from shared preferences when the provider is initialized
  }

  void setId(String id) {
    if (!_id!.contains(id)) {
      _id!.add(id);
      _saveIdsToPrefs(); // Save updated list to shared preferences
      notifyListeners();
    }
  }

  bool containsId(String id) {
    return _id!.contains(id);
  }

  // Function to load IDs from shared preferences
  Future<void> _loadIdsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedIds = prefs.getStringList('notificationIds');
    if (savedIds != null) {
      _id = savedIds;
      notifyListeners();
    }
  }

  // Function to save IDs to shared preferences
  Future<void> _saveIdsToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('notificationIds', _id!);
  }
}