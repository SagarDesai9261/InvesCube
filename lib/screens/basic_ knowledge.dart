import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: basic_Knowledge(),
  ),
  );
}
class basic_Knowledge extends StatefulWidget {
  const basic_Knowledge({super.key});

  @override
  State<basic_Knowledge> createState() => _basic_KnowledgeState();
}

class _basic_KnowledgeState extends State<basic_Knowledge> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                'Basic Knowledge',
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
                    image: AssetImage('assets/dashboard/image109.png'),
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
                height: 35,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text(
                    'Here, We provide basic knowledge short form of stock markets:',
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
              // 1
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '1.NSE : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'National Stock Exchange',
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
              //2
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '2.BSE : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Bombay Stock Exchange',
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
              //3
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '3.NYSE : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'New York Stock Exchange',
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
              //4
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '4.IPO : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Initial Public Offering',
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
              //5
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '5.P/E Ratio : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Price-to-Earnings Ratio',
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
              //6
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '6.ROI : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Return on Investment',
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
              //7
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '7.SEC : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'U.S. Securities and Exchange Commission',
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
              //8
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '8.SEBI : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Securities and Exchange Board of India',
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
              //9
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '9.AMC : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Asset Management Company',
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
              //10
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '10. FDI : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Foreign Direct Investment',
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
              //11
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '11.Bull Market  : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'A market characterized by rising prices',
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
              //12
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '12.Bear Market : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'A market characterized by falling prices',
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
              //13
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '13.CDSL : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Central Depository Services (India) Limited',
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
              //14
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '14.GDP : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Gross Domestic Product',
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
              //15
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '15.MOU : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Memorandum of Understanding',
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
              //16
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '16.NRIs : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Non Resident Indians',
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
              //17
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '17. : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Non Resident Indians',
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
              //18
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '18.PAN : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Permanent Account Numbe',
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
              //19
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '19.RBI : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Reserve Bank of India',
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
              //20
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '20.SIPC : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Securities Investor Protection Corporation',
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
              //21
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '21.ASBA : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Applications Supported by Blocked Amount',
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
              //22
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '22.ATSs : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Alternative trading system',
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
              //23
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '23.CCIL : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Clearing Corporation of India Limited',
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
              //24
              SizedBox(
                width: 354,
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '24.P&L : ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,

                          ),
                        ),
                        TextSpan(
                          text: 'Profit & Loss',
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
