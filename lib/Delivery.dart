import 'package:flutter/material.dart';
import 'homescreen.dart';

class DeliveryStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.green[100],
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Center(
                child: Text(
                  'Delivery Status',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  _buildStep(
                    context,
                    icon: Icons.edit,
                    title: 'Order Taken',
                    isCompleted: true,
                  ),
                  _buildStep(
                    context,
                    icon: Icons.kitchen,
                    title: 'Order Is Being Prepared',
                    isCompleted: true,
                  ),
                  _buildStep(
                    context,
                    icon: Icons.delivery_dining,
                    title: 'Order Is Being Delivered',
                    subtitle: 'Your delivery agent is coming',
                    isCompleted: true,
                    actionIcon: Icons.phone,
                    actionCallback: () {
                      // Add functionality to call delivery agent
                    },
                  ),
                  _buildMapPreview(),
                  _buildStep(
                    context,
                    icon: Icons.check_circle,
                    title: 'Order Received',
                    isCompleted: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 24.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green,
                  side: const BorderSide(color: Colors.green),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Continue shopping',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(BuildContext context,
      {required IconData icon,
      required String title,
      String? subtitle,
      bool isCompleted = false,
      IconData? actionIcon,
      VoidCallback? actionCallback}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.green[100],
            child: Icon(icon, size: 24, color: isCompleted ? Colors.green : Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
              ],
            ),
          ),
          if (actionIcon != null && actionCallback != null)
            IconButton(
              icon: Icon(actionIcon, color: Colors.green),
              onPressed: actionCallback,
            ),
        ],
      ),
    );
  }

  Widget _buildMapPreview() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/Lokasi.jpeg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
