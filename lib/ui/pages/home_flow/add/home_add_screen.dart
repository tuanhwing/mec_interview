

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAddScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeAddState();

}

class _HomeAddState extends State<HomeAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Add screen'),
      ),
    );
  }

}