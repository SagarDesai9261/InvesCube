import 'package:flutter/material.dart';



class terms_and_condition extends StatefulWidget {
  const terms_and_condition({super.key});

  @override
  State<terms_and_condition> createState() => _terms_and_conditionState();
}

class _terms_and_conditionState extends State<terms_and_condition> {
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
                  'Terms and Conditions',
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
                      image: AssetImage('assets/vector/terms&conditions.jpg'),
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
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text(
                      "Creating terms and conditions for a InvesCube stock market educational mobile application involves specifying the rules and agreements that users must adhere to while using your app. Below is a generic example to get you started. However, it's crucial to consult with a legal professional to ensure that the terms and conditions are legally sound and comply with applicable laws. Additionally, you may need to tailor the document to meet the specific features and characteristic of your app.",
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
                            text: 'Overview: ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                          TextSpan(
                            text: 'This mobile application is designed solely for educational purposes related to the stock market. Users are expected to use the application responsibly and understand that it does not provide financial advice.',
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
                  height: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Educational Content:',
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
                            text: "The application offers educational materials on stock market concepts, strategies, and related topics. It is not intended as financial advice or a recommendation for any specific investment.",
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
                  height: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'No Financial Advice: ',
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
                            text: "Users are explicitly informed that the content provided within the application is for educational purposes only and should not be considered as financial advice. Any decisions made based on the information provided are at the user's own risk.",
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
                  height:65,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Accuracy of Information: ',
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
                            text: ' While we strive to provide accurate and up-to-date information, we do not guarantee the accuracy or completeness of the content. Users are encouraged to verify information independently.',
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
                  height: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Investment Decisions:',
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
                            text: 'Users understand that any investment decisions made are their own responsibility. The application does not endorse or recommend specific investments, and users should conduct thorough research before making any financial decisions.',
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
                  height: 52,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'User Conduct:',
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
                            text: ' Users agree to use the application responsibly and refrain from any unlawful or unethical activities. Any misuse of the application may result in termination of access.',
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
                  height: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Feedback and Suggestions:',
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
                            text: ' Users are encouraged to provide feedback and suggestions for improvement. However, the application reserves the right to use or implement such feedback at its discretion.',
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
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Modifications to Terms:',
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
                            text: ' The terms and conditions may be updated or modified periodically. Users are responsible for reviewing the terms to stay informed about any changes.',
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
                            text: 'Termination of Access:',
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
                            text: ' The application reserves the right to terminate access for users who violate these terms or engage in any form of misuse.',
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
