import 'package:flutter/material.dart';
import 'appointment_screen.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final String doctorName;
  final String speciality;

  const DoctorDetailsScreen({
    super.key,
    required this.doctorName,
    required this.speciality,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Details"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 60),
            ),

            const SizedBox(height: 20),

            Text(
              doctorName,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              speciality,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 5),
                Text(
                  "4.9 Rating",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const ListTile(
              leading: Icon(Icons.work, color: Colors.blue),
              title: Text("Experience"),
              subtitle: Text("12 Years"),
            ),

            const ListTile(
              leading: Icon(Icons.attach_money, color: Colors.green),
              title: Text("Consultation Fee"),
              subtitle: Text("₹500"),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppointmentScreen(
                        doctorName: doctorName,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Book Appointment",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}