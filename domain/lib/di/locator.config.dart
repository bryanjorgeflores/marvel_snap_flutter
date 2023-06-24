import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/src/authentication/mappings/authentication.mapping.dart';
import 'package:domain/src/authentication/providers/authentication.provider.dart';
import 'package:domain/src/card/providers/card.provider.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// const secureStorage = FlutterSecureStorage();
GetIt $initGetIt(GetIt getIt,
    {String? environment,
    EnvironmentFilter? environmentFilter,
    Map<String, String>? env}) {
  final gh = GetItHelper(getIt, environment);

  gh.factory<ApiProvider>(
      () => ApiProvider(urlServer: env?['API_URL'] as String));

  // Config config = Config(
  //   tenant: env?['OAUTH_TENANT'] as String,
  //   clientId: env?['OAUTH_CLIENTID'] as String,
  //   scope: env?['OAUTH_SCOPE'] as String,
  //   redirectUri: env?['OAUTH_REDIRECT_URI'] as String,
  //   navigatorKey: GlobalNavigator.navigatorKey,
  // );

  gh.factory<AuthenticationProvider>(() => AuthenticationProvider());

  gh.factory<AuthenticationMapping>(() => AuthenticationMapping());
  gh.factory<AuthenticationRepository>(() => AuthenticationRepository(
        getIt<AuthenticationProvider>(),
        getIt<AuthenticationMapping>(),
      ));

  // cards
  gh.factory<CardProvider>(() => CardProvider(getIt<ApiProvider>()));

  gh.factory<CardRepository>(() => CardRepository(
        getIt<CardProvider>(),
        getIt<AuthenticationMapping>(),
      ));

  //commons
  gh.factory<ErrorMapping>(() => ErrorMapping());

  return getIt;
}
