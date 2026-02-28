import 'package:character_game/screens/create/create.dart';
import 'package:character_game/screens/home/character_card.dart';
import 'package:character_game/models/character.dart';
import 'package:character_game/shared/styled_button.dart';
import 'package:character_game/shared/styled_text.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const StyledTitle("Your Characters", 
        ),
      centerTitle: true,
    ),
    body: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: characters.length,
              itemBuilder: (_, index) {
                return CharacterCard(characters[index]);
              }
            )
          ),

          StyledButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (ctx) => Create(),
                ));
            }, 
            child: const StyledHeadline('Create New'),

          )
        ],
      )
    ),
  );
}
}