import 'package:flutter/material.dart';
import 'package:food/modules/auth/logic/helpers.dart';
import 'package:food/modules/auth/logic/login.reducer.dart';

const kTitle = 'Redux';

class DrawerMenu extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    logout() async {
      await onLogOut();
      Navigator.of(context).pushReplacementNamed('auth.login');
    }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                kTitle,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.title.fontSize,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(21,198,249,1),
            ),
          ),
          getListTile('Home', onTap: () {
            Navigator.of(context).pushReplacementNamed('dashboard');
          }),
          getLine(),
          getListTile('About', onTap: () {
            Navigator.pushReplacementNamed(context, '/about');
          }),
          getLine(),
          getListTile('Settings', onTap: () {
            Navigator.of(context).pushReplacementNamed('settings');
          }),
          getLine(),
          getListTile('Logout', onTap: () async
            {
              await logout();
            }),
        ],
      ),
    );
  }

  Widget getLine() {
    return SizedBox(
      height: 0.5,
      child: Container(
        color: Colors.grey,
      ),
    );
  }

  Widget getListTile(title, {Function onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}