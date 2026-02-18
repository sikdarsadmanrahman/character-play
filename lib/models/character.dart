class Character {

  // constructor
  Character({
    required this.id,
    required this.name,
    required this.slogan,
  });


  //fields
  final String id;
  final String name;
  final String slogan;
  bool _isFav = false;

  void toggleFav(){
    _isFav = !_isFav;
  }


}

