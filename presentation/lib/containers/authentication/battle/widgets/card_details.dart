import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:presentation/containers/authentication/battle/widgets/hexagon.dart';
import 'package:presentation/styles/theme.dart';
import 'dart:math' as math;

class CardDetails extends StatelessWidget {
  final CardM card;
  const CardDetails({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              card.art!,
              height: size.height * 0.45,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: HtmlWidget(
                '<p>${card.ability}</p>',
                textStyle: const TextStyle(
                  color: white,
                ),
                customStylesBuilder: (element) {
                  return {
                    'font-size': 'larger',
                    'text-align':'center'
                  };
                },
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Transform.rotate(
            angle: -math.pi / 2,
            child: CustomPaint(
              painter: BorderHexagon(color: white.withOpacity(0.4)),
              child: ClipPath(
                clipper: Hexagon(),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/gifs/enemy_background.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 80,
                  width: 60,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
