
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
void main(){
  runApp(MaterialApp(
    home:PDFViewerCachedFromUrl( url: 'https://dohost.in/stockapi/admin/upload_img/AKSHYA_CHAUDHARY_RESUME.pdf',name:"Abc")
  ));
}
class PDFViewerCachedFromUrl extends StatelessWidget {
  const PDFViewerCachedFromUrl({Key? key, required this.url,required this.name}) : super(key: key);
  final String url;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      iconTheme: IconThemeData(
        color: Colors.white
      ),
      centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("$name Reports",style: TextStyle(color:Colors.white),),
      ),
      body: const PDF().cachedFromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
