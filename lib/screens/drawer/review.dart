import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              Text(
                AppLocalizations.of(context).review_title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                AppLocalizations.of(context).review_description,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (await inAppReview.isAvailable()) {
                    inAppReview.requestReview();
                    // inAppReview.openStoreListing(appStoreId: 'App Store ID');
                  }
                },
                child: Text(
                  AppLocalizations.of(context).review_button,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
