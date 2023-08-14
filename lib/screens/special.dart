import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SpecialScreen extends StatefulWidget {
  const SpecialScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SpecialScreenState();
  }
}

class _SpecialScreenState extends State<SpecialScreen> {
  final _audioPlayer = AudioPlayer();

  final List<String> _listItem = [
    'assets/images/baby.jpg',
    'assets/images/baby.jpg',
    'assets/images/baby.jpg',
    'assets/images/baby.jpg',
    'assets/images/baby.jpg',
    'assets/images/baby.jpg',
    'assets/images/baby.jpg',
    'assets/images/baby.jpg',
    'assets/images/baby.jpg',
    'assets/images/baby.jpg',
    'assets/images/baby.jpg',
    'assets/images/baby.jpg',
    'assets/images/baby.jpg',
    'assets/images/baby.jpg',
  ];

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Special"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: _listItem
              .map((item) => Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(item), fit: BoxFit.cover)),
                      child: Transform.translate(
                        offset: const Offset(50, -50),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 60),
                          width: 40,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              primary: Colors.grey[800],
                            ),
                            onPressed: () {
                              _audioPlayer.play(
                                AssetSource('videos/baby.mp3'),
                              );
                            },
                            child: const Icon(Icons.play_arrow),
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
