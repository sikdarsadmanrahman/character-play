import 'package:character_game/models/skill.dart';
import 'package:character_game/models/stats.dart';
import 'package:character_game/models/vocation.dart';

class Character with Stats{

  // constructor
  Character({
    required this.id,
    required this.name,
    required this.slogan,
    required this.vocation,
  });


  //fields
  final Set<Skill> skills = {};
  final String id;
  final String name;
  final String slogan;
  final Vocation vocation;
  bool _isFav = false;

  //getter
  bool get isFav => _isFav;

  //methods
  void toggleFav(){
    _isFav = !_isFav;
  }

  void updateSkills(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

}

//dummy character data
List<Character> characters = [
  Character(id: '1', name: 'Klara', vocation: Vocation.wizard, slogan: 'Kapumf!'),
  Character(id: '2', name: 'Jonny', vocation: Vocation.junkie, slogan: 'Light me up...'),
  Character(id: '3', name: 'Crimson', vocation: Vocation.raider, slogan: 'Fire in the hole!'),
  Character(id: '4', name: 'Shaun', vocation: Vocation.ninja, slogan: 'Alright then gang.'),

];