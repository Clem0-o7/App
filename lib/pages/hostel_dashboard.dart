import 'package:flutter/material.dart';
import '../components/appbar.dart'; // Import your app bar or custom app bar
import '../components/side_menu.dart'; // Import your side menu or custom side menu

class HostelDashboardPage extends StatefulWidget {
  final String name;
  final String email;
  final String profileImage;

  HostelDashboardPage({
    required this.name,
    required this.email,
    required this.profileImage,
  });

  @override
  _HostelDashboardPageState createState() => _HostelDashboardPageState();
}

class _HostelDashboardPageState extends State<HostelDashboardPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        onMenuPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        title: 'Hostel Dashboard',
      ),
      drawer: SideMenu(
        onMenuItemPressed: (String item) {
          // Handle menu item press (if needed)
          if (item == 'Logout') {
            // Implement your logout logic
          }
          Navigator.pop(context);
        },
        name: widget.name,
        email: widget.email,
        profileImage: widget.profileImage,
      ),
      body: GridView.count(
        crossAxisCount: 2, // 2 columns
        padding: EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          // Room button
          DashboardButton(
            text: 'Room',
            onPressed: () {
              // Add your code for the Room button here
            },
          ),
          // Block button
          DashboardButton(
            text: 'Block',
            onPressed: () {
              // Add your code for the Block button here
            },
          ),
          // Check-In button
          DashboardButton(
            text: 'Check-In',
            onPressed: () {
              // Add your code for the Check-In button here
            },
          ),
          // Pay Fee button
          DashboardButton(
            text: 'Pay Fee',
            onPressed: () {
              // Add your code for the Pay Fee button here
            },
          ),
        ],
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  DashboardButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // Button color
        onPrimary: Colors.white, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0), // Rounded corners
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
