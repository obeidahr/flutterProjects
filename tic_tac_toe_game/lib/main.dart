import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/utils/game_logic.dart';
import 'ui/theme/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String lastValue = "X";
  bool gameOver = false;
  int turn = 0;
  String result = "";
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];

  Game game = Game();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    game.board = Game.initGameBoard();
    print(game.board);
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "It's ${lastValue} turn",
            style: TextStyle(color: Colors.white, fontSize: 58),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: boardWidth,
            height: boardWidth,
            child: GridView.count(
                crossAxisCount: Game.boardLength ~/ 3,
                padding: EdgeInsets.all(16.0),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(Game.boardLength, (index) {
                  return InkWell(
                    onTap: gameOver
                        ? null
                        : () {
                            if (game.board![index] == "") {
                              setState(() {
                                game.board![index] = lastValue;
                                turn++;
                                gameOver = game.winnerCheck(
                                    lastValue, index, scoreboard, 3);
                                if (gameOver) {
                                  result = "$lastValue is the Winner";
                                }else if(!gameOver && turn == 0){
                                  result = "It's a Draw";
                                  gameOver = true;
                                }
                                if (lastValue == "X")
                                  lastValue = "O";
                                else
                                  lastValue = "X";
                              });
                            }
                          },
                    child: Container(
                      width: Game.blocSize,
                      height: Game.blocSize,
                      decoration: BoxDecoration(
                          color: MainColor.secondaryColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Text(
                          game.board![index],
                          style: TextStyle(
                              fontSize: 64,
                              color: game.board![index] == "X"
                                  ? Colors.blue
                                  : Colors.pink),
                        ),
                      ),
                    ),
                  );
                })),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            result,
            style: TextStyle(color: Colors.white, fontSize: 45),
          ),
          ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  game.board = Game.initGameBoard();
                  lastValue = "X";
                  gameOver = false;
                  turn = 0;
                  result = "";
                  scoreboard = [0,0,0,0,0,0,0,0];
                });
              },
              icon: Icon(Icons.replay),
              label: Text("Repeat the Game"))
        ],
      ),
    );
  }
}