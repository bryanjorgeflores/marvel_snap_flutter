library domain;

import 'package:domain/src/authentication/mappings/authentication.mapping.dart';
import 'package:domain/src/card/card.dart';
import 'package:domain/src/card/providers/card.provider.dart';
import 'package:injectable/injectable.dart';

@injectable
class CardRepository {
  final CardProvider _cardProvider;
  final AuthenticationMapping _authenticationMapping;
  CardRepository(this._cardProvider, this._authenticationMapping);

  Stream<List<CardM>> getCards() {
    return Stream.fromFuture(_cardProvider.getCards())
        .map((dynamic response) => response.data['success']['cards'] as Iterable)
        .map((Iterable data) =>
            (data as List).map((e) => CardM.fromJson(e)).toList())
        .handleError(_authenticationMapping.toThrow);
  }
}
