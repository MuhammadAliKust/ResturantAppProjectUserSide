import 'package:flutter/material.dart';
import 'package:resturant_rider_app/shared/variable.dart';
import 'package:resturant_rider_app/elements/appbar.dart';
import 'package:resturant_rider_app/elements/drawer.dart';

class ChangePassword extends StatelessWidget {
  Widget _buildScreenUI(){
    return Column(
      children: <Widget>[
        SizedBox(height: 20,),
        Column(
          children: <Widget>[
            _buildChangePasswordCard(),
            
            SizedBox(height: 20,),
            _buildButton()
          ],
        ),
      ],
    );
  }

  Widget _buildChangePasswordCard() {
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
        decoration: InputDecoration(hintText: 'Old Password',
        suffixIcon: Icon(Icons.remove_red_eye)),
        
      ),
    );
  }

  Widget _buildNumberTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
         decoration: InputDecoration(hintText: 'New Password',
        suffixIcon: Icon(Icons.remove_red_eye))
      ),
    );
  }

  Widget _buildAddressTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
         decoration: InputDecoration(hintText: 'Confirm New Password',
        suffixIcon: Icon(Icons.remove_red_eye))
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
      appBar: appBar(context, 'Change Password'),
      drawer: AppDrawer(),
      body: _buildScreenUI(),
    );
  }
}