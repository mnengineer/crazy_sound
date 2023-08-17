import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({Key? key}) : super(key: key);

  void _share(String text) => Share.share(text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(bottom: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'アプリをシェアする',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Text(
                'アプリをシェアしていただけると\n開発者が喜びます！',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => _share('Strange Sounds'),
                child: const Text('シェアする'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
