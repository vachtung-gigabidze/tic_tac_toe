// import 'dart:collection';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/models/setting.dart';

const Set<Song> songs = {
  // Filenames with whitespace break package:audioplayers on iOS
  // (as of February 2022), so we use no whitespace.
  //Song('country.mp3', '', artist: 'Country'),
};

class Song {
  final String filename;

  final String name;

  final String? artist;

  const Song(this.filename, this.name, {this.artist});

  @override
  String toString() => 'Song<$filename>';
}

class SettingStateWidget extends StatefulWidget {
  const SettingStateWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<SettingStateWidget> createState() => _SettingStateWidgetState();
}

class _SettingStateWidgetState extends State<SettingStateWidget> {
  late Setting setting;

  AudioPlayer player = AudioPlayer(playerId: 'musicPlayer');
  // final Queue<Song> _playlist = Queue.of(List<Song>.of(songs)..shuffle());

  Future<Setting> loadSetting() async {
    try {
      // String audioAssets = "assets/sounds/draw.mp3";
      // ByteData bytes = await rootBundle.load(audioAssets);
      // Uint8List songsBytes =
      //     bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      // final urlSource = UrlSource(
      //     Uri.dataFromBytes(songsBytes, mimeType: 'audio/mpeg').toString());

      // player.play(AssetSource("assets/sounds/draw.mp3"));

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? v = preferences.getString("setting");
      if (v != null) {
        // print(v);
        setting = Setting.fromJson(v);
        return setting;
      }
    } catch (e) {
      print('load error $e');
    }
    setting = Setting(
        gameTime: false,
        duration: 20,
        musicEnable: false,
        selectedMusic: "country",
        selectedPairNumber: 1,
        leaderboards: [
          //Leaderboard(time: 10, gameDifficulty: GameDifficulty.easy)
        ]);
    return setting;
  }

  void _handleSongFinished(void _) {
    _playCurrentSongInPlaylist();
  }

  Future<void> _playCurrentSongInPlaylist() async {
    // _log.info(() => 'Playing ${_playlist.first} now.');
    try {
      // print('play');
      await player.play(AssetSource('songs/${setting.selectedMusic}.mp3'));
    } catch (e) {
      // print('play $e');
      // _log.severe('Could not play song ${_playlist.first}', e);
    }
  }

  void _stopAllSound() {
    player.pause();
  }

  void _startOrResumeMusic() async {
    if (player.source == null) {
      await _playCurrentSongInPlaylist();
      return;
    }

    try {
      player.resume();
    } catch (e) {
      _playCurrentSongInPlaylist();
    }
  }

  void _audioOnHandler() {
    if (setting.musicEnable) {
      _startOrResumeMusic();
    } else {
      // All sound just got muted. Audio is off.
      _stopAllSound();
    }
  }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    super.dispose();
  }

  void saveSetting(Setting newSetting) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool result = await preferences.setString("setting", newSetting.toJson());
    if (result) {
      setState(() {
        setting = newSetting;
      });
    }

    _audioOnHandler();
  }

  // bool result = await preferences.setString("setting", s.toJson());

  @override
  void initState() {
    player.onPlayerComplete.listen(_handleSongFinished);
    // setting = Setting(
    //     gameTime: false,
    //     duration: 20,
    //     musicEnable: false,
    //     selectedMusic: "country",
    //     selectedPairNumber: 1,
    //     leaderboards: [
    //       //Leaderboard(time: 10, gameDifficulty: GameDifficulty.easy)
    //     ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Setting>(
        future: loadSetting(),
        //initialData: setting,
        builder: (context, AsyncSnapshot<Setting> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            final s = snapshot.data;
            return SettingProvider(
              saveSetting: saveSetting,
              setting: s ?? setting,
              play: _audioOnHandler,
              child: widget.child,
            );
          }
        });
  }
}

class SettingProvider extends InheritedWidget {
  const SettingProvider(
      {required this.play,
      required this.saveSetting,
      required this.setting,
      super.key,
      required this.child})
      : super(child: child);
  final Setting setting;
  final void Function(Setting setting) saveSetting;
  final VoidCallback play;

  @override
  // ignore: overridden_fields
  final Widget child;

  static SettingProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SettingProvider>()
        as SettingProvider;
  }

  static SettingProvider of(BuildContext context) {
    final SettingProvider? result = maybeOf(context);
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  // static SettingProvider of(BuildContext context) {
  //   return context.dependOnInheritedWidgetOfExactType<SettingProvider>()
  //       as SettingProvider;
  // }

  @override
  bool updateShouldNotify(SettingProvider oldWidget) {
    return oldWidget.setting != setting;
  }
}
