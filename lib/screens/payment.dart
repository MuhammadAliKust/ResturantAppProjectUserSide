import 'package:flutter/material.dart';
import 'package:resturant_rider_app/elements/appbar.dart';
import 'package:resturant_rider_app/elements/drawer.dart';

class PaymentMode extends StatelessWidget {
  Widget _buildScreenUI(BuildContext context) {
    return ListView(children: <Widget>[
      _buildPaymnetMode(Icons.payment, 'Payment Options',
          'Select your preferred payment option.', context),
      _buildPaymentCard(
          'assets/img/visacard.png',
          'Visa Card',
          'Click to pay with your Visa Card.',
          context,
          () => displayDialog(context)),
      _buildPaymentCard(
          'assets/img/mastercard.png',
          'Master Card',
          'Click to pay with your Master Card.',
          context,
          () => displayDialog(context)),
      _buildPaymentCard('assets/img/paypal.png', 'Paypal',
          'Click to pay with your Paypal account.', context, () => null),
      _buildPaymnetMode(Icons.attach_money, 'Cash on Delivery',
          'Select your preferred payment option.', context),
      _buildPaymentCard('assets/img/cash.png', 'Cash on Delivery',
          'Click to pay cash on Delivery.', context, () => null),
    ]);
  }

  Widget _buildPaymnetMode(
      IconData iconData, String title, String subTitle, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListTile(
        leading: _buildLeading(iconData),
        title: _buildTitle(context, title),
        subtitle: _buildSubTitle(subTitle),
      ),
    );
  }

  Widget _buildLeading(IconData iconData) {
    return Icon(iconData);
  }

  Widget _buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .title
          .merge(TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildSubTitle(String subTitle) {
    return Text(subTitle);
  }

  Widget _buildPaymentCard(
      String path, String title, String subTitle, BuildContext context,
      [VoidCallback navigation]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6),
      child: Card(
        elevation: 3,
        child: ListTile(
          onTap: () => navigation(),
          leading: _buildCardLeading(path),
          title: _buildTitle(context, title),
          subtitle: _buildSubTitle(subTitle),
          trailing: _buildTrailing(),
        ),
      ),
    );
  }

  Widget _buildCardLeading(String path) {
    return Image.asset(path);
  }

  Widget _buildTrailing() {
    return Icon(
      Icons.arrow_forward_ios,
      size: 15,
    );
  }

  displayDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        child: _buildDialog(context));
  }

  Widget _buildDialog(BuildContext context) {
    return AlertDialog(
      title: _buildDialogTitle(),
      content: _buildDialogContent(),
      actions: <Widget>[
        FlatButton(
            onPressed: () => Navigator.pop(context), child: Text("Submit"))
      ],
    );
  }

  Widget _buildDialogTitle() {
    return Text("Enter your Card Details");
  }

  Widget _buildDialogContent() {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      TextField(
        decoration: InputDecoration(labelText: 'Enter your card number'),
      ),
      Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: TextField(
              decoration: InputDecoration(labelText: 'CSV'),
            )),
            SizedBox(width: 10),
            Expanded(
                child: TextField(
              decoration: InputDecoration(labelText: 'Exp. Data'),
            )),
          ])
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Payment Mode'),
      drawer: AppDrawer(),
      body: SafeArea(
        child: _buildScreenUI(context),
      ),
    );
  }
}
