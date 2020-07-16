import 'package:flutter/material.dart';

Widget buildOrdersList(BuildContext context, int index, List ordersList) {
  var orderList = ordersList;
  
    return ListTile(
        leading: _buildLeading(index, orderList),
        title: _buildTitle(index, orderList),
        subtitle: _buildSubTitle(index, orderList),
        trailing: _buildTrailing(context, index, orderList));
  }

  Widget _buildLeading(int index, List orderList) {
    return Image.asset('${orderList[index].image}');
  }

  Widget _buildTitle(int index,List orderList) {
    return Text('${orderList[index].title}');
  }

  Widget _buildSubTitle(int index,List orderList) {
    return Row(
      children: <Widget>[Text('Qty : '), Text('${orderList[index].qty}')],
    );
  }

  Widget _buildTrailing(BuildContext context, int index,List orderList) {
    return Column(children: <Widget>[
      Text('\$${orderList[index].price}',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
      Text('${orderList[index].date}', style: TextStyle(fontSize: 11)),
      Text('${orderList[index].time}', style: TextStyle(fontSize: 11))
    ]);
  }