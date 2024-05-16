import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/qmark.png',
            width: 200,
            color: Colors.black.withOpacity(0.6),
          ),
          const SizedBox(height: 50),
          const Text(
            'Quiz app!',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 50),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: switchScreen,
            icon: const Icon(Icons.arrow_right),
            label: const Text(
              'Start Quiz',
            ),
          )
        ],
      ),
    );
  }
}
