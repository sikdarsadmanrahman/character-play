import 'package:character_game/theme.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});

  final String character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Text(
              character,
              style: TextStyle(color: AppColor.textColor),
            ),

            const Expanded(
              child: SizedBox(),
            ),

            IconButton(
              onPressed: () {}, 
              icon: Icon(
                Icons.arrow_forward,
                color: AppColor.textColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}