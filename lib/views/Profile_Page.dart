import 'package:flutter/material.dart';

class StaticProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile photo
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFPpjY9x4PuogkzlyBNVywlxgPlDWqgG3aI3E1JAgtjaUKpq9LUKDHs7kL7udPdq30fbImiUMCV23f1SL-hYA894vKwfcwFrarE4fXz5U'), // Placeholder image
            ),
            SizedBox(height: 20.0),

            // Username
            Text(
              'Riyas', // Replace with actual username
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Email (static)
            SizedBox(height: 10.0),
            Text(
              'riyasfath.com', // Replace with actual email
              style: TextStyle(fontSize: 12),
            ),

            // Password field (static, consider security implications)
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              enabled: false, // Make password field read-only
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
