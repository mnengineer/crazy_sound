import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _CategoryDetailScreenState();
  }
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(widget.title),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: _listItem
              .map((item) => Card(
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
