import 'package:flutter/material.dart';
import 'package:resturant_rider_app/elements/appbar.dart';
import 'package:resturant_rider_app/elements/drawer.dart';
import 'package:resturant_rider_app/models/notification_model.dart';

class Notifi extends StatefulWidget {
  Notifi({Key key}) : super(key: key);

  @override
  NotifiState createState() {
    return NotifiState();
  }
}

class NotifiState extends State<Notifi> {
  var details = <NotificationDetails>[
    NotificationDetails(
      image: 'assets/img/qorma.jpg',
      title: 'Order # 23 is assigned to you.',
      subTitle: 'Lorem Ipsum',
    ),
    NotificationDetails(
      image: 'assets/img/qorma.jpg',
      title: 'Order # 23 is assigned to you.',
      subTitle: 'Lorem Ipsum',
    ),
    NotificationDetails(
      image: 'assets/img/qorma.jpg',
      title: 'Order # 23 is assigned to you.',
      subTitle: 'Lorem Ipsum',
    ),
    NotificationDetails(
      image: 'assets/img/qorma.jpg',
      title: 'Order # 23 is assigned to you.',
      subTitle: 'Lorem Ipsum',
    ),
  ];

  Widget _buildScreenUI() {
    return Column(
      children: <Widget>[_buildHeader(), _buildNotificationPortion()],
    );
  }

  Widget _buildHeader() {
    return ListTile(
      leading: Icon(
        Icons.notifications,
        color: Colors.black,
      ),
      title: Text(
        'Notifications',
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text('Swipe right to dismiss.'),
    );
  }

  Widget _buildNotificationPortion() {
    return Container(
      child: Expanded(
        child: Container(child: _buildListView()),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: details.length,
      itemBuilder: (context, index) {
        final detail = details[index];
        return _buildDismissible(index);
      },
    );
  }

  Widget _buildDismissible(int index) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      key: Key(details[index].toString()),
      background: Container(
        color: Colors.transparent,
      ),
      // onDismissed: (direction) {
      // },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
          child: _buildCard(index)),
    );
  }

  Widget _buildCard(int index) {
    return Card(
        elevation: 3,
        child: ListTile(
          leading: Image.asset(details[index].image),
          title: Text(
            details[index].title,
          ),
          subtitle: Text(details[index].subTitle),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, 'Notifiations'),
        drawer: AppDrawer(),
        body: _buildScreenUI());
  }
}
