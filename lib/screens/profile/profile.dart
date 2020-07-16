import 'package:flutter/material.dart';
import 'package:resturant_rider_app/routes/route_constants.dart';
import 'package:resturant_rider_app/screens/profile/ProfileSettingsDialog.dart';
import 'package:resturant_rider_app/shared/variable.dart';

class Profile extends StatelessWidget {
  Widget _buildScreenUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          _buildDpRow(context),
          SizedBox(
            height: 40,
          ),
          _buildDeliveryBoyDetails(context),
          SizedBox(
            height: 20,
          ),
          _buildRemoveAccountCard(),
          SizedBox(
            height: 40,
          ),
        ],
      ),
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
            width: 40,
          ),
          _buildEditButton(context),
        ],
      ),
    );
  }

  Widget _buildUserDp() {
    return CircleAvatar(
      radius: 40,
      backgroundImage: AssetImage('assets/img/germany.png'),
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildName(context),
        SizedBox(
          height: 3,
        ),
        _buildEmail(context),
      ],
    );
  }

  Widget _buildName(BuildContext context) {
    return Text(
      'Robert Gill',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget _buildEmail(BuildContext context) {
    return Text(
      'testuser@test.com',
      style: Theme.of(context).textTheme.subtitle2,
    );
  }

  Widget _buildDeliveryBoyDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Card(
        elevation: 6,
        shape: button_border_radius,
        child: Column(
          children: <Widget>[
            _buildHeader('Profiel Setting'),
            _buildSettingName(),
            _buildSettingEmail(),
            _buildPhone(),
            _buildAddress(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return ListTile(
        leading: Icon(Icons.settings),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: ButtonTheme(
          padding: EdgeInsets.all(0),
          minWidth: 50.0,
          height: 25.0,
          child: ProfileSettingsDialog(),
        ));
  }

  Widget _buildSettingName() {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text('Robert Gill'),
    );
  }

  Widget _buildSettingEmail() {
    return ListTile(
      leading: Icon(Icons.email),
      title: Text('testuser@test.com'),
    );
  }

  Widget _buildAddress() {
    return ListTile(
      leading: Icon(Icons.location_on),
      title: Text('Kohat, Pakistan'),
    );
  }

  Widget _buildPhone() {
    return ListTile(
      leading: Icon(Icons.call),
      title: Text('+92-321-1234567'),
    );
  }

  Widget _buildRemoveAccountCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Card(
          elevation: 6,
          shape: button_border_radius,
          child: Column(
            children: <Widget>[
              _buildAppSettingHeader(),
              _buildLanguageBar(),
              _buildHelpSupportBar(),
            ],
          )),
    );
  }

  Widget _buildAppSettingHeader() {
    return ListTile(
      leading: Icon(Icons.settings),
      title: Text(
        'App Setting',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLanguageBar() {
    return ListTile(
      leading: Icon(Icons.language),
      title: Text('English'),
    );
  }

  Widget _buildHelpSupportBar() {
    return ListTile(
      leading: Icon(Icons.help),
      title: Text('Help and Support'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Setting",
          style: TextStyle(color: my_base_color),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, OrdersView);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: my_base_color,
          ),
          color: my_base_color,
        ),
      ),
      body: SafeArea(child: _buildScreenUI(context)),
    );
  }
}
