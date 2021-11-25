import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_api/Pages/DetailsScreen/detail_page_screen.dart';
import 'components/poke_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pokeAPI =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List? pokedex;
  @override
  void initState() {
    super.initState();
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -40,
            right: -60,
            child: Image.asset(
              'images/pokeball.png',
              width: 220,
              fit: BoxFit.fitWidth,
            ),
          ),
          const Positioned(
            top: 100,
            left: 20,
            child: Text(
              'Bem vindo à Pokedex',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                pokedex != null
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.4,
                          ),
                          itemCount: pokedex!.length,
                          itemBuilder: (context, index) => InkWell(
                            child: PokeCard(
                              pokedex: pokedex,
                              index: index,
                            ),
                            onTap: () {
                              var type = pokedex![index]['type'][0];
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailScreenPage(
                                    pokemonDetail: pokedex,
                                    cor: type == 'Grass'
                                        ? Colors.greenAccent
                                        : type == 'Fire'
                                            ? Colors.redAccent
                                            : type == 'Water'
                                                ? Colors.blueAccent
                                                : type == 'Eletric'
                                                    ? Colors.yellowAccent
                                                    : type == 'Ground'
                                                        ? Colors.brown
                                                        : type == 'Rock'
                                                            ? Colors.grey
                                                            : type == 'Psychic'
                                                                ? Colors.indigo
                                                                : type ==
                                                                        'Fighting'
                                                                    ? Colors
                                                                        .orange
                                                                    : type ==
                                                                            'Bug'
                                                                        ? Colors
                                                                            .lightGreenAccent
                                                                        : type ==
                                                                                'Ghost'
                                                                            ? Colors.deepPurple
                                                                            : type == 'Rock'
                                                                                ? Colors.brown
                                                                                : type == 'Normal'
                                                                                    ? Colors.brown
                                                                                    : type == 'Poison'
                                                                                        ? Colors.deepPurpleAccent
                                                                                        : Colors.pink,
                                    heroTag: index,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchPokemonData() {
    var url = Uri.https("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then(
      (value) {
        if (value.statusCode == 200) {
          var decodedJsonData = jsonDecode(value.body);
          pokedex = decodedJsonData['pokemon'];
          setState(() {});
        }
      },
    );
  }
}
