import 'dart:async';

import 'package:flutter/material.dart';
import 'package:conn3ct/login.dart';

class Delay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DelayState();
}

class DelayState extends State<Delay> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(milliseconds: 1000);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  initScreen(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Center(
          child: Center(
            child: Text(
              'conn3ct',
              style: TextStyle(
                fontSize: 60,
                fontFamily: 'Pacifico',
                color: Colors.lightBlueAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
