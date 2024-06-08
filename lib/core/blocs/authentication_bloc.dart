import 'package:campus_connect_v2/core/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  loading,
  failed,
}

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User? currentUser;
  final String? errorMessage;

  const AuthenticationState(
      {this.status = AuthenticationStatus.unauthenticated,
      this.currentUser,
      this.errorMessage});

  AuthenticationState copyWith(
      {AuthenticationStatus? status,
      User? currentUser,
      String? errorMessage}) {
    return AuthenticationState(
      status: status??this.status,
      currentUser: currentUser??this.currentUser,
      errorMessage: errorMessage??this.errorMessage
    );
  }

  @override
  List<Object?> get props => [];
}

class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAuthenticationState extends AuthenticationEvent {}

class UserChanges extends AuthenticationEvent {}

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<LoadAuthenticationState>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      const User user = User(id: '100', firstName: 'Prateek', lastName: 'Thakur', email: 'prateekthakur272@gmail.com', avatarUrl: '');
      emit(state.copyWith(currentUser: user, status: AuthenticationStatus.authenticated));
    });
    on<UserChanges>((event, emit) {});
  }
}
