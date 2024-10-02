import 'package:flutter/material.dart';
import 'package:games_animation/data/hero_tag.dart';
import 'package:games_animation/model/games_model.dart';
import 'package:games_animation/widget/hero_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.game, required this.animation});
  final GamesModel game;
  final Animation animation;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
                child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox.expand(
                  child: HeroWidget(
                    tag: HeroTag.image(widget.game.image),
                    child: Image.network(
                      widget.game.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(widget.game.desc),
            )
          ],
        ),
      ),
    ));
  }
}
