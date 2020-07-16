import 'package:flutter/material.dart';

imgDecoration(String img, double opacity) {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(img),
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(opacity), BlendMode.darken),
      fit: BoxFit.fill,
    ),
  );
}

var my_base_color = Color(0xffEB7D16);
var my_primary_color = Colors.black;
var outline_input_focused_border =
    OutlineInputBorder(borderSide: BorderSide(color: my_base_color));

var outline_input_border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: my_base_color));

var enabled_outline_input_border =
    OutlineInputBorder(borderSide: BorderSide(color: my_base_color));
var label_style = TextStyle(color: my_base_color);

var button_border_radius =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(7));

var text_theme = TextTheme(
  headline2: TextStyle(color: Colors.black),
  // headline4: TextStyle(
  //   fontSize: 20.0,
  //   fontWeight: FontWeight.w700,
  // ),
  // display2: TextStyle(
  //   fontSize: 22.0,
  //   fontWeight: FontWeight.w700,
  // ),
  // display3: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: Colors.white),
  // display4: TextStyle(
  //   fontSize: 26.0,
  //   fontWeight: FontWeight.w300,
  // ),
  // subhead: TextStyle(
  //   fontSize: 18.0,
  //   fontWeight: FontWeight.w500,
  // ),
  // title: TextStyle(
  //   fontSize: 17.0,
  //   fontWeight: FontWeight.w700,
  // ),
  // body1: TextStyle(
  //   fontSize: 14.0,
  //   fontWeight: FontWeight.w400,
  // ),
  // body2: TextStyle(
  //   fontSize: 15.0,
  //   fontWeight: FontWeight.w400,
  // ),
  caption: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w300,
  ),
);

var theme_data = ThemeData(
    cardColor: Colors.white,
    primaryColor: Colors.black,
    buttonColor: Color(0xffEB7D16),
    canvasColor: Colors.white,
    fontFamily: 'ProductSans',
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0, foregroundColor: Colors.white),
    // brightness: Brightness.light,
    textTheme: text_theme);

dynamic boxDecoration(BuildContext context) {
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)));
}

var button_text_style = TextStyle(color: Colors.white);

var textField_filled_color = Color(0xffece7e7);

var bg_card_colors = Color(0xffEB7D16);
