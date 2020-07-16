import 'package:flutter/material.dart';
import 'package:resturant_rider_app/elements/appbar.dart';
import 'package:resturant_rider_app/elements/drawer.dart';
import 'package:resturant_rider_app/shared/variable.dart';

class ProfileEdit extends StatelessWidget {
  Widget _buildScreenUI(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        _buildDpRow(context),
        SizedBox(
          height: 40,
        ),
        _buildEditHeader(context),
        SizedBox(height: 20,),
        _buildEditCard(),
        SizedBox(height: 20,),
        _buildButton()
      ],
    );
  }

  Widget _buildDpRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildUserDp(),
          SizedBox(
            width: 20,
          ),
          _buildEditButton(context),
        ],
      ),
    );
  }

  Widget _buildUserDp() {
    return CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage('assets/img/germany.png'),
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildUploadButton(),
        SizedBox(
          height: 10,
        ),
        _buildDelete(),
      ],
    );
  }

  Widget _buildUploadButton() {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.file_upload),
    );
  }

  Widget _buildDelete() {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.delete),
    );
  }

  Widget _buildEditHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 28.0),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Edit Profile',
            style: Theme.of(context).textTheme.headline3,
          )),
    );
  }

  Widget _buildEditCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.0),
      child: Card(
        elevation: 6,
        shape: button_border_radius,
        child: Column(
          children: <Widget>[
            _buildNameTextField(),
            _buildNumberTextField(),
            _buildAddressTextField(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: 'Test User',
      ),
    );
  }

  Widget _buildNumberTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: '+92-123-1234567',
      ),
    );
  }

  Widget _buildAddressTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: 'Kohat Pakistan',
      ),
    );
  }

  Widget _buildButton() {
    return FlatButton(
      shape: button_border_radius,
      onPressed: () {},
      color: Colors.green,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 30),
        child: Text('Update'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Edit Profile'),
      drawer: AppDrawer(),
      body: _buildScreenUI(context),
    );
  }
}
