import 'package:flutter/material.dart';

class IpoDetailsModel {
  String companyName;
  String companyLogoPath;
  String companyDescription;
  double issuePriceMin;
  double issuePriceMax;
  int lotSize;
  String biddingStartDate;
  String biddingEndDate;
  double minInvestment;
  String issueSize;
  List<String> applicationDetails;
  List<String> aboutCompany;
  List<String> strengths;
  List<String> risks;
  String pdfDownloadUrl;

  IpoDetailsModel({
    required this.companyName,
    required this.companyLogoPath,
    required this.companyDescription,
    required this.issuePriceMin,
    required this.issuePriceMax,
    required this.lotSize,
    required this.biddingStartDate,
    required this.biddingEndDate,
    required this.minInvestment,
    required this.issueSize,
    required this.applicationDetails,
    required this.aboutCompany,
    required this.strengths,
    required this.risks,
    required this.pdfDownloadUrl,
  });
}
class IPO {
  final String image;
  final String name;
  final String openDate;
  final String id;

  IPO({required this.image, required this.name,required this.id, required this.openDate});

  factory IPO.fromJson(Map<String, dynamic> json) {
    return IPO(
      image: json['image'],
      name: json['name'],
      openDate: json['open_date'],
       id:json['id']
    );
  }
}
class DataList {
  String? id;
  String? mainType;
  String? name;
  String? showDate;
  String? time;
  String? type;
  String? target;
  String? target1;
  String? target2;
  String? stoploss;
  String? targetStatus;
  String? target1Status;
  String? target2Status;
  String? stoplessStatus;
  String? callstatus;
  String? des;
  String? des1;
  String? date;
  String? entry;

  DataList(
      {this.id,
        this.mainType,
        this.name,
        this.showDate,
        this.time,
        this.type,
        this.target,
        this.target1,
        this.target2,
        this.stoploss,
        this.targetStatus,
        this.target1Status,
        this.target2Status,
        this.stoplessStatus,
        this.callstatus,
        this.des,
        this.des1,
        this.date,
        this.entry
      });

  DataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainType = json['main_type'];
    name = json['name'];
    showDate = json['show_date'];
    time = json['time'];
    type = json['type'];
    target = json['target'];
    target1 = json['target1'];
    target2 = json['target2'];
    stoploss = json['stoploss'];
    targetStatus = json['target_status'];
    target1Status = json['target1_status']; // Corrected from 'target1Status'
    target2Status = json['target2_status']; // Corrected from 'target1Status'
    stoplessStatus = json['stopless_status'];
    callstatus = json['call_status'];
    des = json['des'];
    des1 = json['des1'];
    date = json['date'];
    entry= json['entry'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main_type'] = this.mainType;
    data['name'] = this.name;
    data['show_date'] = this.showDate;
    data['time'] = this.time;
    data['type'] = this.type;
    data['target'] = this.target;
    data['target1'] = this.target1;
    data['target2'] = this.target2;
    data['stoploss'] = this.stoploss;
    data['target_status'] = this.targetStatus;
    data['target1_status'] = this.target1Status;
    data['target2_status'] = this.target2Status;
    data['stopless_status'] = this.stoplessStatus;
    data['call_status'] = this.callstatus;
    data['des'] = this.des;
    data['des1'] = this.des1;
    data['date'] = this.date;
    data['entry'] = this.entry;

    return data;
  }
}
// holiday_model.dart
class Holiday {
  final String name;
  final String date;
  final String day;

  Holiday({
    required this.name,
    required this.date,
    required this.day,
  });

  factory Holiday.fromJson(Map<String, dynamic> json) {
    return Holiday(
      name: json['name'] ?? '',
      date: json['holiday_date'] ?? '',
      day: json['day'] ?? '',
    );
  }
}

class ipo_allotment {
  String? type;
  String? status;
  String? name;
  String? image;
  String? allotmentLink;

  ipo_allotment(
      {this.type, this.status, this.name, this.image, this.allotmentLink});

  ipo_allotment.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    status = json['status'];
    name = json['name'];
    image = json['image'];
    allotmentLink = json['allotment_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['status'] = this.status;
    data['name'] = this.name;
    data['image'] = this.image;
    data['allotment_link'] = this.allotmentLink;
    return data;
  }
}
class Basic_Education {
  String id;
  String name;
  String image;
  String description;

  Basic_Education({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory Basic_Education.fromJson(Map<String, dynamic> json) {
    return Basic_Education(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
    );
  }
}
class SliderData {
  String? id;
  String? mainType;
  String? name;
  String? showDate;
  String? time;
  String? type;
  String? target;
  String? target1;
  String? target2;
  String? stoploss;
  String? targetStatus;
  String? target1Status;
  String? target2Status;
  String? stoplessStatus;
  String? callstatus;
  String? des;
  String? des1;
  String? date;
  String? call_name;
  String? entry;

  SliderData(
      {this.id,
        this.mainType,
        this.name,
        this.showDate,
        this.time,
        this.type,
        this.target,
        this.target1,
        this.target2,
        this.stoploss,
        this.targetStatus,
        this.target1Status,
        this.target2Status,
        this.stoplessStatus,
        this.callstatus,
        this.des,
        this.des1,
        this.date,
        this.call_name,this.entry
      });

  SliderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainType = json['main_type'];
    name = json['name'];
    showDate = json['show_date'];
    time = json['time'];
    type = json['type'];
    target = json['target'];
    target1 = json['target1'];
    target2 = json['target2'];
    stoploss = json['stoploss'];
    targetStatus = json['target_status'];
    target1Status = json['target1_status'];
    target2Status = json['target2_status'];
    stoplessStatus = json['stopless_status'];
    callstatus = json['call_status'];
    des = json['des'];
    des1 = json['des1'];
    date = json['date'];
    call_name = json['call_name'];
    entry = json["entry"]??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main_type'] = this.mainType;
    data['name'] = this.name;
    data['show_date'] = this.showDate;
    data['time'] = this.time;
    data['type'] = this.type;
    data['target'] = this.target;
    data['target1'] = this.target1;
    data['target2'] = this.target2;
    data['stoploss'] = this.stoploss;
    data['target_status'] = this.targetStatus;
    data['target1_status'] = this.target1Status;
    data['stopless_status'] = this.stoplessStatus;
    data['call_status'] = this.callstatus;
    data['des'] = this.des;
    data['des1'] = this.des1;
    data['date'] = this.date;
    data['call_name'] = this.call_name;data['entry'] = this.entry;

    return data;
  }
}
class NotificationData {
  String message;
  String type;
  bool read;
  String title;
  String call_type;
  String id;
  String timestamp; // New field for timestamp

  NotificationData({
    required this.message,
    required this.title,
    required this.type,
    required this.read,
    required this.id,
    required this.call_type,
    required this.timestamp, // Include timestamp in the constructor
  });
}

class ApiResponse {
  List<DataList>? data;
  Pagination? pagination;

  ApiResponse({this.data, this.pagination});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(DataList.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Pagination {
  int? page;
  int? perPage;
  int? totalRecords;

  Pagination({this.page, this.perPage, this.totalRecords});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = int.parse( json['page'].toString());
    perPage = int.parse( json['per_page'].toString());
    totalRecords = int.parse(json['total_records'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total_records'] = this.totalRecords;
    return data;
  }
}
