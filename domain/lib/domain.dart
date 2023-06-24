library domain;

import 'package:domain/di/locator.dart';

export './src/commons/commons.dart';
export './src/authentication/authentication.dart';
export './src/card/card.dart';

class Domain {
  static void init(Map<String, String> env) {
    /// setup required locators for domain module
    configureDependencies(env);
  }
}
