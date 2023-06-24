part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final bool isAuthenticated;
  final Exception? exception;
  // final Token? token;
  const AuthenticationState({
    this.isAuthenticated = false,
    this.exception,
    // this.token,
  });

  const AuthenticationState._({
    this.isAuthenticated = false,
    this.exception,
    // this.token,
  });

  const AuthenticationState.initial()
      : this._(
          isAuthenticated: false,
          exception: null,
          // token: null,
        );

  AuthenticationState copyWith({
    isAuthenticated,
    Exception? exception,
    // Token? token,
  }) {
    return AuthenticationState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      exception: exception ?? this.exception,
      // token: token ?? this.token,
    );
  }

  @override
  List<Object> get props => [isAuthenticated];
}
