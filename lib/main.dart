
import 'package:character_game/screens/home/home.dart';
import 'package:character_game/services/character_store.dart';
import 'package:character_game/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
    create: (context) => CharacterStore(),
    child: MaterialApp(
      theme: primaryTheme,
      home: const Home(),
    ),
  ));
}

class sandbox extends StatelessWidget {
  const sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sandbox'),
      ),
    );
  }
}