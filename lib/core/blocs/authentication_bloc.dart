import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationStateAuthenticated extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationStateUnauthenticated extends AuthenticationState {
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
  AuthenticationBloc() : super(AuthenticationStateUnauthenticated()) {
    on<LoadAuthenticationState>((event, emit) {
      // emit(AuthenticationStateUnauthenticated());
      emit(AuthenticationStateAuthenticated());
    });
    on<UserChanges>((event, emit) {});
  }
}
