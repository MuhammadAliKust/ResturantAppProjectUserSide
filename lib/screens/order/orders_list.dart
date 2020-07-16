import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resturant_rider_app/elements/drawer.dart';
import 'package:resturant_rider_app/elements/appbar.dart';
import 'package:resturant_rider_app/elements/order_list_widget.dart';
import 'package:resturant_rider_app/elements/order_tile.dart';
import 'package:resturant_rider_app/models/order_model.dart';
import 'package:resturant_rider_app/routes/route_constants.dart';
import 'package:resturant_rider_app/screens/order/order_details.dart';

class OrdersList extends StatefulWidget {
  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  var orderList = <Order>[
    Order(
        image: 'assets/img/qorma.jpg',
        title: 'Chicken',
        qty: 4,
        price: 22,
        date: "12/12/12",
        time: "13:45"),
    Order(
        image: 'assets/img/qorma.jpg',
        title: 'Rice',
        qty: 4,
        price: 22,
        date: "12/12/12",
        time: "13:45")
  ];

  Widget _buildScreenUI(BuildContext context) {
    return _buildExpansionTile(context);
  }

  Widget _buildExpansionTile(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              child: ExpansionTile(
            leading: Image.asset(
              'assets/img/green_tick.png',
              width: 50,
            ),
            title: Text('Order Id: 4$index'),
            subtitle: Text("Address: New City"),
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: orderList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: buildOrdersList(context, index, orderList),
                      onTap: () =>
                          Navigator.pushNamed(context, OrderDetailsView),
                    );
                  })
            ],
          ));
        });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do you want to exit?"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text("No")),
                FlatButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: Text("yes"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(context, 'Orders'),
        drawer: AppDrawer(),
        body: _buildExpansionTile(context),
      ),
    );
  }
}
