import 'package:flutter/material.dart';
import 'package:resturant_rider_app/routes/route_constants.dart';
import 'package:resturant_rider_app/screens/notifications.dart';
import 'package:resturant_rider_app/shared/variable.dart';

Widget appBar(BuildContext context, String title,
    [Color color = Colors.green]) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: Builder(builder: (BuildContext context) {
      return IconButton(
        icon: Icon(
          Icons.sort,
          color: my_base_color,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      );
    }),
    title: Text(
      title,
      style: Theme.of(context)
          .textTheme
          .title
          .merge(TextStyle(letterSpacing: 1.3, color: my_base_color)),
    ),
    centerTitle: true,
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.notifications,
          color: my_base_color,
        ),
        onPressed: () {
          Navigator.pushNamed(context, NotificationView);
        },
      )
    ],
  );
}
