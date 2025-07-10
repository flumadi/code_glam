import 'package:flutter/material.dart';

void main() => runApp(const CodeGlamApp());

class CodeGlamApp extends StatelessWidget {
  const CodeGlamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF9EB3),
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CODE & GLAM 💻✨',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFCE4EC),
              Color(0xFFF8BBD0),
              Color(0xFFF48FB1),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.shade200,
                      blurRadius: 20,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '✨ Hello, Tech Queen! ✨',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF880E4F),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Balance coding sessions\nwith self-care routines',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.4,
                        color: Color(0xFF4A148C),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    Image.network(
                      'https://cdn.pixabay.com/photo/2022/03/20/15/13/woman-7080996_1280.png',
                      height: 180,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  print("Let's glam and code!");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                icon: const Icon(Icons.auto_awesome_rounded),
                label: const Text(
                  'START YOUR JOURNEY',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF880E4F),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.pink[300],
                  elevation: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACCESS YOUR GLAM SPACE'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.shade100,
                    blurRadius: 15,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Tech-Beauty Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF880E4F),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Developer ID',
                      prefixIcon: const Icon(Icons.code),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: Colors.pink[50],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Glam Passcode',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: Colors.pink[50],
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => print('Login initiated'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A148C),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => print('Registration started'),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF880E4F)),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Color(0xFF880E4F),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot your passcode?',
                      style: TextStyle(color: Color(0xFF4A148C)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              '“Code with confidence, glow with purpose”',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}