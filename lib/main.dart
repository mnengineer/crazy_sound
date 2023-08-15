import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:strange_sounds/screens/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.grey[300],
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
