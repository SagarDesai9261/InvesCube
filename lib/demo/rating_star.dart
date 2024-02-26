import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(child: StarRating()),
    ),
  ));
}
class StarRating extends StatefulWidget {
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: index < _rating ? Colors.yellow : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              if (_rating == index + 1) {
                _rating = _rating - 1;
              } else {
                _rating = index + 1;
              }
            });
          },
        );
      }),
    );
  }
}
