import 'dart:convert';
import 'dart:io';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_market/model/providers.dart';
import '../widget/Const_data.dart';
import '../widget/color.dart';
import 'logout.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: true,
      tools: [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => Profile(),
    ),
  );
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _uploadImage(String id) async {
    if (_image == null) {
      // Handle case where no image is selected
      return;
    }

    // Create a multipart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${const_data().Api_url}/update_profile.php'),
    );

    // Attach the file to the request
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        _image!.path,
      ),
    );

    // Add other form data
    request.fields['user_id'] = id;

    try {
      // Send the request
      var response = await request.send();
      print(response);
      final responseString = await response.stream.bytesToString();
      final response_data = json.decode(responseString);
      print(response_data);
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("accountImage", response_data["image_url"]);
        Provider.of<UserInfoProvider>(context, listen: false)
            .setImage(response_data["image_url"]);
        print('Image uploaded successfully');
        setState(() {});
      } else {
        // Handle the error
        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle the error
      print('Error uploading image: $error');
    }
  }

  Future<void> _pickImage(String id) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _uploadImage(id);
    }
  }

  Future<Map<String, String>> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accountName = prefs.getString('accountName') ?? 'Default Name';
    String accountEmail =
        prefs.getString('accountMobile') ?? 'Default accountMobile';
    String accountImage = prefs.getString('accountImage') ?? '';
    String accountID = prefs.getString('accountId') ?? '';
    return {
      'accountName': accountName,
      'accountMobile': accountEmail,
      'accountImage': accountImage,
      'accountId': accountID
    };
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    // final w = MediaQuery.of(context).size.width;
    // final h = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Container(
              margin: EdgeInsets.all(13),
              width: 30,
              height: 20,
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    //Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_outlined)),
            ),
          ),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                // color: Colors.grey,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  colors: [
                    hexStringColor("FFFFFF"),
                    //hexStringColor("F5F5F5"),
                    //hexStringColor("C2C2C4"),
                    hexStringColor("000000"),
                  ],
                ),
              ),
              child: FutureBuilder<Map<String, String>>(
                  future: getUserInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Handle loading state if needed
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // Handle error state if needed
                      return Text('Error: ${snapshot.error}');
                    }
                    final Map<String, String> userInfo = snapshot.data!;
                    return Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Image(
                              image: AssetImage('assets/images/img_7.png'),
                              height: 200,
                              width: 130,
                            ),
                            Container(
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text("My Profile",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                            ),
                            SizedBox(
                              //height: 66,
                              height: 70,
                            ),
                            Container(
                              // width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height > 900
                                  ? MediaQuery.of(context).size.height * .60
                                  : MediaQuery.of(context).size.height * .55,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(70),
                                    topRight: Radius.circular(70)),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    //  color: Theme.of(context).accentColor,
                                    transform: Matrix4.translationValues(
                                        0.0, -50.0, 0.0),
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: userInfo[
                                                      "accountImage"] ==
                                                  ""
                                              ? AssetImage(
                                                      'assets/images/img_8.png')
                                                  as ImageProvider<Object>?
                                              : NetworkImage(
                                                      userInfo["accountImage"]
                                                          .toString())
                                                  as ImageProvider<Object>?,
                                          radius: 43,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _pickImage(userInfo["accountId"]
                                                .toString());
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                left: 60,
                                                top: 50,
                                              ),
                                              padding: EdgeInsets.all(7),
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Image.asset(
                                                "assets/img_14.png",
                                                height: 15,
                                                width: 15,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          width: 37,
                                          height: 38,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 0.50,
                                                  color: Color(0xFFCFCFCF)),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            shadows: [
                                              BoxShadow(
                                                color: Color(0x3F000000),
                                                blurRadius: 4,
                                                offset: Offset(0, 4),
                                                spreadRadius: 0,
                                              )
                                            ],
                                          ),
                                          child: Container(
                                            width: 22,
                                            height: 22,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/img_10.png"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 260,
                                        height: 38,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 0.50,
                                                color: Color(0xFFCFCFCF)),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          shadows: [
                                            BoxShadow(
                                              color: Color(0x3F000000),
                                              blurRadius: 4,
                                              offset: Offset(0, 4),
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 13, left: 10),
                                          child: Text(
                                            '${userInfo['accountName']!}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Colors.black.withOpacity(
                                                  0.30000001192092896),
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          width: 37,
                                          height: 38,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 0.50,
                                                  color: Color(0xFFCFCFCF)),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            shadows: [
                                              BoxShadow(
                                                color: Color(0x3F000000),
                                                blurRadius: 4,
                                                offset: Offset(0, 4),
                                                spreadRadius: 0,
                                              )
                                            ],
                                          ),
                                          child: Container(
                                            width: 22,
                                            height: 22,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/img_11.png"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 260,
                                        height: 38,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 0.50,
                                                color: Color(0xFFCFCFCF)),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          shadows: [
                                            BoxShadow(
                                              color: Color(0x3F000000),
                                              blurRadius: 4,
                                              offset: Offset(0, 4),
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 13, left: 10),
                                          child: Text(
                                            '${userInfo['accountMobile']!}',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Colors.black.withOpacity(
                                                  0.30000001192092896),
                                              fontSize: 12,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  if (MediaQuery.of(context).size.height > 750)
                                    SizedBox(
                                      height: 30,
                                    ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Logout_screen()));
                                        },
                                        child: Container(
                                          width: 77,
                                          height: 40,
                                          decoration: ShapeDecoration(
                                            color: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                          child: Center(
                                            child: Row(
mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Logout ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w700,
                                                    height: 0,
                                                  ),
                                                ),
                                                Image(
                                                  image: AssetImage(
                                                      'assets/images/img_13.png'),
                                                  height: 15,
                                                  width: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 200,
                          left: 0,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/image.png',
                                width: 30,
                                height: 50,
                              ),
                            ],
                          ),
                        ),

                        // Positioned(
                        //   top: 230,
                        //   left:MediaQuery.of(context).size.width > 400 ? 180 : 143,
                        //
                        //   child: Center(
                        //     child: CircleAvatar(
                        //       backgroundImage: AssetImage('assets/images/img_8.png'),
                        //       radius: 43,
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                          top: 65,
                          right: 0,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/img_9.png',
                                width: 30,
                                height: 50,
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          // top: 634,
                          left: 0,
                          bottom: 0,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/img_12.png',
                                width: 50,
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
