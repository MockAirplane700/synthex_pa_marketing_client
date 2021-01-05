import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF1D3D0E),
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image(
          image: AssetImage('images/pa_logo.png'),
        ),
        SizedBox(height: 50.0),
        ElevatedButton(
          onPressed: null,
          child: Text('Get Started'),
        ),
      ],
    );
  }
}
