import 'package:domain/src/authentication/errors/precondition_failed.dart';

class AuthenticationMapping {
  fromStringTokenToToken(String tokenString) {
    // Map<String, dynamic> info = decode(tokenString);
    return '';
  }

  // Token concatUser(Token token, User user) {
  //   token.user = user;
  //   return token;
  // }

  // Map<String, dynamic> decode(String token) {
  //   return Jwt.parseJwt(token);
  // }

  toThrow(dynamic error) {
    if (error.message) {
      throw PreconditionFailed(
          title: 'Error de Autenticación', message: error.message);
    }
    throw PreconditionFailed(
        title: 'Error de Autenticación',
        message: 'Ocurrio un error al autenticar');
  }
}
