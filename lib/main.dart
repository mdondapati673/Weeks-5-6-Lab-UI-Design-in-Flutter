
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI Lab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}

// Screen 1 - StatelessWidget
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone_android,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Flutter UI Design Lab',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Go to Interactive Screen'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const InteractiveScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Screen 2 - StatefulWidget
class InteractiveScreen extends StatefulWidget {
  const InteractiveScreen({super.key});

  @override
  State<InteractiveScreen> createState() =>
      _InteractiveScreenState();
}

class _InteractiveScreenState
    extends State<InteractiveScreen> {
  final TextEditingController _controller =
      TextEditingController();

  String greeting = "Enter your name below";

  void updateGreeting() {
    setState(() {
      greeting = "Hello, ${_controller.text}!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              greeting,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Your Name',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateGreeting,
              child: const Text('Update Greeting'),
            ),
          ],
        ),
      ),
    );
  }
}
