import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/containers/authentication/battle/widgets/card_details.dart';
import 'package:presentation/containers/commons/cards/bloc/cards_bloc.dart';
import 'package:presentation/helpers/number.dart';

class TargetZone extends StatefulWidget {
  final Function onDragEnd;
  final List cards;
  const TargetZone({super.key, required this.cards, required this.onDragEnd});

  @override
  State<TargetZone> createState() => _TargetZoneState();
}

class _TargetZoneState extends State<TargetZone> {
  bool showBorders = false;

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
      pageBuilder: (_, __,___) => Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardsBloc, CardsState>(
      builder: (context, state) {
        return DragTarget(
          builder: (context, candidateData, rejectedData) {
            return Container(
              height: 170,
              decoration: BoxDecoration(
                  border:
                      showBorders ? Border.all(color: Colors.blueAccent) : null,
                  borderRadius: BorderRadius.circular(10)),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 80,
                ),
                itemCount: widget.cards.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = widget.cards[index];
                  return GestureDetector(
                    onTap: () {
                      showCardDetails(state.cards[parseNumber(item)]);
                    },
                    child: Image.network(
                      state.cards[parseNumber(item)].art!,
                      width: 80,
                      fit: BoxFit.fitHeight,
                    ),
                  );
                },
              ),
            );
          },
          onWillAccept: (data) {
            setState(() {
              showBorders = widget.cards.length < 4;
            });
            return widget.cards.length < 4;
          },
          onAccept: (data) {
            setState(() {
              widget.cards.add(data);
              showBorders = false;
              widget.onDragEnd();
            });
          },
          onLeave: (data) {
            setState(() {
              showBorders = false;
            });
          },
        );
      },
    );
  }
}
