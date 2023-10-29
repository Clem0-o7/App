import 'package:flutter/material.dart';

class VendorHomePage extends StatefulWidget {
  @override
  _VendorHomePageState createState() => _VendorHomePageState();
}

class _VendorHomePageState extends State<VendorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendor Home Page'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          padding: EdgeInsets.all(16.0),
          children: [
            HomeButton(
              title: 'Rating',
              icon: Icons.star,
              onPressed: () {
                // Handle the Rating button press
              },
            ),
            HomeButton(
              title: 'Students',
              icon: Icons.people,
              onPressed: () {
                // Handle the Students button press
              },
            ),
            HomeButton(
              title: 'Issues',
              icon: Icons.report_problem,
              onPressed: () {
                // Handle the Issues button press
              },
            ),
            HomeButton(
              title: 'Announcement',
              icon: Icons.announcement,
              onPressed: () {
                // Handle the Announcement button press
              },
            ),
            HomeButton(
              title: 'Logout',
              icon: Icons.logout,
              onPressed: () {
                // Handle the Logout button press
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPressed;

  HomeButton({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48.0,
            color: Colors.blue,
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
