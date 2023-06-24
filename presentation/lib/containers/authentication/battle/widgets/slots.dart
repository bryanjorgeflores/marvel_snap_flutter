import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/helpers/number.dart';

class SlotEnemyCards extends StatelessWidget {
  final List<CardM> cards;
  final List slots;
  final Function(CardM) showCardDetails;
  const SlotEnemyCards(
      {super.key,
      this.cards = const [],
      this.slots = const [],
      required this.showCardDetails});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 3; i++) ...[
          Expanded(
            child: SizedBox(
              height: 170,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 80),
                itemCount: slots[i].length,
                itemBuilder: (BuildContext context, int index) {
                  var item = slots[i][index];
                  return GestureDetector(
                    onTap: () {
                      showCardDetails(cards[parseNumber(item)]);
                    },
                    child: Image.network(
                      cards[parseNumber(item)].art!,
                      fit: BoxFit.fitHeight,
                      width: 100,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          'https://static.marvelsnap.pro/cardbacks/SnapCube_01.webp',
                          fit: BoxFit.fitHeight,
                          width: 100,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          if (i < 2) const SizedBox(width: 20),
        ]
      ],
    );
  }
}
