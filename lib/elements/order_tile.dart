import 'package:flutter/material.dart';


Widget buildOrderTile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset('assets/img/logo.png'),
            title: Text('Bread'),
            subtitle: Text('House 1, XYZ, Pakistan'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text('Delivered'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }