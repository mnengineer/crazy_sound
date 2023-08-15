import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

class ReviewScreen extends StatelessWidget {
  ReviewScreen({Key? key}) : super(key: key);

  final InAppReview inAppReview = InAppReview.instance;

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
                  'アプリをご利用いただき誠にありがとうございます!',
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
                  'アプリを気に入っていただけましたら、レビューをお願いします！\n\n一生懸命改善に取り組みます。\nレビューいただけると幸いです！',
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
                  onPressed: () async {
                    if (await inAppReview.isAvailable()) {
                      inAppReview.requestReview();
                      // inAppReview.openStoreListing(appStoreId: 'App Store ID');
                    }
                  },
                  child: const Text('レビューする'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
