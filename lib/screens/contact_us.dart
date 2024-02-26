import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: contact_page(),
    ),
  );
}

class contact_page extends StatefulWidget {
  const contact_page({super.key});

  @override
  State<contact_page> createState() => _contact_pageState();
}

class _contact_pageState extends State<contact_page> {

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _message = TextEditingController();

  bool Uname = false;
  bool Uemail = false;
  bool Umessage = false;

  String name_message = "";
  String email_message = "";
  String message_message = "";
  _submit(){
    if(_name.text.isEmpty){
      setState(() {
        Uname = true;
      });
    }
    else{
      Uname = false;
    }
    if(_email.text.isEmpty || RegExp(
        r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email.text)){
      setState(() {
        Uemail = true;
      });
    }
    else{
      Uemail = false;
    }
    if(_message.text.isEmpty ){
      setState(() {
        Umessage = true;
      });
    }
    else{
      Umessage = false;
    }
    if(Uname == false && Uemail == false && Umessage == false){
      _handlesubmitPressed();
    }
  }
  _handlesubmitPressed() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 440,
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
                Image.asset("assets/images/img_20.png",height: 180,width: 100,),
                SizedBox(
                  height: 10,
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
                    width: 280,
                    child: Text(
                      'Thank you for your valuable Message !',
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 280,
                    child: Text(
                      ' Our team contact you shortly !',
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
                  height: 20,
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
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    print(h);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 430,
          height: MediaQuery.of(context).size.height * 6,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, 1.00),
              end: Alignment(0, -1),
              colors: [Colors.white, Colors.black],
            ),
          ),
          child:
          SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        SizedBox(width: 15,),
                        Container(
                          width: 32,
                          height: 28,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back,size: 18,)),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        SizedBox(
                          width: 111,
                          height: 23,
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                              height: 0,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 27,),
                    Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/contact.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .7,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment(0.00, 1.00),
                              end: Alignment(0, -1),
                              colors: [Colors.black, Colors.white],
                            ),

                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 40,),
                            Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Name ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          color: Color(0xFFE02222),
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],

                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Container(

                                  width: 300,
                                  height: 38,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Uname == true ? Colors.red : Colors.white
                                        ,width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
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
                                  child:
                                  // Center(
                                  //   child: Text(
                                  //     'Enter full name here...',
                                  //     style: TextStyle(
                                  //       color: Color(0x7F787878),
                                  //       fontSize: 12,
                                  //       fontFamily: 'Inter',
                                  //       fontWeight: FontWeight.w500,
                                  //       height: 0.19,
                                  //     ),
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      controller: _name,
                                      decoration: InputDecoration(
                                        hintText: "Enter full name here...",
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if(Uname)
                              Row(
                                children: [
                                  SizedBox(width: 25,),
                                  Container(
                                    child: Text("${name_message} required name",style: TextStyle(color: Colors.red),),
                                  ),
                                ],
                              ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'E-Mail ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          height: 0.11,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          color: Color(0xFFE02222),
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          height: 0.11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Container(
                                  width: 300,
                                  height: 38,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Uemail == true ? Colors.red : Colors.white,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10),
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
                                  child:
                                  // Center(
                                  //      child: Text(
                                  //        'Enter e-mail address here...',
                                  //        style: TextStyle(
                                  //          color: Color(0x7F787878),
                                  //          fontSize: 12,
                                  //          fontFamily: 'Inter',
                                  //          fontWeight: FontWeight.w500,
                                  //          height: 0.19,
                                  //        ),
                                  //      ),
                                  //    ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      controller: _email,
                                      decoration: InputDecoration(
                                        hintText: "Enter e-mail address here...",
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if(Uemail)
                              Row(
                                children: [
                                  SizedBox(width: 25,),
                                  Container(
                                    child: Text("${email_message}required email",style: TextStyle(color: Colors.red),),
                                  ),
                                ],
                              ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Message ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          height: 0.11,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          color: Color(0xFFE02222),
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          height: 0.11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                Container(
                                  width: 300,
                                  height: 138,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Uemail == true ? Colors.red : Colors.white,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    shadows: [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child:
                                  // Center(
                                  //   child: Text(
                                  //     'Enter your message here...',
                                  //     style: TextStyle(
                                  //       color: Color(0x7F787878),
                                  //       fontSize: 12,
                                  //       fontFamily: 'Inter',
                                  //       fontWeight: FontWeight.w500,
                                  //       height: 0.19,
                                  //     ),
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      controller: _message,
                                      decoration: InputDecoration(
                                        hintText: "Enter your message here...",
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if(Umessage)
                              Row(
                                children: [
                                  SizedBox(width: 25,),
                                  Container(
                                    child: Text(" ${message_message}required message",style: TextStyle(color: Colors.red),),
                                  ),
                                ],
                              ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap:(){
                                _submit();
                                _handlesubmitPressed();
                              },
                              child: Container(
                                width: 95,
                                height: 38,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Submit',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_rounded),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 217,
                  left: 86,
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: ShapeDecoration(
                      color: Color(0xFF8B8B8B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
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
                    child: SizedBox(
                      width: 143,
                      height: 23,
                      child: Center(
                        child: Text(
                          'Quick Contact',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
