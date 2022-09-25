import 'package:flutter/material.dart';
import 'package:nectar/nectar/screens/splash_screen.dart';
import 'package:nectar/notes/screens/notes_screen.dart';
import 'package:nectar/posts/screens/posts_screen.dart';

class ChooseProjectScreen extends StatelessWidget {
  const ChooseProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SplashScreen(),
                  ),
                );
              },
              child: const Text("Nactar App"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NotesScreen(),
                  ),
                );
              },
              child: const Text("Notes App"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PostsScreen(),
                  ),
                );
              },
              child: const Text("Posts API App"),
            ),
          ],
        ),
      ),
    );
  }
}
