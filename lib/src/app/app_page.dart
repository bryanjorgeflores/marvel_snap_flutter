import 'package:domain/di/locator.dart';
import 'package:domain/domain.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/routes/application.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poke_test/src/config/routes/routes.dart';
import 'package:presentation/styles/theme.dart';
import 'package:presentation/containers/authentication/bloc/authentication_bloc.dart';
import 'package:presentation/containers/commons/messages/bloc/message_bloc.dart';
import 'package:presentation/containers/commons/cards/bloc/cards_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  _AppPageState() {
    Application.router = FluroRouter();
    Routes.configureRoutes(Application.router);
  }

  List<BlocProvider> providers(BuildContext mainContext) {
    AuthenticationBloc authenticationBloc = AuthenticationBloc(
        authenticationRepository: getIt<AuthenticationRepository>());

    return [
      BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) =>
              authenticationBloc..add(GetTokenFromStorageEvent())),
      BlocProvider<MessageBloc>(
          create: (BuildContext context) => MessageBloc()),
      BlocProvider<CardsBloc>(
        create: (BuildContext context) =>
            CardsBloc(cardRepository: getIt<CardRepository>()),
      ),
    ];
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers(context),
      child: BlocListener<MessageBloc, MessageState>(
        listener: (context, state) {
          if (state is MessageError) {
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          if (state is MessageSuccess) {
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          if (state is MessageWarning) {
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.orange,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        child: MaterialApp(
          title: 'Marvel Snap',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Cc-Ultimatum',
            appBarTheme: const AppBarTheme(
              elevation: 0,
              color: white,
              iconTheme: IconThemeData(
                color: black,
              ),
              titleTextStyle: TextStyle(
                color: black,
                fontWeight: FontWeight.w500,
              ),
            ),
            dividerColor: Colors.transparent,
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: const [
            Locale('es', ''),
          ],
          onGenerateRoute: Application.router.generator,
        ),
      ),
    );
  }
}
