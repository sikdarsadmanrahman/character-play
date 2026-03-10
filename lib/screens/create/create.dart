import 'package:character_game/models/character.dart';
import 'package:character_game/models/vocation.dart';
import 'package:character_game/screens/create/vocation_card.dart';
import 'package:character_game/screens/home/home.dart';
import 'package:character_game/services/character_store.dart';
import 'package:character_game/shared/styled_button.dart';
import 'package:character_game/shared/styled_text.dart';
import 'package:character_game/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();


class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateState();
}

class _CreateState extends State<CreateScreen> {

  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose(){
    //clean up the controller when the widget is disposed
    _nameController.dispose();
    _sloganController.dispose();

    super.dispose();
  }

  //handling vocation selection
  Vocation selectedVocation = Vocation.junkie;
  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  //submit handler
  void submitHandler () {
    if(_nameController.text.trim().isEmpty){
      
      showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          title: const StyledHeadline('Missing Name'),
          content: const StyledText('You must enter a name...'),
          actions: [
            StyledButton(
              onPressed: () => Navigator.pop(ctx), 
              child: const StyledText('Close'),
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;
    }
    if(_sloganController.text.trim().isEmpty){
      
      
      showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          title: const StyledHeadline('Missing Slogan'),
          content: const StyledText('You must enter a catchy sloganScreen...'),
          actions: [
            StyledButton(
              onPressed: () => Navigator.pop(ctx), 
              child: const StyledText('Close'),
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;
    }
    characters.add(Character(
      id: uuid.v4(), 
      name: _nameController.text.trim(), 
      slogan: _sloganController.text.trim(), 
      vocation: selectedVocation,
    ));

    Provider.of<CharacterStore>(context, listen: false)
      .addCharacter(Character(
        id: uuid.v4(), 
        name: _nameController.text.trim(), 
        slogan: _sloganController.text.trim(), 
        vocation: selectedVocation,
      )
      );

    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) => Home(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const StyledTitle("Character Creation", 
        ),
      centerTitle: true,
    ),
    body: Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
        
            // welcome message
            Center(
              child: Icon(Icons.code, color: AppColor.primaryColor),
            ),
            const Center(
              child: StyledHeadline('Welcome, new player'),
            ),
            const Center(
              child: StyledText('Create a name & slogan for your character.'),
            ),
            SizedBox(height: 30,),
        
        
            //input field
            TextField(
              controller: _nameController,
              style: GoogleFonts.kanit(
                textStyle: Theme.of(context).textTheme.bodyMedium, 
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_2),
                label: StyledText('Character name'),
              ),
              cursorColor: AppColor.textColor,
            ),
        
            const SizedBox(height: 20,),
        
            TextField(
              controller: _sloganController,
              style: GoogleFonts.kanit(
                textStyle: Theme.of(context).textTheme.bodyMedium, 
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.chat),
                label: StyledText('Character slogan'),
              ),
              cursorColor: AppColor.textColor,
            ),
        
            const SizedBox(height: 30,),
        
            //select vocation
            Center(
              child: Icon(Icons.code, color: AppColor.primaryColor),
            ),
            const Center(
              child: StyledHeadline('Select Vocation'),
            ),
            const Center(
              child: StyledText('This determines your available skills.'),
            ),
            SizedBox(height: 30,),
        
            //vocation cards
            VocationCard(
              
              onTap: updateVocation,
              vocation: Vocation.junkie,
              selected: selectedVocation == Vocation.junkie,
            ),
            
            VocationCard(
              
              onTap: updateVocation,
              vocation: Vocation.ninja,
              selected: selectedVocation == Vocation.ninja,
            ),
            VocationCard(
              
              onTap: updateVocation,
              vocation: Vocation.raider,
              selected: selectedVocation == Vocation.raider,
            ),
            VocationCard(
              
              onTap: updateVocation,
              vocation: Vocation.wizard,
              selected: selectedVocation == Vocation.wizard,
            ),

            // best of luck message
            Center(
              child: Icon(Icons.code, color: AppColor.primaryColor),
            ),
            const Center(
              child: StyledHeadline('Best of Luck'),
            ),
            const Center(
              child: StyledText('For your journey...'),
            ),
            SizedBox(height: 30,),
        
        
            //create submit button
            Center(
              child: StyledButton(
                onPressed: submitHandler,
                child: const StyledHeadline('Create Character'),
              ),
            )
          ],
        
          
        ),
      ),

      
    ),
    );
  }
}