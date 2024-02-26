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
                  height: 78,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text(
                      'BSE stands for Bombay Stock Exchange. It is one of the oldest and most prominent stock exchanges in Asia and is located in Mumbai, India. Established in 1875, the BSE is sometimes referred to as the "BSE India" or the "Bombay Stock Exchange Limited."',
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
                  height: 22,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text(
                      'Key features of the Bombay Stock Exchange (BSE) include : ',
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
                  height: 49,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '1.Listing of Companies : ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                          TextSpan(
                            text: 'The BSE provides a platform for companies to list their securities (equity shares, debt instruments, etc.) and raise capital from the public.',
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
                  height: 49,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '2.Trading Platform :',
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
                            text: 'It serves as a marketplace where buyers and sellers can trade various financial instruments, including stocks, bonds, and derivatives.',
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
                  height: 62,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '3.Indices :',
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
                            text: 'BSE is home to several benchmark indices, the most notable being the S&P BSE Sensex. The Sensex is a market index that represents the performance of the 30 largest and most actively traded stocks on the BSE.',
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
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '4.Regulatory Framework : ',
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
                            text: 'The BSE operates under the regulatory framework of the Securities and Exchange Board of India (SEBI), which is the primary regulatory authority for the securities market in India.',
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
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '5.Technology and Trading Systems :',
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
                            text: 'Like other major stock exchanges, the BSE has modernized its trading systems and adopted technology to facilitate efficient and transparent trading.',
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
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '6.Investor Services :',
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
                            text: 'The BSE provides various services to investors, including trading, clearing, settlement, and information dissemination.',
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
                  height: 78,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child:  Text(
                      "The BSE, along with the National Stock Exchange (NSE), is a crucial component of the Indian financial market. It plays a vital role in the development and functioning of the country's capital markets by providing a platform for capital raising, liquidity, and investment opportunities.",
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
                  height: 109,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child:   Text(
                      "It's worth noting that as of my last knowledge update in January 2022, there may have been developments or changes related to the Bombay Stock Exchange, so it's a good idea to check more recent sources for the latest information.",
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
                SizedBox(height: 15,),
              ],
            ),
          ),
        ),
      );
  }
}
