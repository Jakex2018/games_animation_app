import 'package:flutter/material.dart';
import 'package:games_animation/model/games_model.dart';
import 'package:games_animation/screen/detail_screen.dart';
import 'package:games_animation/widget/game_expanded.dart';
import 'package:games_animation/widget/image_expanded.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({super.key, required this.game});
  final GamesModel game;
  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
              bottom: isExpanded ? 10 : 100,
              width: isExpanded ? size.width * .78 : size.width * .7,
              height: isExpanded ? size.height * .65 : size.height * .5,
              duration: const Duration(seconds: 5),
              child: GameExpanded(
                game: widget.game,
              )),
          AnimatedPositioned(
              bottom: isExpanded ? 150 : 100,
              duration: const Duration(seconds: 5),
              child: GestureDetector(
                  onPanUpdate: onPanUpdate,
                  onTap: openDetailPage,
                  child: ImageExpanded(
                    games: widget.game,
                  )))
        ],
      ),
    );
  }

  void openDetailPage() {
    if (!isExpanded) {
      setState(() {
        isExpanded = true;
      });
      return;
    }
    Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: const Duration(seconds: 20),
      reverseTransitionDuration: const Duration(seconds: 20),
      pageBuilder: (context, animation, secondaryAnimation) {
        final curved =
            CurvedAnimation(parent: animation, curve: const Interval(0, 0.5));
        return FadeTransition(
          opacity: curved,
          child: DetailScreen(
            animation: animation,
            game: widget.game,
          ),
        );
      },
    ));
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}
