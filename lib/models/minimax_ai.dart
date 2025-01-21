import 'dart:math';

import 'package:tic_tac_toe/models/setting.dart';
import 'package:tic_tac_toe/pages/game_board/page.dart';

class MiniMaxAi {
  int checkCount = 0;

  int move(board, List<int> availablePositions, GameDifficulty gameDifficulty) {
    int smartPoint = 10;

    switch (gameDifficulty) {
      case GameDifficulty.easy:
        smartPoint = 6;
      case GameDifficulty.normal:
        smartPoint = 8;
      case GameDifficulty.hard:
        smartPoint = 9;
    }

    var rndNum = Random().nextInt(10);

    if (rndNum > smartPoint) {
      //Тупой
      rndNum = Random().nextInt(availablePositions.length);
      board[availablePositions[rndNum]] = SelectType.second;
      return checkCount;
    }

    int bestScore = -999999999;
    int bestMove = 0;
    checkCount = 0;
    for (int i = 0; i < board.length; i++) {
      if (board[i] == SelectType.none) {
        board[i] = SelectType.second;
        var score = minimax(board, 0, false);
        board[i] = SelectType.none;
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }
    //print(bestMove);
    // if (availablePositions.length > 4)
    board[bestMove] = SelectType.second;
    return checkCount;
  }

  var scores = {
    SelectType.first: -10,
    SelectType.second: 10,
    SelectType.none: 0,
  };

  minimax(board, depth, isMaximizingPlayer) {
    checkCount++;
    var result = checkAIWinner(board);
    if (result != null) {
      return scores[result];
    }

    if (isMaximizingPlayer) {
      int bestScore = -999999999;
      for (int i = 0; i < board.length; i++) {
        if (board[i] == SelectType.none) {
          board[i] = SelectType.second;
          var score = minimax(board, depth + 1, false);
          board[i] = SelectType.none;
          //alpha = max<double>(alpha, score);
          //if (beta <= alpha) break;
          if (score > bestScore) {
            bestScore = score;
          }
        }
      }
      return bestScore;
    } else {
      int bestScore = 999999999;
      for (int i = 0; i < board.length; i++) {
        if (board[i] == SelectType.none) {
          board[i] = SelectType.first;
          var score = minimax(board, depth + 1, true);
          board[i] = SelectType.none;
          //beta = min<double>(beta, score);
          //if (beta <= alpha) break;
          if (score < bestScore) {
            bestScore = score;
          }
        }
      }
      return bestScore;
    }
  }

  SelectType? checkAIWinner(board) {
    SelectType? tempWinner;
    // Win state 1
    if (board[0] == board[1] &&
        board[0] == board[2] &&
        board[0] != SelectType.none) {
      tempWinner = board[0];
    }

    // Win state 2
    else if (board[3] == board[4] &&
        board[3] == board[5] &&
        board[3] != SelectType.none) {
      tempWinner = board[3];
    }

    // Win state 3
    else if (board[6] == board[7] &&
        board[6] == board[8] &&
        board[6] != SelectType.none) {
      tempWinner = board[6];
    }

    // Win state 4
    else if (board[0] == board[3] &&
        board[0] == board[6] &&
        board[0] != SelectType.none) {
      tempWinner = board[0];
    }

    // Win state 5
    else if (board[1] == board[4] &&
        board[1] == board[7] &&
        board[1] != SelectType.none) {
      tempWinner = board[1];
    }

    // Win state 6
    else if (board[2] == board[5] &&
        board[2] == board[8] &&
        board[2] != SelectType.none) {
      tempWinner = board[2];
    }

    // Win state 7
    else if (board[0] == board[4] &&
        board[0] == board[8] &&
        board[0] != SelectType.none) {
      tempWinner = board[0];
    }

    // Win state 8
    else if (board[2] == board[4] &&
        board[2] == board[6] &&
        board[2] != SelectType.none) {
      tempWinner = board[2];
    }

    int spot = 0;
    for (int i = 0; i < 9; i++) {
      if (board[i] == SelectType.none) spot++;
    }

    if (spot == 0 && tempWinner == null) tempWinner = SelectType.none;

    return tempWinner;
  }
}
