import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  final CardRepository _cardRepository;

  CardsBloc({required CardRepository cardRepository})
      : _cardRepository = cardRepository,
        super(const CardsState.initial()) {
    on<LoadCardsEvent>(_onLoadCards);
  }

  _onLoadCards(LoadCardsEvent event, Emitter<CardsState> emit) async {
    await emit.forEach<List<CardM>>(_cardRepository.getCards(),
        onData: (cards) {
      return state.copyWith(cards: cards, areCardsLoaded: true);
    }, onError: <Exception>(exception, __) {
      return state.copyWith(cards: [], exception: exception);
    });
  }
}
