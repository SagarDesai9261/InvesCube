
import 'package:flutter/material.dart';
import 'signin.dart';
import 'signup.dart';

class reset_password_success extends StatefulWidget {
  @override
  State<reset_password_success> createState() => _reset_password_successState();
}

class _reset_password_successState extends State<reset_password_success> {
  bool isSecure = true;
  bool isSecure1 = true;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * .62,
        width: screenWidth,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: const Alignment(-0.00, 1.00),
            end: const Alignment(0, -1),
            colors: [Colors.white, Colors.white.withOpacity(1)],
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
             Image.asset("assets/correct.png",width: MediaQuery.of(context).size.width * .3,
             height: MediaQuery.of(context).size.height * .2,
             ),

              const SizedBox(height: 20),

              const Text(
                'Password Reset',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Your password has been reset successfully !',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.699999988079071),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),

              const SizedBox(height: 60),
              buildSignUpButton(),



            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: 400,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: const Alignment(-0.00, 1.00),
                end: const Alignment(0, -1),
                colors: [Colors.black, Colors.white.withOpacity(1)],
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: h > 700 ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Image.asset("assets/img_9.png", height: 200, width: 200),


              ],

            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: const Icon(Icons.arrow_back_outlined,color: Colors.white,),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextFieldWithIcon(String iconPath, String hintText, bool isPassword) {
    TextEditingController _controller = TextEditingController();
    //bool isSecure = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 37,
          height: 38,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.50, color: Color(0xFFE0E0E0)),
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              const BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          padding: const EdgeInsets.all(5),
          child: Image.asset(iconPath, height: 15, width: 15),
        ),
        const SizedBox(width: 10),
        if(isPassword)
          Container(
            width: 230, // Adjust the width based on your design
            height: 38,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: Color(0xFFE0E0E0)),
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
                const BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    controller: _controller,
                    obscureText: isSecure,
                    style: const TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                    ),
                  ),
                ),
                if (isPassword)
                  IconButton(
                    icon: Icon(
                      isSecure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {

                      // Toggle password visibility
                      //_controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
                      setState(() {
                        isSecure= !isSecure;
                      });

                    },
                  ),
              ],
            ),
          ),
        if(isPassword==false)
          Container(
            width: 230, // Adjust the width based on your design
            height: 38,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: Color(0xFFE0E0E0)),
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
                const BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    controller: _controller,
                    obscureText: isPassword,
                    style: const TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                    ),
                  ),
                ),
                if (isPassword)
                  IconButton(
                    icon: Icon(
                      isPassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // Toggle password visibility
                      _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
                      isPassword = !isPassword;
                    },
                  ),
              ],
            ),
          ),
      ],
    );
  }

  Widget buildSignUpButton() {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .7,
        height: 38,
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Continue to Sign In",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildDividerOr() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 60, child: Divider(height: 2)),

        SizedBox(width: 60, child: Divider(height: 2)),
      ],
    );
  }

  Widget buildSocialButtonsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 66,
          height: 15,
          child: Text(
            'New User ?',
            style: TextStyle(
              color: Colors.black.withOpacity(0.30000001192092896),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        //SizedBox(width: 10),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
        }, child:  const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),)
      ],
    );
  }
}


