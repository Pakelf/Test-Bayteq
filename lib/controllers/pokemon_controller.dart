import 'package:flutter/material.dart';
import 'package:poke_api_bayteq/helpers/utils_helper.dart';
import 'package:poke_api_bayteq/models/pokemon_model.dart';
import 'package:poke_api_bayteq/providers/api_provider.dart';
import 'package:poke_api_bayteq/theme/app_theme.dart';


class PokemonController with ChangeNotifier{

  //VARIABLES:

  final List<String> _tipo =  ['grass','poison'];
  bool _stats = false;
  Color _scaffoldBack = AppTheme.gris3;
  Pokemon _pokemon = Pokemon(
    id:0,
    name:'Consultando...' ,
    baseExperience: 0,
    height: 0,
    order:0 ,
    weight: 0,

    hp: 0,
    attack: 0,
    defense: 0,
    specialAttack: 0,
    specialDefense: 0,
    speed: 0,

  );
  final Map<String, Color> _colores = {
    "normal": AppTheme.gris3,
    "fighting":AppTheme.amarillo,
    "flying":AppTheme.amarillo,
    "poison":AppTheme.morado,
    "ground":AppTheme.cafe,
    "rock":AppTheme.cafe,
    "bug":AppTheme.cafe,
    "ghost":AppTheme.morado,
    "steel":AppTheme.gris2,
    "fire":AppTheme.rojo,
    "water":AppTheme.azul,
    "grass":AppTheme.verde,
    "electric":AppTheme.amarillo,
    "psychic":AppTheme.morado,
    "ice":AppTheme.azul,
    "dragon":AppTheme.amarillo,
    "dark":AppTheme.gris1,
    "fairy":AppTheme.morado,
    "unknown":AppTheme.gris3,
    "shadow":AppTheme.gris2,
    };
  int _pokemonIdselected = 0;
  bool pokemonLoaded = false;

  
  //OBTENER VARIABLES

  Color get scaffoldBack => _scaffoldBack;
  List<String> get tipo => _tipo;
  int get pokemonIdselected => _pokemonIdselected; 
  bool get stats => _stats;
  Pokemon get pokemon => _pokemon;
  

  void clickDatos(){
    infoprint("datos");
    _stats = false;
    notifyListeners();
  }

  void setIDpokemon(int idPokemon)async{
    _pokemonIdselected = idPokemon+1;
    Pokemon pokemon = await ApiProvider.cargarPokemon(_pokemonIdselected);
    if(pokemon.id!=null){
      _pokemon = pokemon;
      _scaffoldBack = _colores[pokemon.type]!;
    }
    infoprint(_pokemon.toJson());
    notifyListeners();
  }

  void clickStats(){
    infoprint("stats");
    _stats = true;
    notifyListeners();
  } 



}