import 'package:flutter/material.dart';
import 'package:presentation/containers/authentication/battle/widgets/rhombus.dart';
import 'package:presentation/styles/theme.dart';
import 'package:presentation/widgets/text.dart';

class GameOptions extends StatelessWidget {
  const GameOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Rhombus(
                backgroundUrl: 'assets/gifs/enemy_background.gif',
                leftPosition: 30,
                playerName: 'RETIRARSE',
                matrix4Container: Matrix4.skew(.5, -.05),
                matrix4Text: Matrix4.skew(.005, -.05),
                height: 55,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: white,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 30,
                      spreadRadius: 2,
                      color: white,
                    )
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/gifs/points_background.gif'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                  child: TextWidget(
                    text: '1',
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    isHighRelief: true,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Rhombus(
                backgroundUrl: 'assets/gifs/finish_turn_background.gif',
                playerName: 'FINALIZAR'
                '\nTURNO 1/6',
                matrix4Container: Matrix4.skew(-.5, -.05),
                matrix4Text: Matrix4.skew(-.005, -.05),
                height: 55,
                fontSize: 20,
                bottomPadding: 0,
                rightPadding: 30,
              ),
            ),
          ],
        ));
  }
}
