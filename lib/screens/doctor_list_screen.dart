import 'package:flutter/material.dart';
import 'doctor_details_screen.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctors"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          doctorCard(
            context,
            "Dr. Anil Kumar",
            "Cardiologist",
            Icons.favorite,
            Colors.red,
          ),

          const SizedBox(height: 15),

          doctorCard(
            context,
            "Dr. Priya Nair",
            "Neurologist",
            Icons.psychology,
            Colors.purple,
          ),

          const SizedBox(height: 15),

          doctorCard(
            context,
            "Dr. Rahul Menon",
            "Orthopedic",
            Icons.accessibility_new,
            Colors.orange,
          ),

          const SizedBox(height: 15),

          doctorCard(
            context,
            "Dr. Meera Joseph",
            "Pediatrician",
            Icons.child_care,
            Colors.green,
          ),
        ],
      ),
    );
  }

  Widget doctorCard(
    BuildContext context,
    String name,
    String speciality,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorDetailsScreen(
                doctorName: name,
                speciality: speciality,
              ),
            ),
          );
        },

        leading: CircleAvatar(
          radius: 28,
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),

        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(speciality),

        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}