import 'package:flutter/material.dart';
import 'package:tce/pages/home.dart';
import 'package:tce/pages/hostel_dashboard.dart';
import 'package:tce/pages/issues.dart';
import 'package:tce/pages/leave_app.dart';
import 'package:tce/pages/login.dart';
import 'package:tce/pages/meal_mgmt.dart';
import 'package:tce/pages/profile.dart';

class SideMenu extends StatelessWidget {
  final Function(String) onMenuItemPressed;
  final String name;
  final String email;
  final String profileImage;

  SideMenu({
    required this.onMenuItemPressed,
    required this.name,
    required this.email,
    required this.profileImage,
  });

  final blueIconColor = Colors.blue;
  final redIconColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(profileImage),
              ),
              accountName: Text(name),
              accountEmail: Text(email),
              decoration: BoxDecoration(
                color: blueIconColor, // Blue background color
              ),
            ),
            buildMenuItem(
              icon: Icons.home,
              title: 'Home',
              onPressed: () {
                selectedItem(context, 0);
              },
            ),
            buildMenuItem(
              icon: Icons.person,
              title: 'Profile',
              onPressed: () {
                selectedItem(context, 1);
              },
            ),
            buildMenuItem(
              icon: Icons.assignment,
              title: 'Leave Application',
              onPressed: () {
                selectedItem(context, 2);
              },
            ),
            buildMenuItem(
              icon: Icons.dashboard,
              title: 'Hostel Dashboard',
              onPressed: () {
                selectedItem(context, 3);
              },
            ),
            buildMenuItem(
              icon: Icons.restaurant_menu,
              title: 'Meal Management',
              onPressed: () {
                selectedItem(context, 4);
              },
            ),
            buildMenuItem(
              icon: Icons.report_problem,
              title: 'Report Issues',
              onPressed: () {
                selectedItem(context, 5);
              },
            ),
            buildMenuItem(
              icon: Icons.logout,
              title: 'Logout',
              iconColor: redIconColor, // Red color for Logout
              textColors: redIconColor, // Red color for Logout text
              onPressed: () {
                selectedItem(context, 6);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required IconData icon,
    required String title,
    VoidCallback? onPressed,
    Color iconColor = Colors.blue,
    Color textColors = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(color: textColors)),
      hoverColor: Colors.white,
      onTap: onPressed,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              HomePage(name: name, email: email, profileImage: profileImage),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BioPage(name: name, email: email, profileImage: profileImage)
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LeaveApplicationPage(name: name, email: email, profileImage: profileImage)
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HostelDashboardPage(name: name, email: email, profileImage: profileImage)
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MealManagementPage(name: name, email: email, profileImage: profileImage)
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => IssuesPage(name: name, email: email, profileImage: profileImage)
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage()
        ));
        break;
      case 7:
        onMenuItemPressed('MealSchedule',);
        break;
    }
  }
  //static void _defaultOnPressed() {}
}
