import 'package:flutter/material.dart';
import 'package:resturant_rider_app/elements/order_list_widget.dart';
import 'package:resturant_rider_app/elements/order_tile.dart';

import 'package:resturant_rider_app/elements/appbar.dart';

import 'package:resturant_rider_app/elements/drawer.dart';
import 'package:resturant_rider_app/models/order_model.dart';
import 'package:resturant_rider_app/routes/route_constants.dart';

import 'package:resturant_rider_app/shared/variable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

class OrderDetails extends StatelessWidget {

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  
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

  Widget _buildButton(BuildContext context) {
    return FlatButton(
      shape: button_border_radius,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return _buildAlertDialog(context);
            });
      },
      color: Colors.green,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 50),
        child: Text('Delivered', style: TextStyle(color: Colors.white),),
      ),
    );
  }

  Widget _buildAlertDialog(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Delivery Confirmation',
        style: Theme.of(context).textTheme.title,
      ),
      content: Text('Please confirm that you have delivered order.'),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        FlatButton(
          child: new Text('Confirm'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: new Text('Dimiss'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _buildScreenUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          _buildOrderIdListTile(),
          _buildDeliveryBoyDetails(context),
          SizedBox(
            height: 20,
          ),
          _buildOrderDetails(context),
          SizedBox(
            height: 20,
          ),
          _buildButton(context),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget _buildOrderIdListTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListTile(
        title:
            Text('Order ID: 32', style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Cash on Delivery"),
        trailing: Column(children: <Widget>[
          Text(
            '\$120',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
          Text("12/12/2020",
              style: TextStyle(
                fontSize: 11,
              )),
          Text("12:45",
              style: TextStyle(
                fontSize: 11,
              ))
        ]),
      ),
    );
  }

  Widget _buildDeliveryBoyDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 6,
        shape: button_border_radius,
        child: Column(
          children: <Widget>[
            _buildHeader('Customer Details'),
            Divider(),
            _buildSettingName(),
            _buildPhone(),
            _buildAddress(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSettingName() {
    return ListTile(
      leading: Icon(Icons.supervised_user_circle),
      title: Text('Robert Gill'),
    );
  }

  Widget _buildAddress() {
    return ListTile(
      leading: IconButton(icon: Icon(Icons.directions),
      onPressed: (){
        MapsLauncher.launchQuery('Rawalpindi Rd, Kohat');
      },),
      title: Text('Kohat, Pakistan'),
    );
  }

  Widget _buildPhone() {
    return ListTile(
      leading: IconButton(icon: Icon(Icons.phone),
      onPressed: (){
        _makePhoneCall('tel: +92-321-1234567');
      },),
      title: Text('+92-321-1234567'),
    );
  }

  Widget _buildOrderDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        elevation: 6,
        shape: button_border_radius,
        child: Column(
          children: <Widget>[
            _buildHeader('Order Details'),
            Divider(),
            buildOrdersList(context, 1, orderList),
            SizedBox(
              height: 30,
            ),
            _buildPaymentRow('Sub Total', 100, context),
            _buildPaymentRow('Delivery Fee', 20, context),
            _buildPaymentRow('Total', 120, context),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentRow(String title, double amount, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.subhead,
            ),
            Text(
              '\$$amount',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, 'Order Details'),
        drawer: AppDrawer(),
        body: _buildScreenUI(context),
      );
    
  }
}
