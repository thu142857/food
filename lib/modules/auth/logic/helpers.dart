
import 'package:food/modules/auth/auth.dart';
import 'package:food/modules/auth/logic/auth.action.dart';
import 'package:food/modules/auth/logic/login.reducer.dart';
import 'package:food/redux/store.dart';

onLoginWithEmail() async {
  await store.dispatch(SetCurrentScreen('auth.login.password'));
}
onLogOut()async {
  try {
    await signOutFireBase();
    await store.dispatch(logout());
  } catch (e) {
    print(e);
  } 
}

// onChangePasswordField(String value) async {
//   await store.dispatch(SetPassword(value));
// }

// onChangeEmailField(String value) async {
//   await store.dispatch(SetEmail(value));
// }

onSuccessLogin(String username, String password) async {
  await store.dispatch(loginWithPassword(
    email: username,
    password: password,
  ));
}
