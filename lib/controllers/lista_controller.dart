
import 'package:flutter/material.dart';
import 'package:poke_api_bayteq/controllers/pokemon_controller.dart';
import 'package:poke_api_bayteq/helpers/utils_helper.dart';
import 'package:poke_api_bayteq/page/pokemon_page.dart';
import 'package:poke_api_bayteq/providers/api_provider.dart';
import 'package:provider/provider.dart';


class ListaController with ChangeNotifier{
  //VARIABLES:
  List<String> _listaPokemones = []; 
  
  //OBTENER VARIABLES
  Future<List<String>> get listaPokemones async{
    _listaPokemones = await ApiProvider.cargarLista();
    return _listaPokemones;
  }


  //FUNCIONES:
  void clickPokemon(BuildContext context,int idPokemon){
    infoprint(idPokemon);
    final pokemoncontroller = Provider.of<PokemonController>(context,listen: false);
    pokemoncontroller.setIDpokemon(idPokemon);
    Navigator.pushNamed(context, 'pokemon');
  }
  void mostrarPokemon(BuildContext context,int idPokemon) {
    Positioned(
            top: 300,
            left: 10,
            child: SizedBox(
              height: 700,
              width: 500,
              child: PokemonPage(),
            )
          );
  }

}