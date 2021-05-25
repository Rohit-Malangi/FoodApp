import 'package:flutter/material.dart';

import '../screens/filter.dart';

class DrawerWidget extends StatelessWidget {
  Widget listTile(String text, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              "FOOD APP",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          listTile(
            'Home',
            Icons.home,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          listTile(
            'Filter',
            Icons.filter,
            () {
              Navigator.of(context).pushReplacementNamed(Filter.routeName);
            },
          ),
        ],
      ),
    );
  }
}
