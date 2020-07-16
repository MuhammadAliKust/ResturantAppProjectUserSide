import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:resturant_rider_app/elements/appbar.dart';
import 'package:resturant_rider_app/elements/drawer.dart';
import 'package:resturant_rider_app/elements/order_list_widget.dart';
import 'package:resturant_rider_app/models/order_model.dart';
import 'package:resturant_rider_app/routes/route_constants.dart';
import 'package:resturant_rider_app/shared/variable.dart';

class DetailedProfile extends StatefulWidget {
  @override
  _DetailedProfileState createState() => _DetailedProfileState();
}

class _DetailedProfileState extends State<DetailedProfile> {
  bool isExpanded = false;

  var orderList = [
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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              _buildCustomUIContainer(context),
              Positioned(
                  left: 20,
                  right: 20,
                  top: 160,
                  child: Card(
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // child: Column(children: <Widget>[]),
                    ),
                  )),
            ],
          ),
          _buildAboutSection(context),
          _buildRecentOrderSection(context)
        ],
      ),
    );
  }

  Widget _buildCustomUIContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(child: _buildHeader(context)),
      height: 300,
      decoration: BoxDecoration(
          color: bg_card_colors,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          _buildSectionsHeader(context, 'About'),
          SizedBox(
            height: 5,
          ),
          _buildAboutDetailed(context)
        ],
      ),
    );
  }

  Widget _buildSectionsHeader(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.title,
    );
  }

  Widget _buildAboutDetailed(BuildContext context) {
    return Text(
        'The software is licensed „as-is.“ You bear the risk of using it. datronicsoft gives no express warranties, guarantees or conditions. You may have additional consumer rights under your local laws which this agreement cannot change. To the extent permitted under your local laws, datronicsoft excludes the implied warranties of merchantability, fitness for a particular purpose and non-infringement.',
        style: Theme.of(context).textTheme.subtitle1);
  }

  Widget _buildRecentOrderSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          _buildSectionsHeader(context, 'Recent Orders'),
          SizedBox(
            height: 5,
          ),
          _buildExpansionTile(context),
        ],
      ),
    );
  }

  Widget _buildExpansionTile(BuildContext context) {
    return Theme(
      data: ThemeData(accentColor: my_base_color),
      child: ExpansionTile(
        title: Text(
          'Order Id: 42',
        ),
        subtitle: Text(
          "Delivered",
        ),
        children: <Widget>[
          ListView.builder(
              shrinkWrap: true,
              itemCount: orderList.length,
              itemBuilder: (BuildContext context, int index) {
                return buildOrdersList(context, index, orderList);
              })
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 30),
        CircleAvatar(
          radius: 55,
          backgroundImage: AssetImage('assets/img/avatar.png'),
        ),
        SizedBox(
          height: 20,
        ),
        _buildName(context),
        _buildEmail(context),
      ],
    );
  }

  Widget _buildName(BuildContext context) {
    return Text(
      'Robert Gill',
      style: Theme.of(context)
          .textTheme
          .headline6
          .merge(TextStyle(color: Colors.white)),
    );
  }

  Widget _buildEmail(BuildContext context) {
    return Text(
      'testuser@test.com',
      style: Theme.of(context)
          .textTheme
          .subtitle2
          .merge(TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: my_base_color,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.sort,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          title: Text(
            'Profile',
            style: Theme.of(context)
                .textTheme
                .title
                .merge(TextStyle(letterSpacing: 1.3, color: Colors.white)),
          ),
          centerTitle: true,
        ),
        drawer: AppDrawer(),
        backgroundColor: Colors.white,
        body: SafeArea(child: _buildScreenUI(context)));
  }
}
