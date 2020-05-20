import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:food/redux/IStore.dart';
  

const kAppTitle = 'States by Redux';
const kStateType = '...';


class Dashboard extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        backgroundColor: Color.fromRGBO(21,198,249,1),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context,state){
          },
          
        ),
      ),
    );
  }
  
}