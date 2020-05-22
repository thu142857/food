import 'package:food/modules/settings/logic/settings.action.dart';
import 'package:redux/redux.dart';
import 'package:food/modules/settings/logic/settings.action.dart';
import 'package:food/modules/settings/logic/settings.model.dart';

final Reducer<SettingState> settingsReducer = combineReducers([
  TypedReducer<SettingState, SettingFontSize>(settingFontSize),
  TypedReducer<SettingState, SettingBold>(settingBold),
  TypedReducer<SettingState, SettingItalic>(settingItalic),
  
]);


SettingState settingFontSize(SettingState state, SettingFontSize action) {
  state = state.copyWith(sliderFontSize: action.sliderFontSize);
  return state;
}

SettingState settingBold(SettingState state, SettingBold action) {
  state = state.copyWith(bold: action.bold);
  return state;
}

SettingState settingItalic(SettingState state, SettingItalic action) {
  state = state.copyWith(italic: action.italic);
  return state;
}
