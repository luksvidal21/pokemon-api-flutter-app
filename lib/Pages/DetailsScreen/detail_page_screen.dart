import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailScreenPage extends StatefulWidget {
  const DetailScreenPage(
      {Key? key, this.pokemonDetail, required this.cor, required this.heroTag})
      : super(key: key);
  final pokemonDetail;
  final Color cor;
  final int heroTag;

  @override
  _DetailScreenPageState createState() => _DetailScreenPageState();
}

class _DetailScreenPageState extends State<DetailScreenPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.cor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30,
            left: 5,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              widget.pokemonDetail[widget.heroTag]['name'],
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: height * .2,
            right: -30,
            child: Image.asset(
              'images/pokeball.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * .6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * .3,
                            child: const Text(
                              'Name',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemonDetail[widget.heroTag]['name'],
                              style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * .3,
                            child: const Text(
                              'Height',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemonDetail[widget.heroTag]['height'],
                              style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * .3,
                            child: const Text(
                              'Weight',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemonDetail[widget.heroTag]['weight'],
                              style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * .3,
                            child: Text(
                              'Spawn Time',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemonDetail[widget.heroTag]
                                  ['spawn_time'],
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * .3,
                            child: Text(
                              'Weakness',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemonDetail[widget.heroTag]['weaknesses']
                                  .join(", "),
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (height * .1) + 80,
            left: (width / 2) - 100,
            child: Hero(
              tag: widget.heroTag,
              child: CachedNetworkImage(
                imageUrl: widget.pokemonDetail[widget.heroTag]['img'],
                height: 200,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: 20,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, bottom: 4, left: 8, right: 8),
                child: Text(
                  widget.pokemonDetail[widget.heroTag]['type'].join(', '),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          )
        ],
      ),
    );
  }
}
