import 'package:food/redux/store.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food/helpers/persistentState.dart';
import 'package:food/modules/auth/logic/auth.action.dart';
import 'package:food/modules/auth/logic/auth.model.dart';
import 'package:food/modules/auth/logic/helpers.dart';
import 'package:food/redux/IStore.dart';
import 'package:redux_thunk/redux_thunk.dart';





final Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, SetLoading>(setLoading),
  TypedReducer<AuthState, SetEmail>(setEmail),
  TypedReducer<AuthState, SetPassword>(setPassword),
  TypedReducer<AuthState, SetIsRightPassword>(setIsRightPassword),
  TypedReducer<AuthState, SetIsRightUsername>(setIsRightUsername),
]);

AuthState setLoading(AuthState state, SetLoading action) {
  state = state.copyWith(isLoading: action.isLoading);

  return state;
}

AuthState setEmail(AuthState state, SetEmail action) {
  state = state.copyWith(username: action.email);

  return state;
}

AuthState setPassword(AuthState state, SetPassword action) {
  state = state.copyWith(password: action.password);

  return state;
}

AuthState setIsRightUsername(AuthState state, SetIsRightUsername action) {
  state = state.copyWith(isRightUsername: action.isRightUsername);

  return state;
}

AuthState setIsRightPassword(AuthState state, SetIsRightPassword action) {
  state = state.copyWith(isRightPassword: action.isRightPassword);

  return state;
}

ThunkAction<AppState> initialAuthData() {
  return (Store<AppState> store) async {
    try {
        // PersistentState persistor = PersistentState(
        //   await SharedPreferences.getInstance()
        //   );

        // await store.dispatch(SetEmail(persistor.username));
        // await store.dispatch(SetEmail(persistor.password));
    } catch (e) {
      print(e);
    }
  };
}

ThunkAction<AppState> loginWithPassword(String email, String password){
  return (store) async{
    try {
      // final String email = store?.state?.auth?.username;
      // final String password = store?.state?.auth?.password;
      await store.dispatch(SetEmail(email));
      await store.dispatch(SetPassword(password));
    } catch (e) {
    }
  };
}
