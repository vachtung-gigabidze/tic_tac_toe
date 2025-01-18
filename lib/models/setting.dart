// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum GameMode { singlePlayer, twoPlayer }

enum GameDifficulty { easy, normal, hard }

class Setting {
  bool gameTime;
  int duration;
  bool musicEnable;
  String selectedMusic;
  String player1Image;
  String player2Image;
  int selectedPairNumber;
  Setting({
    required this.gameTime,
    required this.duration,
    required this.musicEnable,
    required this.selectedMusic,
    required this.player1Image,
    required this.player2Image,
    required this.selectedPairNumber,
  });

  Setting copyWith({
    bool? gameTime,
    int? duration,
    bool? musicEnable,
    String? selectedMusic,
    String? player1Image,
    String? player2Image,
    int? selectedPairNumber,
  }) {
    return Setting(
      gameTime: gameTime ?? this.gameTime,
      duration: duration ?? this.duration,
      musicEnable: musicEnable ?? this.musicEnable,
      selectedMusic: selectedMusic ?? this.selectedMusic,
      player1Image: player1Image ?? this.player1Image,
      player2Image: player2Image ?? this.player2Image,
      selectedPairNumber: selectedPairNumber ?? this.selectedPairNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gameTime': gameTime,
      'duration': duration,
      'musicEnable': musicEnable,
      'selectedMusic': selectedMusic,
      'player1Image': player1Image,
      'player2Image': player2Image,
      'selectedPairNumber': selectedPairNumber,
    };
  }

  factory Setting.fromMap(Map<String, dynamic> map) {
    return Setting(
      gameTime: map['gameTime'] as bool,
      duration: map['duration'] as int,
      musicEnable: map['musicEnable'] as bool,
      selectedMusic: map['selectedMusic'] as String,
      player1Image: map['player1Image'] as String,
      player2Image: map['player2Image'] as String,
      selectedPairNumber: map['selectedPairNumber'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Setting.fromJson(String source) =>
      Setting.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Setting(gameTime: $gameTime, duration: $duration, musicEnable: $musicEnable, selectedMusic: $selectedMusic, player1Image: $player1Image, player2Image: $player2Image, selectedPairNumber: $selectedPairNumber)';
  }

  @override
  bool operator ==(covariant Setting other) {
    if (identical(this, other)) return true;

    return other.gameTime == gameTime &&
        other.duration == duration &&
        other.musicEnable == musicEnable &&
        other.selectedMusic == selectedMusic &&
        other.player1Image == player1Image &&
        other.player2Image == player2Image &&
        other.selectedPairNumber == selectedPairNumber;
  }

  @override
  int get hashCode {
    return gameTime.hashCode ^
        duration.hashCode ^
        musicEnable.hashCode ^
        selectedMusic.hashCode ^
        player1Image.hashCode ^
        player2Image.hashCode ^
        selectedPairNumber.hashCode;
  }
}
