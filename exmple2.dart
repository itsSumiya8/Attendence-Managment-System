import 'package:flutter/material.dart';

void main() {
  runApp(mainApp());
}

class mainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "AppBar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Icon(Icons.menu, color: Colors.white),
          centerTitle: true,
          actions: const [
            Icon(Icons.search, color: Colors.white),
            Icon(Icons.favorite, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
