
class Pokemon{
  int? id;
  String? name;
  int? baseExperience;
  int? height;
  int? order;
  int? weight;
  int? hp;
  int? attack;
  int? defense;
  int? specialAttack;
  int? specialDefense;
  int? speed;
  String? type;

  


  Pokemon({
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.order,
    this.weight,

    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefense,
    this.speed,
    this.type,

  });

  Pokemon.fromJson(Map<String, dynamic> json){
    id             = json['id'];
    name           = json['name'];
    baseExperience = json['base_experience'];
    height         = json['height'];
    order          = json['order'];
    weight         = json['weight'];
  }


  Map<String, dynamic> toJson(){
    final json = <String, dynamic>{};

    json['id']             = id;
    json['name']           = name;
    json['baseExperience'] = baseExperience;
    json['height']         = height;
    json['order']          = order;
    json['weight']         = weight;

    json['hp']             = hp;
    json['attack']         = attack;
    json['defense']        = defense;
    json['specialAttack']  = specialAttack;
    json['specialDefense'] = specialDefense;
    json['speed']          = speed;
    json['type']           = type;
    
    return json;
  }


}