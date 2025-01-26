import 'package:conet_flutter_withfirebase/Colors/ElevatedButtonColors.dart';
import 'package:conet_flutter_withfirebase/home.dart';
import 'package:conet_flutter_withfirebase/screens/registerscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
// TextField Controllers for Email and Password
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

// Login Function
  void loginFunction() async{
  if (emailController.text.isEmpty || passwordController.text.isEmpty){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
      content: Text("Please fill out all TextFields."),
      backgroundColor: Color.fromARGB(255, 247, 144, 27),
      ),
    );
    return;
  }

  try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text,
  );
  // If Successful Login Navigate to HomeScreen
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const HomeScreen()),
  );
  } 

  on FirebaseAuthException catch (e) {
      String message;
  if (e.code == 'user-not-found') {
    message = 'No user found for that email.';
  } else if (e.code == 'wrong-password') {
    message = ('Wrong password provided.');
  } else{
    message = "An error occurred. Please try again";
  }

  // Display Eroor Message
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      ),
  );
}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Screen"),),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Type your email",
            hintStyle:const TextStyle(
            fontSize: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )
          ),            
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Type your password",
              hintStyle: const TextStyle(
              fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              )
              )
            ),
          const SizedBox(
          height: 10,),
          ElevatedButton(onPressed: (){
           loginFunction();
          }, 
          style: ButtonStyles.primaryButtonStyle,  //Login Button Style Imported From ElevatedButtonColor.dart file
          child: const Text("Login")),
          const SizedBox(height: 15,),
          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen()));
          },
          child: const Text("Not have an account?"))
        ],
      ),
    );
  }
}