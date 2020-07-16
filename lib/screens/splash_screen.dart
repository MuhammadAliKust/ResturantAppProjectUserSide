import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resturant_rider_app/shared/variable.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget _buildScreenUI() {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: imgDecoration("assets/img/splash_bg.png", 0.3),
        child: _buildHeading());
  }

  Widget _buildHeading() {
    return Column(children: <Widget>[
      SizedBox(
        height: 0.24 * MediaQuery.of(context).size.height,
      ),
      _buildTitle(),
      _buildSubHeading()
    ]);
  }

  Widget _buildTitle() {
    return Text('Home Made',
        style: Theme.of(context)
            .textTheme
            .headline3
            .merge(TextStyle(color: Colors.white, letterSpacing: -0.5)));
  }

  Widget _buildSubHeading() {
    return Text('Easy to sale home made dishes',
        style: Theme.of(context).textTheme.headline6.merge(
              TextStyle(color: Colors.white, letterSpacing: -1),
            ));
  }

  Widget _buildLogo() {
    return Center(
        child: Image.asset(
      'assets/img/splash_bg.png',
      width: 0.3 * MediaQuery.of(context).size.width,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildScreenUI()),
    );
  }
}
