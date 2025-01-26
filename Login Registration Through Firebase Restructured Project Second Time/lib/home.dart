import 'package:conet_flutter_withfirebase/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Column(
        children: [
          const Center(child: Text("Welcome To Home Screen")),
          const SizedBox(
            height: 300,
          ),
          ElevatedButton(onPressed: () async{
          FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(
          context,MaterialPageRoute(builder: (context) => const LoginScreen()),
  );
          },
                    style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                const Color.fromARGB(255, 243, 4, 4),
              ),
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              overlayColor: WidgetStateProperty.all<Color>(
                const Color.fromARGB(255, 43, 14, 171).withOpacity(0.1),
              ),
              elevation: WidgetStateProperty.all<double>(8.0),
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              ),
              shape: WidgetStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              textStyle: WidgetStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ), 
          child: const Text("Sign Out"),
          )
        ],
      ),
    );
  }
}