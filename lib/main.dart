import 'dart:async';

import 'package:flutter/material.dart';
import 'package:conn3ct/delay.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Delay(),
    );
  }
}
