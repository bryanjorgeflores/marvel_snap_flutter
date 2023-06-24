import 'package:flutter/material.dart';

class Zones extends StatelessWidget {
  const Zones({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 3; i++) ...[
          Expanded(
            child: Stack(
              children: [
                Image.network(
                    'https://images.marvelsnap.io/images/cards/${150 + i}.jpg'),
              ],
            ),
          ),
          if (i < 2) const SizedBox(width: 20),
        ]
      ],
    );
  }
}
