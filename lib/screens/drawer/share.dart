import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShareScreen extends StatelessWidget {
  ShareScreen({Key? key}) : super(key: key);

  void _share(String text) => Share.share(text);
  final String content = Platform.isIOS
      ? 'https://apps.apple.com/jp/app/crazy-sound/id6462979201'
      : 'https://apps.apple.com/jp/app/crazy-sound/id6462979201';

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
                AppLocalizations.of(context).share_title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                AppLocalizations.of(context).share_description,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => _share(
                  content,
                ),
                child: Text(
                  AppLocalizations.of(context).share_button,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
