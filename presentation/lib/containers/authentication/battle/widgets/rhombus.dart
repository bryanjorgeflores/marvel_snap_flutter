import 'package:flutter/material.dart';
import 'package:presentation/styles/theme.dart';
import 'package:presentation/widgets/text.dart';

class Rhombus extends StatelessWidget {
  final Matrix4 matrix4Container, matrix4Text;
  final String backgroundUrl, playerName;
  final double leftPosition, rightPadding, bottomPadding, height, fontSize;
  final Color color;

  const Rhombus({
    super.key,
    required this.matrix4Container,
    required this.matrix4Text,
    required this.backgroundUrl,
    required this.playerName,
    this.leftPosition = 0,
    this.rightPadding = 0,
    this.bottomPadding = 10,
    this.height = 40,
    this.fontSize = 15,
    this.color = white,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: height,
          transform: matrix4Container,
          decoration: BoxDecoration(
            image: backgroundUrl != ''
                ? DecorationImage(
                    image: AssetImage(
                      backgroundUrl,
                    ),
                    fit: BoxFit.cover,
                  )
                : null,
            color: backgroundUrl != '' ? null : white,
            border: Border.all(
              color: white,
            ),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 2,
                color: white,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            transform: matrix4Text,
            padding: EdgeInsets.only(
              bottom: bottomPadding,
              right: rightPadding,
              left: leftPosition,
            ),
            child: TextWidget(
              text: playerName,
              textAlign: TextAlign.center,
              fontSize: fontSize,
              color: color,
              isHighRelief: true,
            ),
          ),
        )
      ],
    );
  }
}
