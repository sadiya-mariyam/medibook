import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,

      body: Padding(
        padding: const EdgeInsets.all(25),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Icon(
                Icons.local_hospital,
                size: 110,
                color: Colors.blue,
              ),

              SizedBox(height: 25),

              Text(
                "MediBook",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              SizedBox(height: 15),

              Text(
                "Gokulam Medical College Hospital",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 15),

              Text(
                "Book appointments with doctors\nquickly and easily.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 45),

              SizedBox(
                width: 220,
                height: 50,

                child: ElevatedButton(
                  onPressed: () {
                    print("Navigating...");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                    print("Navigation completed");
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}