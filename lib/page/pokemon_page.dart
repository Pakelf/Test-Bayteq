import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke_api_bayteq/buttons/poke_buttons.dart';
import 'package:poke_api_bayteq/controllers/pokemon_controller.dart';
import 'package:poke_api_bayteq/helpers/utils_helper.dart';
import 'package:poke_api_bayteq/main.dart';
import 'package:poke_api_bayteq/theme/app_theme.dart';
import 'package:provider/provider.dart';




class PokemonPage extends StatefulWidget {
  PokemonPage({Key? key}) : super(key: key);

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  int valor1 = 0;
  String txt= '';
  List<bool> _selections = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    final pokemonController = Provider.of<PokemonController>(context);

    return Scaffold(
        backgroundColor: pokemonController.scaffoldBack,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              )),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Positioned(
              top: sizedWidth(context, 80),
              left: 20,
              child: SafeArea(
                child: Image.asset(
                  'assets/imgs/pokeball_gray.png',
                  width: sizedWidth(context, 40),
                ),
              ),
            ),
            Positioned(
                top: 0,
                left: 20,
                child: Text(
                  pokemonController.pokemon.name.toString(),
                  style: AppTheme.lblTitlePage2,
                )),
            Positioned(
              top: 6,
              right: 20,
              child: Text(
                  "ID: " + pokemonController.pokemonIdselected.toString(),
                  style: AppTheme.lblHomeOption),
            ),
            const Positioned(
              top: 36,
              left: 20,
              child: Text("Habilidades",
              style: AppTheme.lblTitle),
              ),
            const Positioned(
              top: 80,
              left: 20,
              right: 20,
              child: PokeButtons()
            ),
            Positioned(
              bottom: sizedHeight(context, 30),
              child: SizedBox(
                width: sizedWidth(context, 100),
                child: Center(
                  child: Hero(
                    tag: pokemonController.pokemonIdselected,
                    child: CachedNetworkImage(
                      height: sizedHeight(context, 30),
                      imageUrl:
                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonController.pokemonIdselected}.png",
                      placeholder: (context, url) => const Center(
                          child: Text(
                        "Cargando...",
                        style: TextStyle(color: Colors.white),
                      )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
            /* Positioned(
              bottom: sizedHeight(context, 0),
              child: SizedBox(
                      height: sizedHeight(context, 30),
                      width: sizedWidth(context, 100),
                      child: statsWidget(context, pokemonController),
                    )
            ), */
          ],
        ));
  }

  /* SingleChildScrollView statsWidget(
      BuildContext context, PokemonController pokemonController) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: sizedHeight(context, 3),
          ),
          Card(
              elevation: 5,
              child: Column(
                children: [
                  SizedBox(
                    height: sizedHeight(context, 3),
                  ),
                  statWidget(
                      context, "Vida", pokemonController.pokemon.hp!),
                  statWidget(
                      context, "Ataque", pokemonController.pokemon.attack! + habilidad1),
                  statWidget(
                      context, "Defensa", pokemonController.pokemon.defense!),
                  statWidget(
                      context, "Velocidad", pokemonController.pokemon.speed!),
                  SizedBox(
                    height: sizedHeight(context, 3),
                  ),
                ],
              )),
        ],
      ),
    );
  } */

  /* Row statWidget(BuildContext context, String titulo, int dato) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40,
          width: sizedWidth(context, 18),
          child: Center(
              child: Text(
            titulo,
            style: AppTheme.lblNormal2,
            textAlign: TextAlign.center,
          )),
        ),
        SizedBox(
          width: sizedWidth(context, 2),
        ),
        SizedBox(
          width: sizedWidth(context, 10),
          child: Text(dato .toString(), style: AppTheme.lblNormal),
        ),
        SizedBox(
          width: sizedWidth(context, 54),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 10,
              thumbColor: Colors.transparent,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0.0),
              overlayShape: SliderComponentShape.noOverlay,
            ),
            child: Slider(
              value: (dato < 250) ? dato.toDouble() : 250,
              max: 250, //requerimiento de barra máxima
              min: 0,
              activeColor: AppTheme.azul,
              inactiveColor: Colors.black12,
              onChanged: (double value) {},
            ),
          ),
        )
      ],
    );
  } */
}
