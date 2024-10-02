import 'package:flutter/material.dart';
import 'package:games_animation/data/games_data.dart';
import 'package:games_animation/widget/game_widget.dart';

class GamesContent extends StatefulWidget {
  const GamesContent({super.key});

  @override
  State<GamesContent> createState() => _GamesContentState();
}

class _GamesContentState extends State<GamesContent> {
  final _controller = PageController(viewportFraction: 0.8);
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: gamesData.length,
            itemBuilder: (context, index) {
              final game = gamesData[index];
              return GameWidget(
                game: game,
              );
            },
            onPageChanged: (index) => setState(() {
              pageIndex = index;
            }),
          ),
        ),
        Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: 30,
          child: Center(
              child: Text(
            '${pageIndex + 1}/${gamesData.length}',
            style: const TextStyle(color: Colors.white),
          )),
        )
      ],
    );
  }
}
