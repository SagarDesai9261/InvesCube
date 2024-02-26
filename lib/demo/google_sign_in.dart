import 'package:flutter/material.dart';
import 'package:stock_market/model/model.dart';
import 'package:stock_market/model/service.dart';


void main(){
  runApp(MaterialApp(home: Scaffold(
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.black,
      leading: Container(
        margin: EdgeInsets.all(13),
        width: 30,
        height: 20,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: InkWell(
            onTap: (){
              //Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_outlined)),
      ),
      title: Text(
        'Basic Educations',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w800,
          height: 0,
        ),
      ),
    ),
    body:FutureBuilder<List<Basic_Education>>(
      future: Basic_Education_Service().fetchStockItems(),
      builder: (context, snapshot) {
        if(snapshot.connectionState ==  ConnectionState.waiting){
          return CircularProgressIndicator();

        }
        if(snapshot.data!.isEmpty){
          return Center(child: Text("No Data Found"));
        }
        return Basic_Education_display(yourData: snapshot.data,);
      }
    ),
  ),));
}

class Basic_Education_display extends StatelessWidget {
  List<Basic_Education>? yourData = [];

  Basic_Education_display({required this.yourData});
  @override
  Widget build(BuildContext context) {


    List<Widget> rows = [];

    for (int i = 0; i < yourData!.length; i += 2) {
      Widget firstItem = buildItem(yourData![i]);
      Widget secondItem = i + 1 < yourData!.length ? buildItem(yourData![i + 1]) : SizedBox.shrink();

      rows.add(
        Column(
          children: [
            Container(
              height: 150 ,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(101, 101, 101, 1),
                    Color.fromRGBO(118, 118, 118, .6),
                  ],
                ),
                boxShadow: [
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
                  firstItem,
                  secondItem,
                ],
              ),
            ),
            SizedBox(height:20,)
          ],
        ),
      );
    }

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(41, 41, 41, .9),
                Color.fromRGBO(
                  92,
                  92,
                  92,
                  .9,
                ),
                Color.fromRGBO(73, 73, 73, .2),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: rows,
          ),
        ),
      ],
    );
  }

  Widget buildItem(Basic_Education data) {
    return Container(
      height: 130,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 27,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                data.name,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            child: Image.network(
              data.image,
              fit: BoxFit.cover,
              height: 103,
              width: 150,
            ),
          ),
        ],
      ),
    );
  }
}
