import 'package:flutter/material.dart';
import 'package:svg_sheet_music/svg_sheet_music.dart';
import 'package:svg_sheet_music_example/test_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<SheetMusicState> _sheetMusic = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            _sheetMusic.currentState!.setVLinesColor(Colors.red);
            _sheetMusic.currentState!.setHLinesColor(Colors.green);
            _sheetMusic.currentState!.setKeyColor(Colors.blue);
            _sheetMusic.currentState!.setNotesColor(Colors.purple);
            _sheetMusic.currentState!.update();
          },
        ),
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SheetMusic(
          key: _sheetMusic,
          svg: kTestSvg,
        ),
      ),
    );
  }
}
