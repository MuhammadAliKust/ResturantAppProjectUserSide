import 'package:flutter/material.dart';
import 'package:resturant_rider_app/routes/route_constants.dart';
import 'package:resturant_rider_app/screens/order/orders_list.dart';
import 'package:resturant_rider_app/shared/variable.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildUserAccountHeader(context),
          // _createHeader(),
          _createDrawerItem(
              icon: Icons.shopping_cart,
              text: 'Orders',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, OrdersView);
              }),
          _createDrawerItem(
            icon: Icons.history,
            text: 'Orders History',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, OrderHistoryView);
            },
          ),
          _createDrawerItem(
              icon: Icons.notifications,
              text: 'Notifications',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, NotificationView);
              }),
          Divider(),
          _createDrawerItem(
              icon: Icons.person,
              text: 'Profile',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, DetailedProfileView);
              }),
          _createDrawerItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, ProfileView);
              }),
          _createDrawerItem(
              icon: Icons.verified_user,
              text: 'Login',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, LoginView);
              }),
          _createDrawerItem(
              icon: Icons.account_box,
              text: 'Register',
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushNamed(context, SignUpView);
              }),
          _createDrawerItem(icon: Icons.help, text: 'Help and Support'),
          Divider(),
          _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildUserAccountHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text('Robert Gill',
          style: Theme.of(context)
              .textTheme
              .title
              .merge(TextStyle(color: my_base_color))),
      accountEmail:
          Text('test@test.com', style: TextStyle(color: my_base_color)),
      decoration: BoxDecoration(color: Color(0xFFF3DFBF)),
      currentAccountPicture: new CircleAvatar(
          radius: 80.0,
          backgroundColor: const Color(0xFFF3DFBF),
          backgroundImage: AssetImage('assets/img/avatar.png')),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
