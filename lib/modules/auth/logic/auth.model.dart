import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable{
  final String currentScreen;
  final bool isLoading;
  final String username;
  final String password;
  final bool isRightUsername;
  final bool isRightPassword;

  AuthState({
    this.currentScreen,
    this.isLoading,
    this.username,
    this.password,
    this.isRightUsername,
    this.isRightPassword,
  });


  factory AuthState.initial() {
    return AuthState(
      currentScreen: null,
      isLoading: false,
      password: null,
      username: null,
      isRightUsername: false,
      isRightPassword: false,
    );
  }

  AuthState copyWith({
    String currentScreen,
    bool isLoading,
    String username,
    String password,
    bool isRightUsername,
    bool isRightPassword,
  }){
    return AuthState(
      currentScreen: currentScreen ?? this.currentScreen,
      isLoading: isLoading ?? this.isLoading,
      username: username ?? this.username,
      password: password ?? this.password,
      isRightUsername: isRightUsername ?? this.isRightUsername,
      isRightPassword: isRightPassword ?? this.isRightPassword,
    );
  }
  @override 
  List<Object> get props => [
    currentScreen,
    isLoading,
    username,
    password,
    isRightUsername,
    isRightPassword,
  ];
}