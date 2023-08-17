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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(bottom: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'アプリをご利用いただき\n誠にありがとうございます!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'アプリを気に入っていただけましたら\nレビューをお願いします！\n\n一生懸命改善に取り組みます。\nレビューいただけると幸いです！',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  if (await inAppReview.isAvailable()) {
                    inAppReview.requestReview();
                    // inAppReview.openStoreListing(appStoreId: 'App Store ID');
                  }
                },
                child: const Text('レビューする'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
