import 'package:flutter/material.dart';
import 'appointment_success_screen.dart';

class AppointmentScreen extends StatefulWidget {
  final String doctorName;

  const AppointmentScreen({
    super.key,
    required this.doctorName,
  });

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime? selectedDate;
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Appointment"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Doctor",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.person),
                  hintText: widget.doctorName,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Patient Name",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.account_circle),
                  hintText: "Enter your name",
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                  hintText: "Enter phone number",
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Appointment Date",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.calendar_month),
                  label: Text(
                    selectedDate == null
                        ? "Choose Date"
                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                  ),
                  onPressed: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    );

                    if (picked != null) {
                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Select Time",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                value: selectedTime,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.access_time),
                ),
                hint: const Text("Choose Time Slot"),
                items: const [
                  DropdownMenuItem(
                    value: "09:00 AM",
                    child: Text("09:00 AM"),
                  ),
                  DropdownMenuItem(
                    value: "09:30 AM",
                    child: Text("09:30 AM"),
                  ),
                  DropdownMenuItem(
                    value: "10:00 AM",
                    child: Text("10:00 AM"),
                  ),
                  DropdownMenuItem(
                    value: "10:30 AM",
                    child: Text("10:30 AM"),
                  ),
                  DropdownMenuItem(
                    value: "11:00 AM",
                    child: Text("11:00 AM"),
                  ),
                  DropdownMenuItem(
                    value: "11:30 AM",
                    child: Text("11:30 AM"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedTime = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              const Text(
                "Reason for Visit",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Describe your problem",
                ),
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedDate == null || selectedTime == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Please select both date and time.",
                          ),
                        ),
                      );
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const AppointmentSuccessScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Confirm Appointment",
                    style: TextStyle(
                      fontSize: 18,
                    ),
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