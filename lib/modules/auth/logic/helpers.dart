
import 'package:food/modules/auth/logic/auth.action.dart';
import 'package:food/modules/auth/logic/login.reducer.dart';
import 'package:food/redux/store.dart';

// // onLoginWithEmail() async {
// //   await store.dispatch(SetCurrentScreen('auth.login.password'));
// // }

// onChangePasswordField(String value) async {
//   await store.dispatch(SetPassword(value));
// }

// onChangeEmailField(String value) async {
//   await store.dispatch(SetEmail(value));
// }

onSuccessLogin(String username, String password) async {
  await store.dispatch(loginWithPassword(username, password));
}
