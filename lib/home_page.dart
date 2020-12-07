import 'package:TicToe/dialog.dart';
import 'package:TicToe/game_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButton> buttonList;

  var player1;
  var player2;
  var activePlayer;

  void initState() {
    super.initState();
    buttonList = doInt();
  }

  List<GameButton> doInt() {
    player1 = new List();
    player2 = new List();
    activePlayer = 1;
    var gameButtons = <GameButton>[
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9)
    ];
    return gameButtons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        gb.bg = Colors.red;
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "0";
        gb.bg = Colors.green;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner=checkWinner();
      if (winner==0){
        if (buttonList.every((element) => element.text!="")){
          showDialog(context: context,
          builder: (_)=> new CustomDialog("Game Tied","Pres Reset to Restart the game", resetGame));
        }
      }
    });
  }

  int checkWinner() {
    var winner = 0;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != 0) {
      if (winner == 1) {
        showDialog(
          context: context,
          builder: (_) => new CustomDialog(
              "Player 1 Won", "Press Reset to Restart", resetGame),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => new CustomDialog(
              "Player 2 Won", "Press Reset to Restart", resetGame),
        );
      }
    }
    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonList = doInt();
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Tic Tac Toe"),
        ),
        body: new GridView.builder(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 9,
            childAspectRatio: 1,
            mainAxisSpacing: 9,
          ),
          padding: const EdgeInsets.all(10.0),
          itemCount: buttonList.length,
          itemBuilder: (context, i) => new SizedBox(
            width: 100.0,
            height: 100.0,
            child: new RaisedButton(
              padding: const EdgeInsets.all(8.0),
              onPressed:
                  buttonList[i].enabled ? () => playGame(buttonList[i]) : null,
              child: new Text(buttonList[i].text,
                  style: new TextStyle(color: Colors.white, fontSize: 30)),
              color: buttonList[i].bg,
              disabledColor: buttonList[i].bg,
            ),
          ),
        ));
  }
}
