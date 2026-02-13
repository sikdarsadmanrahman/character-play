import 'package:character_game/shared/styled_button.dart';
import 'package:character_game/shared/styled_text.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List Characters = ['mario', 'luigi', 'peach', 'toad', 'bowser', 'koopa'];

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
              itemCount: Characters.length,
              itemBuilder: (_, index) {
                return(
                  Container(
                    color: Colors.grey[800],
                    padding: EdgeInsets.all(40),
                    margin: EdgeInsets.only(bottom: 40),
                    child: Text(Characters[index]),
                  )
                );
              }
            )
          ),

          StyledButton(
            onPressed: () {}, 
            child: const StyledHeadline('Create New'),

          )
        ],
      )
    ),
  );
}
}