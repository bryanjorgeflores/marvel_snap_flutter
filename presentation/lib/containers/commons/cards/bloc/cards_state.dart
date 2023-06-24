part of 'cards_bloc.dart';

class CardsState extends Equatable {
  final bool areCardsLoaded;
  final Exception? exception;
  final List<CardM> cards;
  const CardsState({
    this.areCardsLoaded = false,
    this.exception,
    this.cards = const [],
    // this.token,
  });

  const CardsState._({
    this.areCardsLoaded = false,
    this.exception,
    this.cards = const [],
  });

  const CardsState.initial()
      : this._(
          areCardsLoaded: false,
          exception: null,
          cards: const [],
        );

  CardsState copyWith(
      {bool? areCardsLoaded, Exception? exception, List<CardM>? cards}) {
    return CardsState(
      areCardsLoaded: areCardsLoaded ?? this.areCardsLoaded,
      cards: cards ?? this.cards,
      exception: exception ?? this.exception,
      // token: token ?? this.token,
    );
  }

  @override
  List<Object> get props => [areCardsLoaded, cards];
}
