
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poke_api_bayteq/helpers/utils_helper.dart';
import 'package:poke_api_bayteq/models/pokemon_model.dart';


class ApiProvider {
  
  static Future<List<String>> cargarLista() async{    
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=0&limit=150') 
    );
    List<String> pokemones = [];
    if (response.statusCode == 200){
      infoprint("se cargo correctamente");
      var data = jsonDecode(response.body);
      for (var item in data["results"]) {
        pokemones.add(item['name'].toString());
      }
    }else{
      infoprint("hay error en la consulta");
    }
    return pokemones;
  }

  static Future<Pokemon> cargarPokemon( int idpokemon) async{    
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/$idpokemon') 
    );
    Pokemon pokemon = Pokemon();
    if (response.statusCode == 200){
      infoprint("se cargo correctamente");
      var data = jsonDecode(response.body);
      pokemon = Pokemon.fromJson(data);
      infoprint(data['types'][0]['type']['name']);
      pokemon.hp             = data['stats'][0]['base_stat'];
      pokemon.attack         = data['stats'][1]['base_stat'];
      pokemon.defense        = data['stats'][2]['base_stat'];
      pokemon.specialAttack  = data['stats'][3]['base_stat'];
      pokemon.specialDefense = data['stats'][4]['base_stat'];
      pokemon.speed          = data['stats'][5]['base_stat'];
      pokemon.type           = data['types'][0]['type']['name'];
      // for (var item in data["results"]) {
      //   pokemones.add(item['name'].toString());
      // }
    }else{
      infoprint("hay error en la consulta");
    }
    infoprint(pokemon);
    return pokemon;
  }

}
