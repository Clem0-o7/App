import 'package:flutter/material.dart';
import '../components/appbar.dart';
import '../components/side_menu.dart';

class LeaveApplicationPage extends StatefulWidget {
  final String name;
  final String email;
  final String profileImage;

  LeaveApplicationPage({
    required this.name,
    required this.email,
    required this.profileImage,
  });

  @override
  _LeaveApplicationPageState createState() => _LeaveApplicationPageState();
}

class _LeaveApplicationPageState extends State<LeaveApplicationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openSideMenu() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        onMenuPressed: openSideMenu,
        title: 'Leave Application',
      ),
      drawer: SideMenu(
        onMenuItemPressed: (String item) {
          // Handle menu item presses as needed
          if (item == 'Logout') {
            // Handle logout
            // You can navigate to the login page here
          }
          Navigator.pop(context); // Close the drawer
        },
        name: widget.name,
        email: widget.email,
        profileImage: widget.profileImage,
      ),
      body: Center(
        child: Text('This is the Leave Application Page'),
      ),
    );
  }
}
