
import 'package:equatable/equatable.dart';
import 'package:food/modules/auth/logic/auth.model.dart';

class AppState extends Equatable {
  // final SettingState settings;
  final AuthState auth;

  AppState({
    // this.settings,
    this.auth
  });

  factory AppState.initial() {
    return AppState(
      // settings: SettingState.initial(),
      auth: AuthState.initial()
    );
  }

  AppState copyWith() {
    return AppState(
      // settings: settings ?? this.settings,
      auth: auth ?? this.auth,
    );
  }

  @override
  List<Object> get props => [
    // settings,
    auth
  ];
}

