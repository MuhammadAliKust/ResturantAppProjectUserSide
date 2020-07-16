import 'package:flutter/material.dart';
import 'package:resturant_rider_app/elements/appbar.dart';
import 'package:resturant_rider_app/elements/drawer.dart';
import 'package:resturant_rider_app/elements/order_list_widget.dart';
import 'package:resturant_rider_app/models/order_model.dart';
import 'package:resturant_rider_app/routes/route_constants.dart';
import 'package:resturant_rider_app/shared/variable.dart';

class OrderHistory extends StatelessWidget {
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
              child: Theme(
            data: ThemeData(accentColor: my_base_color),
            child: ExpansionTile(
              leading: Image.asset('assets/img/tick.png'),
              title: Text('Order Id: 42'),
              subtitle: Text("Delivered"),
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
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Order History'),
      drawer: AppDrawer(),
      body: SafeArea(child: _buildScreenUI(context)),
    );
  }
}
