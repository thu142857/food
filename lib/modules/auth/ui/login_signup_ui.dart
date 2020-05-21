import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:food/dashboard.dart';

import 'package:food/modules/auth/auth.dart';
import 'package:food/modules/auth/logic/helpers.dart';
import 'package:food/modules/auth/logic/login.reducer.dart';
import 'package:food/redux/IStore.dart';
import 'package:food/redux/store.dart';
class LoginSignupPage extends StatefulWidget {
  //  LoginSignupPage({this.auth});

  // final BaseAuth auth;
  // final VoidCallback loginCallback;

  @override
  State<StatefulWidget> createState() => new _LoginSignupPageState();

}

class _LoginSignupPageState extends State<LoginSignupPage>{
  bool _isLoading ;
  bool _isLoginForm;
  
  bool passwordVisible;

  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;


  validateEmail(value) {
    if (value == null || value == '') {
      return 'Enter an email';
    }
    return ;
  }

  validatePassword(value) {
    if (value.length < 6) {
      return 'Password length must be more than 6';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter login demo'),
        ),

        body: Container(
          child: StoreConnector<AppState,AppState>(
            distinct: true,
            converter: (store) => store.state,
            builder: (context,state){
              final username = store.state.auth.username;
              if (username != null) {
               // Navigator.pop((context) => Dashboard());
              }

              return showForm();
              // return showForm();
              
              // showCircularProgress();
            },
          ),
        ),
      );
  }
 // Check if form is valid before perform login or signup
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await signIn(_email, _password);
          await onSuccessLogin(_email, _password);  
          Navigator.of(context).pushReplacementNamed('dashboard');
          // await store.dispatch(loginWithPassword(_email, _password));     
          print('Signed in: $userId');


        } else {
          userId = await signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          // widget.loginCallback();?
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    passwordVisible = false;
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }
  
  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }


  Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => validateEmail(value),
        onChanged: (value){
                  setState(() => _email = value);
                }
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: !passwordVisible,
        // autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                passwordVisible
                ? Icons.visibility
                : Icons.visibility_off,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: (){
                setState(() {
                  passwordVisible =! passwordVisible;
                });
              },
            ),),
          
        validator: (value) => validatePassword(value),
        onChanged: (value){
                  setState(() => _password = value);
                }
      ),
    );
  }
  Widget showPrimaryButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      child: RaisedButton(
        elevation: 5.0,
        // padding: EdgeInsets.symmetric(vertical: 10),
        color: Color.fromRGBO(237,88,77,1.0),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        child: Text(
          _isLoginForm ? 'Login' : 'Create account',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        onPressed: validateAndSubmit,
      ),
    );
  }


  Widget showSecondaryButton() {
    return new FlatButton(
        child: new Text(
            _isLoginForm ? 'Create an account' : 'Have an account? Sign in',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
        onPressed: toggleFormMode);
  }

  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 80.0,
          
          child: Image.asset('assets/food.png'),
        ),
      ),
    );
  }
  

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
  Widget showForm() {
  return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        key: _formKey,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showLogo(),
            showEmailInput(),
            showPasswordInput(),
            showPrimaryButton(),
            showSecondaryButton(),
            showErrorMessage(),
          ],
        ),
      ));
  }
  
}