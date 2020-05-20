import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable{
  final bool isLoading;
  final String username;
  final String password;
  final bool isRightUsername;
  final bool isRightPassword;

  AuthState({
    this.isLoading,
    this.username,
    this.password,
    this.isRightUsername,
    this.isRightPassword,
  });


  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      password: null,
      username: null,
      isRightUsername: false,
      isRightPassword: false,
    );
  }

  AuthState copyWith({
    bool isLoading,
    String username,
    String password,
    bool isRightUsername,
    bool isRightPassword,
  }){
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      username: username ?? this.username,
      password: password ?? this.password,
      isRightUsername: isRightUsername ?? this.isRightUsername,
      isRightPassword: isRightPassword ?? this.isRightPassword,
    );
  }
  @override 
  List<Object> get props => [
    isLoading,
    username,
    password,
    isRightUsername,
    isRightPassword,
  ];
}