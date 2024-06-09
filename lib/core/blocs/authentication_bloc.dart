import 'package:campus_connect_v2/core/models/models.dart';
import 'package:campus_connect_v2/screens/auth/repository/auth_repository.dart';
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
      {AuthenticationStatus? status, User? currentUser, String? errorMessage}) {
    return AuthenticationState(
        status: status ?? this.status,
        currentUser: currentUser ?? this.currentUser,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [status, errorMessage, currentUser];
}

class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadUserDetails extends AuthenticationEvent {}

class Login extends AuthenticationEvent {
  final String email;
  final String password;
  Login(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class LogOut extends AuthenticationEvent {}

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository repository;

  AuthenticationBloc(this.repository) : super(const AuthenticationState()) {
    on<LoadUserDetails>((event, emit) async {
      emit(state.copyWith(status: AuthenticationStatus.loading));
      final token = await repository.getToken();
      if (token != null) {
        const User user = User(
            id: '100',
            firstName: 'Prateek',
            lastName: 'Thakur',
            email: 'prateekthakur272@gmail.com',
            avatarUrl: '');
        emit(state.copyWith(
            currentUser: user, status: AuthenticationStatus.authenticated));
      }else{
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      }
    });
    on<Login>((event, emit) async {
      emit(state.copyWith(status: AuthenticationStatus.loading));
      final token = await repository.logIn(event.email, event.password);
      final User user = User(
          id: '100',
          firstName: 'Prateek',
          lastName: 'Thakur',
          email: event.email,
          avatarUrl: '');
      emit(state.copyWith(status: AuthenticationStatus.authenticated, currentUser: user));
    });
    on<LogOut>((event, emit) async {
      emit(state.copyWith(status: AuthenticationStatus.loading));
      repository.logOut();
      emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
    });
  }
}
