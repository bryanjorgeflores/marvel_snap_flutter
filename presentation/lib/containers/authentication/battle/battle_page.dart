import 'dart:math';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/containers/authentication/battle/widgets/card_details.dart';
import 'package:presentation/containers/authentication/battle/widgets/game_options.dart';
import 'package:presentation/containers/authentication/battle/widgets/game_players.dart';
import 'package:presentation/containers/authentication/battle/widgets/target.dart';
import 'package:presentation/containers/commons/cards/bloc/cards_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/hand.dart';
import 'widgets/slots.dart';
import 'widgets/zones.dart';

class BattlePage extends StatefulWidget {
  const BattlePage({super.key});

  @override
  State<BattlePage> createState() => _BattlePageState();
}

class _BattlePageState extends State<BattlePage> {
  List handSlot = [];
  List firstSlot = [], secondSlot = [], thirdSlot = [];
  List firstEnemySlot = [], secondEnemySlot = [], thirdEnemySlot = [];

  bool showBorders = false;

  late CardsBloc cardsBloc;

  @override
  void initState() {
    super.initState();
    cardsBloc = context.read<CardsBloc>();
    cardsBloc.add(LoadCardsEvent());
    startHandCards();
  }

  startHandCards() {
    for (var i = 0; i < 4; i++) {
      addRandomCard(isFirstHand: true);
    }
  }

  addRandomCard({bool isFirstHand = false}) {
    Random random = Random();
    int randomNumber = random.nextInt(100);
    setState(() {
      handSlot.add(randomNumber);
    });
    if (!isFirstHand) {
      addRandomEnemyCard();
    }
  }

  addRandomEnemyCard() {
    Random random = Random();
    int randomNumber = random.nextInt(100);
    setState(() {
      if (firstEnemySlot.length < 4) {
        firstEnemySlot.add(randomNumber);
      } else if (secondEnemySlot.length < 4) {
        secondEnemySlot.add(randomNumber);
      } else if (thirdEnemySlot.length < 4) {
        thirdEnemySlot.add(randomNumber);
      }
    });
  }

  showCardDetails(CardM card) async {
    await showGeneralDialog(
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: CardDetails(
                card: card,
              ),
            ),
          ),
        );
      },
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (_, __, ___) => Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<CardsBloc, CardsState>(
        builder: (context, state) {
          return SafeArea(
            child: Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/gifs/background.gif',
                    ),
                    fit: BoxFit.cover),
              ),
              child: state.cards.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SlotEnemyCards(
                              cards: state.cards,
                              slots: [
                                firstEnemySlot,
                                secondEnemySlot,
                                thirdEnemySlot
                              ],
                              showCardDetails: showCardDetails,
                            ),
                            const Zones(),
                            Row(
                              children: [
                                Expanded(
                                  child: TargetZone(
                                    cards: firstSlot,
                                    onDragEnd: () {
                                      addRandomCard();
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TargetZone(
                                    cards: secondSlot,
                                    onDragEnd: () {
                                      addRandomCard();
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TargetZone(
                                    cards: thirdSlot,
                                    onDragEnd: () {
                                      addRandomCard();
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        HandCards(
                          showCardDetails: showCardDetails,
                          cards: state.cards,
                          handSlot: handSlot,
                        ),
                        const GameOptions(),
                        const GamePlayers(),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
