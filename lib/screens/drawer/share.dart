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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    left: 16,
                    right: 16),
                child: Image.asset('assets/images/baby.jpg'),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 0, left: 30, right: 30),
                child: const Text(
                  'アプリをシェアする',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 16, bottom: 0, left: 30, right: 30),
                child: const Text(
                  'アプリをシェアしていただけると、\n開発者が喜びます！',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // ボタンを配置
              Container(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: () => _share('Strange Sounds'),
                  child: const Text('シェアする'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
