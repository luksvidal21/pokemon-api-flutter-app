import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokeCard extends StatefulWidget {
  const PokeCard({
    Key? key,
    required this.pokedex,
    required this.index,
  }) : super(key: key);

  final List? pokedex;
  final int index;

  @override
  State<PokeCard> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  @override
  Widget build(BuildContext context) {
    var type = widget.pokedex![widget.index]['type'][0];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
            color: type == 'Grass'
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
                                        : type == 'Fighting'
                                            ? Colors.orange
                                            : type == 'Bug'
                                                ? Colors.lightGreenAccent
                                                : type == 'Ghost'
                                                    ? Colors.deepPurple
                                                    : type == 'Rock'
                                                        ? Colors.brown
                                                        : type == 'Normal'
                                                            ? Colors.brown
                                                            : type == 'Poison'
                                                                ? Colors
                                                                    .deepPurpleAccent
                                                                : Colors.pink,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Stack(
          children: [
            Positioned(
              bottom: -10,
              right: -10,
              child: Image.asset(
                'images/pokeball.png',
                height: 100,
                fit: BoxFit.fitHeight,
                color: Colors.yellow,
              ),
            ),
            Positioned(
              left: 10,
              top: 20,
              child: Text(
                widget.pokedex![widget.index]['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 45,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, bottom: 4, top: 4),
                  child: Text(type.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      )),
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.black26,
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: Hero(
                tag: widget.index,
                child: CachedNetworkImage(
                  imageUrl: widget.pokedex![widget.index]['img'],
                  height: 100,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
