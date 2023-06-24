import 'package:flutter/material.dart';
import 'package:presentation/containers/authentication/battle/widgets/rhombus.dart';
import 'package:presentation/styles/theme.dart';
import 'package:presentation/widgets/text.dart';

class PopupMenuPlayer extends StatelessWidget {
  PopupMenuPlayer({super.key});
  final List phrases = [
    {
      'col': ['Hello!', 'Snap?'],
    },
    {
      'col': ['I´m losing!', 'I am confident'],
    },
    {
      'col': ["I don't believe you'!", '*Thumbs up!*'],
    },
    {
      'col': ['Aaaaaargh!!', 'What just happened?!'],
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: black,
      width: size.width,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: white),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: white),
                    ),
                    child: const TextWidget(
                      text: 'Deck:\n 9',
                      color: white,
                      textAlign: TextAlign.center,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: white),
                    ),
                    child: const TextWidget(
                      text: 'Hand:\n 3',
                      color: white,
                      textAlign: TextAlign.center,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: white),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        'assets/images/emoji_$index.png',
                        fit: BoxFit.fitHeight,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                for (var row in phrases) ...[
                  Row(
                    children: [
                      for (var phrase in row['col']) ...[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Rhombus(
                              backgroundUrl: '',
                              playerName: '$phrase',
                              matrix4Container: Matrix4.skew(-.3, -.05),
                              matrix4Text: Matrix4.skew(-.005, -.05),
                              height: 45,
                              fontSize: 14,
                              bottomPadding: 8,
                              rightPadding: 0,
                              leftPosition: 0,
                              color: black,
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                  const SizedBox(height: 20)
                ]
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: white),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: white),
                    ),
                    child: const TextWidget(
                      text: 'Destroyed:\n 0',
                      color: white,
                      textAlign: TextAlign.center,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: white),
                    ),
                    child: const TextWidget(
                      text: 'Discarded:\n 0',
                      color: white,
                      textAlign: TextAlign.center,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
