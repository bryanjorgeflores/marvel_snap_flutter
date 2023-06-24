import 'package:equatable/equatable.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.initial()) {
    // on<GetTokenFromStorageEvent>(_onGetUserFromStorage);
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  // void _onGetUserFromStorage(
  //     GetTokenFromStorageEvent event, Emitter<AuthenticationState> emit) async {
  //   await emit.forEach<void>(_authenticationRepository.getTokenFromStorage(),
  //       onData: (token) {
  //     if (token.accessToken != null) {
  //       return state.copyWith(isAuthenticated: true, token: token);
  //     }
  //     return state.copyWith(isAuthenticated: false, token: null);
  //   }, onError: <CustomException>(exception, __) {
  //     return state.copyWith(isAuthenticated: false, exception: exception);
  //   });
  // }

  void _onLogin(LoginEvent event, Emitter<AuthenticationState> emit) async {
    await emit.forEach<void>(_authenticationRepository.login(),
        onData: (token) {
      return state.copyWith(
        isAuthenticated: true,
      );
    }, onError: <Exception>(exception, __) {
      return state.copyWith(isAuthenticated: false, exception: exception);
    });
  }

  void _onLogout(LogoutEvent event, Emitter<AuthenticationState> emit) async {
    await emit.forEach<void>(_authenticationRepository.logout(), onData: (_) {
      return state.copyWith(
        isAuthenticated: false,
      );
    }, onError: <Exception>(exception, __) {
      return state.copyWith(isAuthenticated: true, exception: exception);
    });
  }
}
