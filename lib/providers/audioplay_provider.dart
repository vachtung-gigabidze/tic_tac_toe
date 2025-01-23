// // import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_soloud/flutter_soloud.dart';

// class AudioPlayWidget extends StatefulWidget {
//   const AudioPlayWidget({
//     super.key,
//     required this.child,
//   });

//   final Widget child;

//   @override
//   State<AudioPlayWidget> createState() => _AudioPlayWidgetState();
// }

// class _AudioPlayWidgetState extends State<AudioPlayWidget> {
//   // AudioPlayer audioPlayer = AudioPlayer();
//   late SoLoud soLoud;
//   late AudioSource backgroundSong;
//   // void stop() async {}

//   // void play() async {}

//   // @override
//   // void initState() async {
//   //   super.initState();

//   //   // if (_soLoud.isInitialized){return;}

//   //   // SoundHandle backgroundSoundHandle = await _soLoud.play(backgroundSong);
//   // }

//   Future<void> playBackground() async {
//     print("audio");
//     try {
//       await SoLoud.instance.init();
//       // if (soLoud.isInitialized) {
//       //   return;
//       // }

//       backgroundSong =
//           await SoLoud.instance.loadAsset('assets/songs/country.mp3');
//       final handle = soLoud.play(backgroundSong);
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   void dispose() {
//     soLoud.deinit();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: playBackground(),
//         builder: (context, AsyncSnapshot<void> snapshot) => widget.child);
//     // return AudioPlayProvider(
//     //   play: play,
//     //   stop: stop,
//     //   child: widget.child,
//     // );
//   }
// }

// class AudioPlayProvider extends InheritedWidget {
//   const AudioPlayProvider({
//     required this.stop,
//     required this.play,
//     required this.child,
//     super.key,
//   }) : super(child: child);

//   final VoidCallback play;
//   final VoidCallback stop;

//   @override
//   // ignore: overridden_fields
//   final Widget child;

//   static AudioPlayProvider? maybeOf(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<AudioPlayProvider>()
//         as AudioPlayProvider;
//   }

//   static AudioPlayProvider of(BuildContext context) {
//     final AudioPlayProvider? result = maybeOf(context);
//     assert(result != null, 'No FrogColor found in context');
//     return result!;
//   }

//   @override
//   bool updateShouldNotify(AudioPlayProvider oldWidget) {
//     return false; //oldWidget.setting != setting;
//   }
// }
