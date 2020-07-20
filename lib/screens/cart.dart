import 'package:flutter/material.dart';
import 'package:resturant_rider_app/elements/appbar.dart';
import 'package:resturant_rider_app/elements/drawer.dart';
import 'package:resturant_rider_app/shared/variable.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int quantity = 1;
  double totalPrice = 0.0;
  Widget _buildScreenUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: <Widget>[
          _buildOrderQuantityCard('Creamy Nachos', 'Regular', 120),
          _buildDivider(),
          _buildBillDetails(),
          _buildDivider(),
          _buildRequestCard(context),
          _buildPayButton()
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
      child: Divider(
        thickness: 2,
        color: Color(0xffE1E1E1),
      ),
    );
  }

  Widget _buildOrderQuantityCard(String title, String subTitle, double price) {
    return ListTile(
        title: _buildTitle(title),
        subtitle: _buildSubTitle(subTitle),
        trailing: _buildTrailing(price));
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline6
          .merge(TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildSubTitle(String subTitle) {
    return Text(subTitle);
  }

  Widget _buildTrailing(double price) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[_buildPrice(price), _buildQuantityController()]);
  }

  Widget _buildPrice(double price) {
    totalPrice = price * quantity;
    return Text(
      '\$ $totalPrice',
      style: Theme.of(context)
          .textTheme
          .subtitle2
          .merge(TextStyle(fontWeight: FontWeight.w700)),
    );
  }

  Widget _buildQuantityController() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: my_base_color),
          borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
                onTap: () {
                  setState(() {
                    quantity <= 1 ? quantity = 1 : quantity--;
                  });
                },
                child: Icon(Icons.audiotrack, size: 20, color: my_base_color)),
            SizedBox(width: 5),
            Text(
              '$quantity',
              style: TextStyle(color: my_base_color),
            ),
            SizedBox(width: 5),
            InkWell(
                onTap: () {
                  setState(() {
                    quantity++;
                  });
                },
                child: Icon(Icons.add, size: 20, color: my_base_color))
          ],
        ),
      ),
    );
  }

  Widget _buildBillDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            _buildBillDetailsCard('Item Total', totalPrice),
            _buildBillDetailsCard('Resturant Charges', 03.00),
            _buildBillDetailsCard('Delivery Fee', 01.00),
            Divider(
              thickness: 2,
              color: Color(0xffE1E1E1),
            ),
            _buildTotalBill('To Pay', totalPrice + 3 + 1)
          ]),
    );
  }

  Widget _buildHeader() {
    return Text(
      'Bill Details',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget _buildBillDetailsCard(String title, double payment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.subhead.merge(TextStyle(
                fontWeight: FontWeight.w700, color: Color(0xff7F7F7F))),
          ),
          Text(
            '\$ $payment',
            style: Theme.of(context)
                .textTheme
                .subhead
                .merge(TextStyle(fontWeight: FontWeight.w700)),
          )
        ],
      ),
    );
  }

  Widget _buildTotalBill(String title, double price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .title
                .merge(TextStyle(fontWeight: FontWeight.w700)),
          ),
          Text(
            '\$ $price',
            style: Theme.of(context)
                .textTheme
                .subhead
                .merge(TextStyle(fontWeight: FontWeight.w700)),
          )
        ],
      ),
    );
  }

  Widget _buildRequestCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Any request for the resturant?",
            style: Theme.of(context)
                .textTheme
                .subhead
                .merge(TextStyle(fontWeight: FontWeight.w700)),
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _buildPayButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: FlatButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text("Proceed", style: button_text_style),
        ),
        shape: button_border_radius,
        color: Theme.of(context).buttonColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Cart'),
      drawer: AppDrawer(),
      body: SafeArea(child: _buildScreenUI(context)),
    );
  }
}
