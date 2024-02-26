import 'package:flutter/material.dart';



class privacy_policy extends StatefulWidget {
  const privacy_policy({super.key});

  @override
  State<privacy_policy> createState() => _privacy_policyState();
}

class _privacy_policyState extends State<privacy_policy> {
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 18,),
                Row(
                  children: [
                    SizedBox(width: 15,),
                    Container(
                      margin: EdgeInsets.all(13),
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
                  ],
                ),
                SizedBox(height: 15,),
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 182,
                  height: 114,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/vector/privacy-policy.jpg'),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 5, ),
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
                ),
                SizedBox(height: 8,),
                SizedBox(
                  width: 354,
                  height: 110,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text(
                      'Crafting a privacy policy is essential for any mobile application, especially one focused on stock market education. A privacy policy outlines how user data is collected, used, and protected. Below is a basic template that you can use as a starting point. Keep in mind that this template is not legal advice, and you should consult with a legal professional to ensure compliance with applicable laws and regulations.',
                      textAlign: TextAlign.justify,

                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6000000238418579),
                        fontSize: 10,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,

                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 354,
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text(
                      'This Privacy Policy is for the stock market educational purposes of the users of the InvesCube Mobile Application.',
                      textAlign: TextAlign.justify,

                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6000000238418579),
                        fontSize: 10,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,

                      ),
                    ),
                  ),
                ),
                // first
                SizedBox(
                  width: 354,
                  height: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Information Collection and Use: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                          TextSpan(
                            text: 'Our educational stock market mobile application does not collect personal information from users for commercial purposes. We solely focus on providing educational content related to the stock market.',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6000000238418579),
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                //second
                SizedBox(
                  width: 354,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Log Data:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                          TextSpan(
                            text: '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                          TextSpan(
                            text: "The application may collect certain information automatically during usage. This data includes app usage statistics, device information, and errors encountered. However, this information is strictly used for improving the application's educational content and overall user experience.",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6000000238418579),
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                //third
                SizedBox(
                  width: 354,
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Cookies:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                          TextSpan(
                            text: '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                          TextSpan(
                            text: 'This application does not use cookies to collect information.',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6000000238418579),
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                //fourth
                SizedBox(
                  width: 354,
                  height:98,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Third-Party Services:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                          TextSpan(
                            text: '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                          TextSpan(
                            text: 'The application may contain links to third-party websites or services for educational references. These external sites are not operated by us, and therefore, we strongly advise you to review the Privacy Policy of these applications. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6000000238418579),
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                //fifth
                SizedBox(
                  width: 354,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Children’s Privacy:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                          TextSpan(
                            text: ' Our educational stock market mobile application is intended for educational purposes and does not knowingly collect personally identifiable information from children under the age of 18. In the case we discover that a child under 18 has provided us with personal information, we immediately delete this from our servers.',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6000000238418579),
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                //sixth
                SizedBox(
                  width: 354,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Changes to This Privacy Policy: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                          TextSpan(
                            text: ' We may update our Privacy Policy from time to time for educational purposes. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted.',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6000000238418579),
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                SizedBox(
                  width: 354,
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Contact Us: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                          TextSpan(
                            text: ' If you have any questions or suggestions about our Privacy Policy for the educational stock market mobile application, do not hesitate to contact us.',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6000000238418579),
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                SizedBox(height: 15,),
              ],
            ),
          ),
        ),
      );
  }
}
