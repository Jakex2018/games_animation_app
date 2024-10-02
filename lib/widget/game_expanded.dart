import 'package:flutter/material.dart';
import 'package:games_animation/model/games_model.dart';

class GameExpanded extends StatefulWidget {
  const GameExpanded({super.key, required this.game});
  final GamesModel game;
  @override
  State<GameExpanded> createState() => _GameExpandedState();
}

class _GameExpandedState extends State<GameExpanded> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.only(
          left: 20,
          bottom: 20,
          top: 340,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.game.title,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              widget.game.desc,
              style: const TextStyle(color: Colors.black45, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
