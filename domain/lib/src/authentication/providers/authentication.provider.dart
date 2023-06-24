import 'package:injectable/injectable.dart';

@singleton
@injectable
class AuthenticationProvider {
  AuthenticationProvider();

  Future<String> login() async {
    // await oauth.login();
    // String token = await oauth.getAccessToken() ?? '';
    return '';
  }

  Future<String> logout() async {
    // return oauth.logout();
    return '';
  }
}
