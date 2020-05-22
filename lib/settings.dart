import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:food/drawer_menu.dart';
import 'package:food/modules/settings/logic/settings.action.dart';
import 'package:food/redux/IStore.dart';
// import 'package:food/redux/actions.dart';
import 'package:food/modules/settings/logic/settings.reducer.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(21,198,249,1),
        title: Text('Settings'),
      ),
      drawer: DrawerMenu(),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Font Size: ${state.settings.viewFontSize.toInt()}',
                  // 'abc',
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline.fontSize),
                ),
              ),
              Slider(
                  min: 0,
                  max: 2,
                  value: state.settings.sliderFontSize,
                  onChanged: (newValue) {
                    StoreProvider.of<AppState>(context)
                        .dispatch(SettingFontSize(newValue));
                  }),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: state.settings.bold,
                        onChanged: (newValue) {
                          try {
                            StoreProvider.of<AppState>(context)
                                .dispatch(SettingBold(newValue));
                          } catch (e) {
                            print(e);
                          }
                        }),
                    Text(
                      'Bold',
                      style: getStyle(state.settings.bold, false),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: state.settings.italic,
                        onChanged: (newValue) {
                          try {
                            StoreProvider.of<AppState>(context)
                                .dispatch(SettingItalic(newValue));
                          } catch (e) {
                            print(e);
                          }
                        }),
                    Text(
                      'Italic',
                      style: getStyle(false, state.settings.italic),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      elevation: 5.0,        
                      color: Color.fromRGBO(21,198,249,1),
                      shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                      child: Text(
                        'Back to home',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onPressed: (){
                        Navigator.of(context).pushReplacementNamed('dashboard');
                      },
                    ), 
                  ]
                )
                // padding: EdgeInsets.only(right: 10.0, left: 10.0, bottom: 1.0, top: 1.0),
                // child: RaisedButton(
                //   elevation: 5.0,        
                //   color: Color.fromRGBO(21,198,249,1),
                //   shape: new RoundedRectangleBorder(
                //   borderRadius: new BorderRadius.circular(30.0)),
                //   child: Text(
                //     'Back to home',
                //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                //   ),
                //   onPressed: (){
                //     Navigator.of(context).pushReplacementNamed('dashboard');
                //   },
                // ), 
              )
            ],
          );
        },
      ),
    );
  }

  TextStyle getStyle([bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }
}