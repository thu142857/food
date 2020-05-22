import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:food/drawer_menu.dart';
import 'package:food/redux/IStore.dart';
import 'package:food/redux/store.dart';
import 'package:lipsum/lipsum.dart'  as lipsum;

const kAppTitle = 'States by Redux';
const kStateType = '...';


class Dashboard extends StatelessWidget{
   String text = lipsum.createText(
    numParagraphs: 3,
    numSentences: 15,
  );
  @override 
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        backgroundColor: Color.fromRGBO(21,198,249,1),
      ),
      drawer: DrawerMenu(),
      body: Container(
        // margin: EdgeInsets.all(10),
        child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context,state){
            return ListView(
              scrollDirection: Axis.vertical ,
              children: <Widget>[
                Container(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: state.settings.viewFontSize,
                      color: Colors.black,
                      fontWeight: state.settings.bold ? FontWeight.bold : FontWeight.normal,
                      fontStyle: state.settings.italic ? FontStyle.italic : FontStyle.normal,
                    ),
                  ),
                ),
              ],
            );
          },
          
        ),
      ),
    );
  }
  
}