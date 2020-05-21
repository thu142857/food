import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:food/modules/auth/ui/login_signup_ui.dart';
import 'package:food/dashboard.dart';
import 'package:food/redux/IStore.dart';
import 'package:food/routers/routes.dart';
import 'package:redux/redux.dart';
import 'redux/reducers.dart';
import 'package:food/redux/store.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store, 
      child: new MaterialApp(
        onGenerateRoute: onGenerateRoute,
        title: 'Login/Signup to FOOD',
        // debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primaryColor: Color.fromRGBO(237,88,77,1.0),
          // accentColor: Color.fromRGBO(237,80,49,1.0),
        ),
        home: new LoginSignupPage(),
      )
    );
  }
}
