import 'package:code_glam/core/constants/app_colors.dart';
import 'package:code_glam/core/constants/app_strings.dart';
import 'package:code_glam/features/auth/presentation/screens/login_screen.dart';
import 'package:code_glam/features/auth/presentation/screens/register_screen.dart';
import 'package:code_glam/features/send_money/presentation/screens/send_money_screen.dart';
import 'package:code_glam/routes/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CodeGlamApp());
}

class CodeGlamApp extends StatelessWidget {
  const CodeGlamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: RouteNames.welcome,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  margin: const EdgeInsets.all(20),
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
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.login);
                  },
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
                    elevation: 10,
                  ),
                  child: const Text(
                    'START YOUR JOURNEY',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}