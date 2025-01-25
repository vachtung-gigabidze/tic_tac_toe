// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

enum GameMode { singlePlayer, twoPlayer }

enum GameDifficulty { easy, normal, hard }

class Leaderboard {
  int time;
  GameDifficulty gameDifficulty;
  Leaderboard({
    required this.time,
    required this.gameDifficulty,
  });

  Leaderboard copyWith({
    int? time,
    GameDifficulty? gameDifficulty,
  }) {
    return Leaderboard(
      time: time ?? this.time,
      gameDifficulty: gameDifficulty ?? this.gameDifficulty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'gameDifficulty': gameDifficulty.name,
    };
  }

  factory Leaderboard.fromMap(Map<String, dynamic> map) {
    return Leaderboard(
      time: map['time'] as int,
      gameDifficulty: GameDifficulty.values.byName(map['gameDifficulty']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Leaderboard.fromJson(String source) =>
      Leaderboard.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Leaderboard(time: $time, gameDifficulty: $gameDifficulty)';

  @override
  bool operator ==(covariant Leaderboard other) {
    if (identical(this, other)) return true;

    return other.time == time && other.gameDifficulty == gameDifficulty;
  }

  @override
  int get hashCode => time.hashCode ^ gameDifficulty.hashCode;
}

class Setting {
  bool gameTime;
  int duration;
  bool musicEnable;
  String selectedMusic;
  int selectedPairNumber;
  List<Leaderboard> leaderboards;
  Setting({
    required this.gameTime,
    required this.duration,
    required this.musicEnable,
    required this.selectedMusic,
    required this.selectedPairNumber,
    required this.leaderboards,
  });

  Setting copyWith({
    bool? gameTime,
    int? duration,
    bool? musicEnable,
    String? selectedMusic,
    int? selectedPairNumber,
    List<Leaderboard>? leaderboards,
  }) {
    return Setting(
      gameTime: gameTime ?? this.gameTime,
      duration: duration ?? this.duration,
      musicEnable: musicEnable ?? this.musicEnable,
      selectedMusic: selectedMusic ?? this.selectedMusic,
      selectedPairNumber: selectedPairNumber ?? this.selectedPairNumber,
      leaderboards: leaderboards ?? this.leaderboards,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gameTime': gameTime,
      'duration': duration,
      'musicEnable': musicEnable,
      'selectedMusic': selectedMusic,
      'selectedPairNumber': selectedPairNumber,
      'leaderboards': leaderboards.map((x) => x.toMap()).toList(),
    };
  }

  factory Setting.fromMap(Map<String, dynamic> map) {
    return Setting(
      gameTime: map['gameTime'] as bool,
      duration: map['duration'] as int,
      musicEnable: map['musicEnable'] as bool,
      selectedMusic: map['selectedMusic'] as String,
      selectedPairNumber: map['selectedPairNumber'] as int,
      leaderboards: map['leaderboards'] == null
          ? []
          : List<Leaderboard>.from(
              (map['leaderboards'])
                  .map<Leaderboard>(
                    (x) => Leaderboard.fromMap(x as Map<String, dynamic>),
                  )
                  .toList(),
            ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Setting.fromJson(String source) =>
      Setting.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Setting(gameTime: $gameTime, duration: $duration, musicEnable: $musicEnable, selectedMusic: $selectedMusic, selectedPairNumber: $selectedPairNumber, leaderboards: $leaderboards)';
  }

  @override
  bool operator ==(covariant Setting other) {
    if (identical(this, other)) return true;

    return other.gameTime == gameTime &&
        other.duration == duration &&
        other.musicEnable == musicEnable &&
        other.selectedMusic == selectedMusic &&
        other.selectedPairNumber == selectedPairNumber &&
        listEquals(other.leaderboards, leaderboards);
  }

  @override
  int get hashCode {
    return gameTime.hashCode ^
        duration.hashCode ^
        musicEnable.hashCode ^
        selectedMusic.hashCode ^
        selectedPairNumber.hashCode ^
        leaderboards.hashCode;
  }
}
