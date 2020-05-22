import 'package:food/modules/auth/logic/login.reducer.dart';
import 'package:food/modules/settings/logic/settings.reducer.dart';
import './IStore.dart';

AppState appStateReducer(AppState state, action){
  return AppState(
    auth: authReducer(state.auth, action),
    settings: settingsReducer(state.settings, action)
  );
}