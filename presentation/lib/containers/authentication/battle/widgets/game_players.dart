import 'package:flutter/material.dart';
import 'package:presentation/containers/authentication/battle/widgets/player.dart';
import 'package:presentation/containers/authentication/battle/widgets/popup_menu.dart';
import 'package:presentation/styles/theme.dart';
import 'package:presentation/widgets/text.dart';

class GamePlayers extends StatelessWidget {
  const GamePlayers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 130,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTapDown: (TapDownDetails details) {
                  showCustomPopupMenu(context, details.globalPosition);
                },
                child: Player(
                  backgroundUrl: 'assets/gifs/me_background.gif',
                  imageUrl:
                      'https://game-assets.snap.fan/card_variant_images/avatar-logo-GreenGoblin-ef84396816cc0b375866a94161ed57d1848ed39637f64d8cb50decfed666cc84.webp',
                  playerName: 'BRYANJORGE',
                  matrix4Container: Matrix4.skew(-.5, -.05),
                  matrix4Text: Matrix4.skew(.005, -.05),
                  alignment: Alignment.centerRight,
                  rightPosition: 10,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/gifs/snap_background.gif',
                    fit: BoxFit.cover,
                    height: 130,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: TextWidget(
                      text: '2',
                      color: white,
                      fontSize: 50,
                      isHighRelief: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: GestureDetector(
                 onTapDown: (TapDownDetails details) {
                  showCustomPopupMenu(context, details.globalPosition);
                },
                child: Player(
                  backgroundUrl: 'assets/gifs/enemy_background.gif',
                  imageUrl:
                      'https://game-assets.snap.fan/card_variant_images/avatar-logo-BlackPanther-d58140c23120223a47fa993298b78d2c1e717b2010f20f46a61831d1d29cfddd.webp',
                  leftPosition: 10,
                  playerName: 'PANTERA',
                  matrix4Container: Matrix4.skew(.5, .05),
                  matrix4Text: Matrix4.skew(-.005, .05),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCustomPopupMenu(BuildContext context, Offset tapPosition) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        tapPosition,
        tapPosition
      ),
      Offset.zero & overlay.size,
    );

    showMenu(
      context: context,
      position: position,
      color: black.withOpacity(0.75),
      surfaceTintColor: red,
      items: [
        PopupMenuItem(
          child: PopupMenuPlayer(),
        )
      ],
    );
  }
}
