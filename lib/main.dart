import 'package:flutter/material.dart';

import 'HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Unit Converter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Unit Converter',
            ),
          ),
          body: HomeScreen(),
        ));
  }
}
