import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Text('Version: 1.0.0', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Developed by: masashi', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(
              'Sound effects obtained from https://www.zapsplat.com',
              textAlign: TextAlign.center,
            ),
            // Add other credits or information as needed
          ],
        ),
      ),
    );
  }
}
