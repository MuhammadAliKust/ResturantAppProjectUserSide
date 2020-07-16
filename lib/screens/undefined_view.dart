import 'package:flutter/material.dart';

class UnDefinedView extends StatelessWidget {
  final String name;
  UnDefinedView({this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('404 Error. Page Not Found.'),
      ),
    );
  }
}
