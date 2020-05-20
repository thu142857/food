import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import './IStore.dart';
import './reducers.dart';

final store = Store<AppState>(
  appStateReducer,
  initialState: AppState.initial(),
  middleware: [thunkMiddleware]
);
