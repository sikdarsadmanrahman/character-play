import 'package:character_game/models/character.dart';
import 'package:character_game/screens/profile/skill_list.dart';
import 'package:character_game/screens/profile/stats_table.dart';
import 'package:character_game/shared/styled_text.dart';
import 'package:character_game/theme.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledHeadline(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // basic info - image, vocation, description
            Container(
              child: Row(
                children: [
                  Image.asset('assets/img/vocations/${character.vocation.image}',
                    width: 140,
                    height: 140,
                  ),
                  const SizedBox(width: 20,),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeadline(character.vocation.title),
                        StyledText(character.vocation.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),


            // weapon and ability
            SizedBox(height: 30),
            Center(child: Icon(Icons.code, color: AppColor.primaryColor)),


            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: AppColor.secondaryColor.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeadline('Slogan'),
                    StyledText(character.slogan),
                    SizedBox(height: 10),
                    
                    const StyledHeadline('Weapon of Choice'),
                    StyledText(character.vocation.weapon),
                    SizedBox(height: 10),

                    const StyledHeadline('Unique Ability'),
                    StyledText(character.vocation.ability),
                    SizedBox(height: 10),

                  ],
                ),
              ),
            ),

            // stats & skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character),
                  SkillList(character),
                ],
              ),
            ),

            // save button 


          ],
        ),
      ),
    );
  }
}