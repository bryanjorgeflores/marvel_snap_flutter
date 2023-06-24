import 'package:flutter/material.dart';
import 'package:presentation/containers/authentication/battle/widgets/rhombus.dart';

class Player extends StatelessWidget {
  final String imageUrl, backgroundUrl, playerName;
  final double leftPosition, rightPosition;
  final Matrix4 matrix4Container, matrix4Text;
  final Alignment alignment;
  const Player({
    super.key,
    required this.imageUrl,
    required this.backgroundUrl,
    required this.playerName,
    required this.matrix4Container,
    required this.matrix4Text,
    required this.alignment,
    this.leftPosition = 0,
    this.rightPosition = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: 1.3,
              alignment: alignment,
              child: Image.network(
                imageUrl,
                height: 110,
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
        Rhombus(
          backgroundUrl: backgroundUrl,
          playerName: playerName,
          matrix4Container: matrix4Container,
          matrix4Text: matrix4Text,
          leftPosition: leftPosition,
          rightPadding: rightPosition,
        )
      ],
    );
  }
}
