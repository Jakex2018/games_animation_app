import 'package:flutter/material.dart';
import 'package:games_animation/data/hero_tag.dart';
import 'package:games_animation/model/games_model.dart';
import 'package:games_animation/widget/hero_widget.dart';

class ImageExpanded extends StatefulWidget {
  const ImageExpanded({super.key, required this.games});
  final GamesModel games;
  @override
  State<ImageExpanded> createState() => _ImageExpandedState();
}

class _ImageExpandedState extends State<ImageExpanded> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: size.height * 0.5,
        width: size.width * 0.8,
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1),
          ], borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Stack(
            children: [
              _getImage(widget.games),
              Container(
                padding: const EdgeInsets.all(8),
                child: topText(widget.games),
              )
            ],
          ),
        ));
  }

  _getImage(GamesModel games) => SizedBox.expand(
        child: HeroWidget(
          tag: HeroTag.image(games.image),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              games.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  topText(GamesModel games) => Center(
        child: Container(
          width: 230,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.withOpacity(.7),
          ),
          child: Center(
            child: Text(
              games.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
}
