import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySwipeScreen(),
    );
  }
}

class MySwipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe Gesture Example'),
      ),
      body: SwipeDetector(
        child: Container(
          color: Colors.blue,
          child: Center(
            child: Text(
              'Swipe me!',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
        onSwipeLeft: () {
          // Handle swipe left action
          print('Swiped left!');
        },
        onSwipeRight: () {
          // Handle swipe right action
          print('Swiped right!');
        },
      ),
    );
  }
}

class SwipeDetector extends StatelessWidget {
  final Widget child;
  final Function onSwipeLeft;
  final Function onSwipeRight;

  SwipeDetector({required this.child, required this.onSwipeLeft, required this.onSwipeRight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          // Swiped right
          onSwipeRight();
        } else if (details.primaryVelocity! < 0) {
          // Swiped left
          onSwipeLeft();
        }
      },
      child: child,
    );
  }
}
