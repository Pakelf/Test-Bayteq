import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:poke_api_bayteq/controllers/pokemon_controller.dart';
import 'package:poke_api_bayteq/helpers/utils_helper.dart';
import 'package:poke_api_bayteq/main.dart';
import 'package:poke_api_bayteq/modals/task_modal.dart';
import 'package:poke_api_bayteq/theme/app_theme.dart';
import 'package:provider/provider.dart';

const List<Widget> abilities = <Widget>[
  Text('Intim'),
  Text('Inmu'),
  Text('Pote'),
  Text('Rege'),
  Text('Impas'),
  Text('Tóxic'),
];

const List textos = [
  'Intimidación: Aumenta ataque en 10 y velocidad en 15, reduce vida 5 y defensa en 10',
  'Inmunidad: Aumenta vida en 10, defensa en 20, reduce ataque en 20 y velocidad en 10',
  'Potencia: Aumenta ataque en 15, velocidad en 15, reduce vida en 20 y defensa en 10',
  'Regeneración: Aumenta vida en 10, velocidad en 5 y defensa en 5 reduce ataque 20',
  'Impasible: Aumenta velocidad en 30, reduce vida en 10, defensa en 10 y ataque en 3',
  'Tóxico: Aumenta defensa en 20, reduce vida en 15, velocidad en 3 y ataque 0'
];

const List extraAbilities = [
  [-5, 10, -10, 15],
  [10, -20, 20, -10],
  [-20, 15, -10, 15],
  [10, -20, 5, 5],
  [-10, -3, -10, 30],
  [-15, 0, 20, -3]
];

String txt = '';
int count = 0;

class PokeButtons extends StatefulWidget {
  const PokeButtons({super.key});

  @override
  State<PokeButtons> createState() => _PokeButtonsState();
}

class _PokeButtonsState extends State<PokeButtons> {
  final List<bool> _selectedAbilities = List.generate(6, (index) => false);

  @override
  void initState() {
    habilidadVid = 0;
    habilidadAtt = 0;
    habilidadDef = 0;
    habilidadVel = 0;
    habilidadVid2 = 0;
    habilidadAtt2 = 0;
    habilidadDef2 = 0;
    habilidadVel2 = 0;
    count = 0;
    ocultarTexto();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonController = Provider.of<PokemonController>(context);
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: ToggleButtons(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderColor: Colors.black,
                borderWidth: 1.5,
                selectedBorderColor: AppTheme.primary,
                selectedColor: Colors.white,
                fillColor: Colors.blue,
                color: Colors.black,
                constraints: const BoxConstraints(
                  minHeight: 25.0,
                  minWidth: 55.0,
                ),
                isSelected: _selectedAbilities,
                children: abilities,
                onPressed: (int index) {
                  setState(() {
                    _selectedAbilities[index] = !_selectedAbilities[index];
                    if (_selectedAbilities[index] == true) {
                      count++;
                    habilidadVid2 = habilidadVid;
                    habilidadAtt2 = habilidadAtt;
                    habilidadDef2 = habilidadDef;
                    habilidadVel2 = habilidadVel;
                      mostrarTexto1(textos[index].toString());
                      habilidadVid += int.parse(extraAbilities[index][0].toString());
                      habilidadAtt += int.parse(extraAbilities[index][1].toString());
                      habilidadDef += int.parse(extraAbilities[index][2].toString());
                      habilidadVel += int.parse(extraAbilities[index][3].toString());
                    
                    } else {
                    habilidadVid2 = habilidadVid;
                    habilidadAtt2 = habilidadAtt;
                    habilidadDef2 = habilidadDef;
                    habilidadVel2 = habilidadVel;
                      count--;
                      ocultarTexto();
                      habilidadVid -= int.parse(extraAbilities[index][0].toString());
                      habilidadAtt -= int.parse(extraAbilities[index][1].toString());
                      habilidadDef -= int.parse(extraAbilities[index][2].toString());
                      habilidadVel -= int.parse(extraAbilities[index][3].toString());
                          
                    }
                    if (count <= 0) {
                      count = 0;
                    }
                    
                    if (count > 2) {
                      _selectedAbilities[index] = false;
                      count--;
                      habilidadVid = habilidadVid2;
                      habilidadAtt = habilidadAtt2;
                      habilidadDef = habilidadDef2;
                      habilidadVel = habilidadVel2;
                      ocultarTexto();
                      showTaskMessageModal(
                          context, "Solo selecciona 2 habilidades");
                    }
                  });
                },
              ),
            ),
            Positioned(
              top: 140,
              left: 20,
              right: 20,
              child: Text(txt, style: AppTheme.lblHomeOption),
            ),
            const SizedBox(
              height: 300,
            ),
            Positioned(
                bottom: sizedHeight(context, 1),
                child: SizedBox(
                  height: sizedHeight(context, 30),
                  width: sizedWidth(context, 100),
                  child: statsWidget(context, pokemonController),
                )),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView statsWidget(
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
                  statWidget(context, "Vida",
                      pokemonController.pokemon.hp! + habilidadVid),
                  statWidget(context, "Ataque",
                      pokemonController.pokemon.attack! + habilidadAtt),
                  statWidget(context, "Defensa",
                      pokemonController.pokemon.defense! + habilidadDef),
                  statWidget(context, "Velocidad",
                      pokemonController.pokemon.speed! + habilidadVel),
                  SizedBox(
                    height: sizedHeight(context, 3),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  showTaskMessageModal(BuildContext context, String textModal) {
    void continueCallBack() => Navigator.of(context).pop();

    TaskModal alert = TaskModal(
      continueCallBack,
      textTaskModal: textModal,
    );

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void mostrarTexto1(String habilidades) {
    setState(() {
      Text(txt = '' + habilidades);
    });
  }

  void ocultarTexto() {
    setState(() {
      Text(txt = '');
    });
  }

  Row statWidget(BuildContext context, String titulo, int dato) {
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
          child: Text(dato.toString(), style: AppTheme.lblNormal),
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
              value: (dato < 250 || dato < 0) ? dato.toDouble() : 250,
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
  }
}
