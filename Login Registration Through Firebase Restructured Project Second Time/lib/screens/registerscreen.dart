import 'package:conet_flutter_withfirebase/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  registerAccount() async{
try {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text,
  );

  // Display a SnackBar Message at bottom for 2 seconds and its backgroud color will Green
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content:Text("Account Created Successfully!, Login with it"),
      backgroundColor:Colors.green,
      duration: Duration(seconds: 2),
      ),
    );
    // If Account is Successful Created Navigate to Login Screen
    Navigator.pop(
    context,
    MaterialPageRoute(builder: (context) => const LoginScreen()),
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("The password provided is too week."),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
      ),
    );
  } 
  else if (e.code == 'email-already-in-use') {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("The Account already exists for that email."),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 1),
        ),
    );
  }
} catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Error: $e"),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
  ),
 );
}
 
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Register your email address",
                hintStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(15),
                // ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 155, 127, 3),
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 4, 54, 119),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your Password",
                hintStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 155, 127, 3),
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 4, 54, 119),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
             //Register Function
             registerAccount();
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                const Color.fromARGB(255, 155, 127, 3),
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
            child: const Text("Register Account"),
          ),
        ],
      ),
    );
  }
}
