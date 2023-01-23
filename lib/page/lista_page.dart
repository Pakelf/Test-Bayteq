import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke_api_bayteq/controllers/lista_controller.dart';
import 'package:poke_api_bayteq/helpers/utils_helper.dart';
import 'package:poke_api_bayteq/page/pokemon_page.dart';
import 'package:poke_api_bayteq/theme/app_theme.dart';
import 'package:provider/provider.dart';

class ListaPage extends StatelessWidget {
  const ListaPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final listacontroller = Provider.of<ListaController>(context);
    return  Scaffold(
      backgroundColor: AppTheme.gris3,
      appBar: AppBar(
        backgroundColor: AppTheme.rojo,
        title: Center(child: Text("Pokemones", style: TextStyle(color: Colors.black),
            ),),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:10),
            child: SingleChildScrollView(
              child: FutureBuilder(
                future: listacontroller.listaPokemones,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return snapshot.hasData?
                  Container(
                    color: Colors.transparent,
                    width: 600,
                    child: GridView.builder(
                    padding: const EdgeInsets.only(top:0,left: 10,right: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: snapshot.data?.length, 
                    itemBuilder: (BuildContext context, index){
                      return Padding(
                        padding: EdgeInsets.all(sizedWidth(context, 2)),
                        child: InkWell(
                          onTap: (){
                            listacontroller.clickPokemon(context,index); 
                            /* listacontroller.mostrarPokemon(context,index); */
                          },
                          child: pokemonWidget(listacontroller, context, snapshot.data[index], index),
                        ),
                      );
                    }
                ),
                  )
                :Image.asset("assets/imgs/pokeball.gif");
                },
              ),
                
            ),
          ),
        ],
      ),
    );
  }

  Container pokemonWidget(ListaController listacontroller, BuildContext context, String data, int index) {
    return Container( 
      decoration:  BoxDecoration( 
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.azul,
            AppTheme.verde,
            AppTheme.amarillo, 
            ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Hero(
              tag: index+1,
              child: CachedNetworkImage(
                width: sizedWidth(context, 20), 
                imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${index+1}.png",              
                placeholder: (context, url) => const Center(child:  Text("Cargando...",style:TextStyle(color: Colors.white),)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Text(data,
              style: AppTheme.lblHomeOption,
            ),
          ),
        ],
      ),
    );
  }
}