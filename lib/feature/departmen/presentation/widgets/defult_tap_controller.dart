import 'package:flutter/material.dart';

Widget buildDefaultTabController() {
  return const DefaultTabController(
    length: 2,
    child: TabBar(
      dividerColor: Colors.black,
      indicatorColor: Colors.black,
      tabs: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: Colors.black,
            ),
            Text(
              'Users',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              color: Colors.black,
            ),
            Text('Tasks', style: TextStyle(color: Colors.black)),
          ],
        )
      ],
    ),
  );
}