import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: who_is_stock_king_of_india(),
  ),
  );
}

class who_is_stock_king_of_india extends StatefulWidget {
  const who_is_stock_king_of_india({super.key});

  @override
  State<who_is_stock_king_of_india> createState() =>
      _who_is_stock_king_of_indiaState();
}

class _who_is_stock_king_of_indiaState
    extends State<who_is_stock_king_of_india> {
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
                  'Who is stock king of India ? ',
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
                  height: 115,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/dashboard/image106.png'),
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
                  height: 65,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text(
                      'As of our last knowledge update in January 2022, Rakesh Jhunjhunwala is an Indian billionaire investor and one of the most well-known and successful stock market investors in India. Here are some key details about Rakesh Jhunjhunwala:',
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
                  height: 33,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '1.Background : ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                          TextSpan(
                            text: 'Rakesh Jhunjhunwala was born on July 5, 1960, in Mumbai, India.',
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
                  height: 33,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '2.Profession  :',
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
                            text: 'He is often referred to as the "Big Bull" of the Indian stock market and is a prominent equity investor.',
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
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '3.Investment Style :',
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
                            text: 'Jhunjhunwala is known for his value investing approach and is recognized for holding a concentrated portfolio of carefully selected stocks for the long term.',
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
                  height: 47,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '4.Wealth Creation : ',
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
                            text: 'He has earned a reputation for his ability to identify investment opportunities early, leading to substantial wealth creation over the years.',
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
                            text: '5.Public Persona :',
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
                            text: 'Rakesh Jhunjhunwala is a public figure and is often featured in the media for his views on the stock market and the economy. His investment decisions are closely followed by market participants.',
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
                            text: '6.Key Holdings  :',
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
                            text: 'Some of the companies in which Jhunjhunwala has had significant holdings include Titan Company, Lupin, Crisil, and others.',
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
                //seventh
                SizedBox(
                  width: 354,
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '7.Philanthropy :',
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
                            text: 'Apart from his success in the stock market, Jhunjhunwala is also involved in philanthropic activities.',
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
                //eighth
                SizedBox(
                  width: 354,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '8.Recognition  :',
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
                            text: 'He has received various accolades for his contributions to the financial markets and is considered an influential figure in the Indian investment community.',
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
                    child: Text(
                      "It's important to note that the status and activities of individuals can change over time, and it's advisable to check the latest sources for the most up-to-date information on Rakesh Jhunjhunwala and his activities in the financial world.\n",
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
