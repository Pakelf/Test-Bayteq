
import 'package:flutter/material.dart';
import 'package:poke_api_bayteq/page/lista_page.dart';
import 'package:poke_api_bayteq/page/pokemon_page.dart';


class AppRoutes{

  static const initialRoute = 'lista';

  static  Map<String, Widget Function(BuildContext)> routes = {
  'pokemon': (BuildContext context) =>  PokemonPage(),
  'lista'  : (BuildContext context) => const ListaPage(),
  };

}

