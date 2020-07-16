import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:resturant_rider_app/elements/appbar.dart';
import 'package:resturant_rider_app/elements/drawer.dart';
import 'package:resturant_rider_app/shared/variable.dart';

class Home extends StatelessWidget {
  Widget _buildScreenUI(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: <Widget>[
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: _buildHeader(context),
        ),
        Container(height: 150, child: _buildMealsList(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: _buildCustomItemsRow(
            "Trending Items",
            () {},
            context,
          ),
        ),
        SizedBox(height: 20),
        Container(height: 150, child: _buildTrendingItemsList(context)),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: _buildCustomItemsRow(
            "Nearby Cook",
            () {},
            context,
          ),
        ),
        SizedBox(height: 20),
        Container(height: 220, child: _buildNearbyItemsList(context)),
        SizedBox(height: 20)
      ],
    );
  }

  Widget _buildTopMeals(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(children: <Widget>[
        // _buildHeader(context),
        _buildMealsList(context),
        // _buildCustomItemsRow(
        //   "Trending Items",
        //   () {},
        //   context,
        // ),
        SizedBox(height: 10),
        // _buildTrendingItemsList(context),
        SizedBox(height: 20),
        // // _buildCustomItemsRow(
        //   "Nearby Cook",
        //   () {},
        //   context,
        // ),
        SizedBox(height: 10),
        // _buildTrendingItemsList(context),
      ]),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Top Meals',
            style: Theme.of(context).textTheme.title,
          ),
          FlatButton.icon(
              onPressed: null,
              icon: Icon(
                Icons.filter_list,
                color: my_base_color,
              ),
              label: Text(
                'Filter',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .merge(TextStyle(color: my_base_color)),
              ))
        ]);
  }

  Widget _buildMealsList(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 12,
      itemBuilder: (context, i) {
        return Row(
          children: <Widget>[
            SizedBox(width: 15),
            _buildMenuCard(context),
          ],
        );
      },
      scrollDirection: Axis.horizontal,
      primary: false,
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget _buildMenuCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildImage(),
        SizedBox(
          height: 7,
        ),
        _buildLabel(context)
      ],
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/img/dish.png',
        width: 90,
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Text('Logo',
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .merge(TextStyle(fontWeight: FontWeight.bold)));
  }

  Widget _buildCustomItemsRow(
      String title, VoidCallback navigation, BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Container(
              child: Text("View All",
                  style: TextStyle(
                      color: Color(0xff818181), fontWeight: FontWeight.bold)),
              decoration: BoxDecoration(
                  color: Color(0xffF1E0E0),
                  borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            ),
          ),
        ]);
  }

  Widget _buildTrendingItemsList(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 12,
      itemBuilder: (context, i) {
        return Row(
          children: <Widget>[
            SizedBox(width: 15),
            _buildTrendingItemCard(context),
          ],
        );
      },
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
    );
  }

  Widget _buildTrendingItemCard(BuildContext context) {
    return Container(
        width: 320,
        height: 250,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xffEFEFEF), width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: <Widget>[
            SizedBox(width: 7),
            Image.asset(
              'assets/img/dish.png',
              width: 100,
            ),
            SizedBox(width: 15),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Chicken Qorma',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        'By John',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .merge(TextStyle(color: Color(0xff7F7F7F))),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '\$30',
                        style: Theme.of(context).textTheme.title.merge(
                            TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7F7F7F))),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '\$20',
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .merge(TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildNearbyItemsList(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 12,
      itemBuilder: (context, i) {
        return Row(
          children: <Widget>[
            SizedBox(
              width: 15,
            ),
            _buildNearbyItemCard(context),
          ],
        );
      },
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
    );
  }

  Widget _buildNearbyItemCard(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffEFEFEF), width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                'assets/img/image.png',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Chicken Qorma',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        'By John',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .merge(TextStyle(color: Color(0xff7F7F7F))),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '\$30',
                        style: Theme.of(context).textTheme.title.merge(
                            TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7F7F7F))),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '\$20',
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .merge(TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
                ],
              ),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Home'),
      drawer: AppDrawer(),
      body: SafeArea(
        child: _buildScreenUI(context),
      ),
    );
  }
}
