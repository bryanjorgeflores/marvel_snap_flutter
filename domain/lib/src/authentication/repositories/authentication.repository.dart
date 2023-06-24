library domain;

import 'package:domain/src/authentication/mappings/authentication.mapping.dart';
import 'package:domain/src/authentication/providers/authentication.provider.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthenticationRepository {
  final AuthenticationProvider _authenticationProvider;
  final AuthenticationMapping _authenticationMapping;
  AuthenticationRepository(
      this._authenticationProvider, this._authenticationMapping);

  // Stream<Token> _getUser$(Token token) {
  //   return Stream.fromFuture(_userProvider.get(token.email as String))
  //       .map((response) => response.data as String)
  //       .map((string) => User.fromStringToken(string))
  //       .map(token.addUser)
  //       .handleError(_authenticationMapping.toThrow);
  // }

  // Stream<void> getTokenFromStorage() {
  //   return Stream.fromFuture(_tokenProvider.read())
  //       .map((void tokenStorage) => tokenStorage)
  //       .handleError(_authenticationMapping.toThrow);
  // }

  Stream<void> login() {
    return Stream<String>.fromFuture(_authenticationProvider.login())
        // .map((String msToken) => Token.fromStringToken(msToken))
        // .asyncMap((Token token) => _getUser$(token).first)
        // .doOnData(_tokenProvider.save)
        .handleError(_authenticationMapping.toThrow);
  }

  Stream<void> logout() {
    return Stream<void>.fromFuture(_authenticationProvider.logout())
        .handleError(_authenticationMapping.toThrow);
  }
}
