import 'package:flutter/material.dart';
import 'package:poke_api_bayteq/controllers/lista_controller.dart';
import 'package:poke_api_bayteq/controllers/pokemon_controller.dart';
import 'package:poke_api_bayteq/page/lista_page.dart';
import 'package:poke_api_bayteq/router/app_routes.dart';
import 'package:poke_api_bayteq/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

int habilidadVid= 0;
int habilidadAtt= 0;
int habilidadDef= 0;
int habilidadVel= 0;
int habilidadVid2= 0;
int habilidadAtt2= 0;
int habilidadDef2= 0;
int habilidadVel2= 0;


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [

      ChangeNotifierProvider(create: (context) => ListaController()),
      ChangeNotifierProvider(create: (context) => PokemonController()),
    ],
    
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon',
        initialRoute: "lista",
        routes: AppRoutes.routes,
        theme: AppTheme.ligthTheme),
    );
  }
}
