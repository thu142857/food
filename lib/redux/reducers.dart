import 'package:food/modules/auth/logic/login.reducer.dart';
import './IStore.dart';

AppState appStateReducer(AppState state, action){
  return AppState(
    auth: authReducer(state.auth, action)
  );
}