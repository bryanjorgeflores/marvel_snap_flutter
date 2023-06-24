import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class HandCards extends StatefulWidget {
  final List handSlot;
  final List<CardM> cards;
  final Function(CardM) showCardDetails;
  const HandCards(
      {super.key,
      this.handSlot = const [],
      this.cards = const [],
      required this.showCardDetails});

  @override
  State<HandCards> createState() => _HandCardsState();
}

class _HandCardsState extends State<HandCards> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 75),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < widget.handSlot.length; i++)
              Draggable(
                data: '${widget.handSlot[i]}',
                feedback: Image.network(
                  widget.cards[widget.handSlot[i]].art!,
                  fit: BoxFit.fitHeight,
                  width: 150,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://static.marvelsnap.pro/cardbacks/SnapCube_01.webp',
                      fit: BoxFit.fitHeight,
                      width: 100,
                    );
                  },
                ),
                onDragEnd: (details) {
                  if (details.wasAccepted) {
                    setState(() {
                      widget.handSlot.remove(widget.handSlot[i]);
                    });
                  }
                },
                childWhenDragging: Container(),
                child: GestureDetector(
                  onTap: () {
                    widget.showCardDetails(widget.cards[widget.handSlot[i]]);
                  },
                  child: Image.network(
                    widget.cards[widget.handSlot[i]].art!,
                    fit: BoxFit.fitHeight,
                    height: 75,
                    width: 55,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                        'https://static.marvelsnap.pro/cardbacks/SnapCube_01.webp',
                        fit: BoxFit.fitHeight,
                        width: 75,
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
