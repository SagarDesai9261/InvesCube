import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../demo/pdf_view.dart';
import '../model/model.dart';
import '../model/providers.dart';
import '../model/service.dart';

class Ipo_Detail extends StatelessWidget {
  String? id;
  Ipo_Detail({required this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "IPO Details",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent, //
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
      ),
      body: IpoDetailsPage(id: id,),
    );
  }
}

class IpoDetailsPage extends StatefulWidget {
  String? id;
  IpoDetailsPage({required this.id});
  @override
  State<IpoDetailsPage> createState() => _IpoDetailsPageState();
}

class _IpoDetailsPageState extends State<IpoDetailsPage> {
  bool isabout_display = false;
  double? _progress;
  bool isStrengths_display = false;
  bool strength_risk = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //List<String> strengthsList = ipo_data[0]["strengths"].split(',');
    //print(strengthsList);
    return FutureBuilder(
        future: IpoService().getIpoData(widget.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Center(
              child: SpinKitFadingCube(
                color: Colors.black,
                size: 50.0,
              ),
            );
          }

          String Strength = snapshot.data![0]["strengths"];
          List<String> Strength_list = Strength.split(",");
          String risk_data = snapshot.data![0]["risks"];
          List<String> risk_list = risk_data.split(",");
          String more_details = snapshot.data![0]["more_details"];
          List<String> more_details_list = more_details.split(",");
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    snapshot.data![0]["image"],
                    height: 80,
                    width: 90,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  snapshot.data![0]["name"],
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  snapshot.data![0]["companyd_escription"],
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6000000238418579),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Rs. ${snapshot.data![0]['minInvestment']}/${snapshot.data![0]['lot_size']}  Shares',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Minimum Investment',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6000000238418579),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(height: 16.0),
                _buildSectionHeader('IPO Details'),
                Divider(),
                _buildIpoDetails(context,snapshot.data!),
                SizedBox(height: 16.0),
                _buildSectionHeader('Application Details'),
                Divider(),
                Text(
                  ipoDetails.applicationDetails[0],
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6000000238418579),
                    fontSize: 10,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Apply as regular',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\u2022 Price is : ${snapshot.data![0]["issuePriceMin"]}-${snapshot.data![0]["issuePriceMax"]}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6000000238418579),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Text(
                  '\u2022 You can apply upto Rs. 2,00,000',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6000000238418579),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Apply as High Networth Individual',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\u2022 Price is : ${snapshot.data![0]["issuePriceMin"]}-${snapshot.data![0]["issuePriceMax"]}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6000000238418579),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    '\u2022 You can apply between Rs. 2,00,000 - Rs. 5,00,000',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6000000238418579),
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<AboutDisplayProvider>(
                  builder: (context, aboutDisplayProvider, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "About Company",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            aboutDisplayProvider.toggleAboutDisplay();
                          },
                          icon: aboutDisplayProvider.isAboutDisplay
                              ? Icon(
                                  Icons.keyboard_arrow_up,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.white,
                                ),
                        ),
                      ],
                    );
                  },
                ),
                Divider(),
                Consumer<AboutDisplayProvider>(
                  builder: (context, aboutDisplayProvider, _) {
                    return aboutDisplayProvider.isAboutDisplay
                        ? Column(
                            children: [
                              Table(
                                columnWidths: {
                                  0: FixedColumnWidth(
                                      100), // Adjust the width as needed
                                  1: FixedColumnWidth(
                                      MediaQuery.of(context).size.width -
                                          100), // Adjust the width as needed
                                },
                                children: [
                                  TableRow(children: [
                                    Text(
                                      'Founded In',
                                      style: TextStyle(
                                        color: Colors.white
                                            .withOpacity(0.6000000238418579),
                                        fontSize: 10,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    Text(
                                      '${snapshot.data![0]["founded"]}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    TableCell(
                                        child: SizedBox(
                                            height:
                                                10)), // Add space between rows
                                    TableCell(child: SizedBox(height: 10)),
                                  ]),
                                  TableRow(children: [
                                    Text(
                                      'Managing Director',
                                      style: TextStyle(
                                        color: Colors.white
                                            .withOpacity(0.6000000238418579),
                                        fontSize: 10,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    Text(
                                      '${snapshot.data![0]["managing"]}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${snapshot.data![0]["managing_details"]}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ],
                          )
                        : SizedBox.shrink();
                  },
                ),
                Consumer<StrengthDisplayProvider>(
                  builder: (context, strengthDisplayProvider, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Strength Display",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            strengthDisplayProvider.toggleStrengthDisplay();
                          },
                          icon: strengthDisplayProvider.isStrengthDisplay
                              ? Icon(
                                  Icons.keyboard_arrow_up,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.white,
                                ),
                        ),
                      ],
                    );
                  },
                ),
                Divider(),
                Consumer<StrengthDisplayProvider>(
                  builder: (context, strengthDisplayProvider, _) {
                    return strengthDisplayProvider.isStrengthDisplay
                        ? Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white), // Border color
                              borderRadius:
                                  BorderRadius.circular(10.0), // Border radius
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          strengthDisplayProvider
                                              .setStrengthRisk(false);
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset("assets/check.png",
                                                    height: 30, width: 30),
                                                Text(
                                                  'Strength',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height:
                                                    10), // Gap between text and line
                                            if (!strengthDisplayProvider
                                                .strengthRisk)
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                width: 40 * 2.0,
                                                height: 3, // Line height
                                                color:
                                                    Colors.green, // Line color
                                              ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          strengthDisplayProvider
                                              .setStrengthRisk(true);
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset("assets/wrong.png",
                                                    height: 20, width: 20),
                                                SizedBox(width: 5),
                                                Text(
                                                  'Risks',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height:
                                                    10), // Gap between text and line
                                            if (strengthDisplayProvider
                                                .strengthRisk)
                                              Container(
                                                width: 30 * 2.0,
                                                height: 3, // Line height
                                                color: Colors.red, // Line color
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (!strengthDisplayProvider.strengthRisk)
                                  _buildListTiles(Strength_list,strengthDisplayProvider),
                                if (strengthDisplayProvider.strengthRisk)
                                  _buildListTiles(risk_list,strengthDisplayProvider),
                              ],
                            ),
                          )
                        : SizedBox.shrink();
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'More about ${ipoDetails.companyName}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Image.asset(
                      "assets/pdf.png",
                      height: 30,
                      width: 30,
                    ),
                    title: Text(
                      '${ipoDetails.companyName}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                    subtitle: Text(
                      'Download RHP',
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 10,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                    trailing: InkWell(
                        onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>  PDFViewerCachedFromUrl(url:snapshot.data![0]["pdfDownloadUrl"],name:snapshot.data![0]["name"])));
 //                         PDFViewerCachedFromUrl(url:snapshot.data![0]["pdfDownloadUrl"],name:snapshot.data![0]["name"]);
  //                        downloadAndOpenPdf(snapshot.data![0]["pdfDownloadUrl"]);
                        },
                        child: Icon(
                          Icons.file_download_outlined,
                          size: 30,
                          color: Colors.white,
                        )),
                  ),
                )
              ],
            ),
          );
        });
  }

  final List<String> strengths = [
    'Strong financial performance - The company has consistently shown strong financial results...',
    'Diversified product portfolio - The company offers a wide range of products catering to different market segments...',
    'Established brand presence - The brand has a strong presence in the market and is widely recognized...',
    'Robust growth potential - The company has identified key growth opportunities and strategies for expansion...',
  ];

  final List<String> risks = [
    'Market competition - The industry is highly competitive, and the company may face challenges in standing out...',
    'Economic downturn - Economic fluctuations may impact consumer spending, affecting the company\'s revenue...',
    'Regulatory changes - Changes in regulations may require the company to adapt its operations, potentially leading to additional costs...',
    'Supply chain disruptions - Disruptions in the supply chain can impact production and distribution, affecting the company\'s ability to meet demand...',
  ];
  Widget _buildListTiles(List<String> items,StrengthDisplayProvider strengthDisplayProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => _buildListItem(item,strengthDisplayProvider)).toList(),
    );
  }

  Widget _buildListItem(String item, StrengthDisplayProvider strengthDisplayProvider) {
    return ListTile(
      leading: strengthDisplayProvider.strengthRisk == false
          ? Icon(
        Icons.check_circle,
        color: Colors.green,
      )
          : Image.asset(
        "assets/wrong.png",
        height: 25,
        width: 25,
      ),
      title: Text(
        item,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildIpoDetails(BuildContext context,List<Map<String,dynamic>> ipo_details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: _buildDetailRow(
                    '${ipo_details[0]["offer_date"]} - ${ipo_details[0]["close_date"]}',
                    'Bidding Dates')),
            SizedBox(
                width: MediaQuery.of(context).size.width * .3,
                child: _buildDetailRow(
                    'Rs. ${ipo_details[0]["minInvestment"]}', 'Min. Investment')),
          ],
        ),
        Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: _buildDetailRow('Rs. ${ipo_details[0]["issuePriceMin"]} - ${ipo_details[0]["issuePriceMax"]}', 'Price Range')),
            SizedBox(
                width: MediaQuery.of(context).size.width * .3,
                child: _buildDetailRow('${ipo_details[0]["lot_size"]}', 'Lot Size')),
          ],
        ),
        _buildDetailRow('${ipo_details[0]["issue_size"]}', 'Issue Size'),
      ],
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        subtitle: Text(
          value,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }

  Future<void> downloadAndOpenPdf(String url) async {
    PermissionStatus status = await Permission.storage.status;
    if (status != PermissionStatus.granted) {
      // Request storage permission
      PermissionStatus permissionStatus = await Permission.storage.request();
      if (permissionStatus != PermissionStatus.granted) {
        print('Permission denied');
        return;
      }
    }
    FileDownloader.downloadFile(

        url: url.isEmpty ?  "https://www.africau.edu/images/default/sample.pdf":url,
        onProgress: (name, progress) {
          setState(() {
            _progress = progress;
          });
        },
        onDownloadCompleted: (value) {
          print('path  $value ');
          setState(() {
            _progress = null;
          });
        });
  }

  IpoDetailsModel ipoDetails = IpoDetailsModel(
    companyName: 'DOMS Industries IPO',
    companyLogoPath: 'assets/doms.png',
    companyDescription: 'DOMS Industries Limited',
    issuePriceMin: 750.0,
    issuePriceMax: 790.0,
    lotSize: 18,
    biddingStartDate: '13 Dec ‘23',
    biddingEndDate: '15 Dec ‘23',
    minInvestment: 13500.0,
    issueSize: '1,200 Cr',
    applicationDetails: [
      'For DOMS Industries IPO, eligible investors can apply as Regular.',
      'Apply as regular',
      '\u2022 Price is : 750-790',
      '\u2022 You can apply upto Rs. 2,00,000',
      'Apply as High Networth Individual',
      '\u2022 Price is : 750-790',
      '\u2022 You can apply between Rs. 2,00,000 - Rs. 5,00,000',
    ],
    aboutCompany: [
      'Founded In: 2006',
      'Managing Director: Mr. Santosh Rasiklal Raveshia',
      'Established in 2006, DOMS Industries operates as a prominent player...',
    ],
    strengths: [
      'Strong financial performance - The company has consistently shown...',
      'Diversified product portfolio - The company offers a wide range...',
      'Established brand presence - The brand has a strong presence in the market...',
      'Robust growth potential - The company has identified key growth opportunities...',
    ],
    risks: [
      'Market competition - The industry is highly competitive, and the company may face challenges...',
      'Economic downturn - Economic fluctuations may impact consumer spending...',
      'Regulatory changes - Changes in regulations may require the company...',
      'Supply chain disruptions - Disruptions in the supply chain can impact production...',
    ],
    pdfDownloadUrl: 'https://www.africau.edu/images/default/sample.pdf',
  );
}
