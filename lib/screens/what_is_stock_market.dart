import 'package:flutter/material.dart';



void main(){
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: what_is_stock_market()));
}
class what_is_stock_market extends StatefulWidget {
  const what_is_stock_market({super.key});

  @override
  State<what_is_stock_market> createState() => _what_is_stock_marketState();
}

class _what_is_stock_marketState extends State<what_is_stock_market> {
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
                          child: Icon(Icons.arrow_back,size: 18,),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Text(
                  'What is stock market ?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,

                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 182,
                  height: 114,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/dashboard/img123.png'),
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
                  height: 109,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text(
                      'The stock market, also known as the equity market or share market, is a place where buyers and sellers come together to trade ownership in companies. It is a marketplace where shares of publicly traded companies are bought and sold. Companies issue shares through an initial public offering (IPO) to raise capital, and once these shares are available to the public, they can be bought and sold on the stock market.',
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
                  height: 17,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text(
                      'Here are some key concepts related to the stock market:',
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
                  height: 47,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '1.Shares/Stocks : ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                          TextSpan(
                            text: 'A share represents ownership in a company. When you own a share, you own a portion of that company.',
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
                  height: 71,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '2.Stock Exchanges',
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
                            text: ':',
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
                            text: 'Stock exchanges are platforms where buyers and sellers meet to trade stocks. Examples include the New York Stock Exchange (NYSE) and the Nasdaq in the United States, and the London Stock Exchange (LSE) in the United Kingdom.',
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
                  height: 63,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '3.Bulls and Bears',
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
                            text: ':',
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
                            text: 'The terms "bull market" and "bear market" are used to describe the general trend of the market. A bull market is characterized by rising prices, while a bear market is characterized by falling prices.',
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
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '4.Brokerages',
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
                            text: ':',
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
                            text: 'Investors typically buy and sell stocks through brokerage firms, which act as intermediaries between the investor and the stock exchange.',
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
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '5.Market Index :',
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
                            text: 'Market indices, such as the S&P 500 or Dow Jones Industrial Average, track the performance of a specific group of stocks and are used as benchmarks for the overall market.',
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
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '6.Dividends :',
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
                            text: 'Some companies distribute a portion of their profits to shareholders in the form of dividends. This is one way investors can earn income from their stock holdings.',
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
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '7.Market Capitalization :',
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
                            text: "Market capitalization (market cap) is the total value of a company's outstanding shares and is often used to categorize companies as large-cap, mid-cap, or small-cap.",
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
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      );
  }
}
