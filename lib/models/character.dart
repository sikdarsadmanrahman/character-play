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

