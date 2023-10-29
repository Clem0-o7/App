import 'package:flutter/material.dart';
import '../components/appbar.dart';
import '../components/side_menu.dart';
import 'hostel_dashboard.dart'; // Import the pages you want to navigate to
import 'meal_mgmt.dart';
import 'leave_app.dart';
import 'issues.dart';

class HomePage extends StatefulWidget {
  final String name;
  final String email;
  final String profileImage;

  HomePage({
    required this.name,
    required this.email,
    required this.profileImage,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void handleLogOut() {
    // Implement your log out logic here
    // Update the login status or perform other necessary actions
  }

  void openSideMenu() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void navigateToHostelDashboard() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HostelDashboardPage(
          name: 'Your Name', // Provide the actual name
          email: 'your@email.com', // Provide the actual email
          profileImage: 'your_image_url_or_path.png', // Provide the actual image
        ),
        
      ),
    );
  }

  void navigateToMealManagement() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealManagementPage(
           name: 'Your Name', // Provide the actual name
          email: 'your@email.com', // Provide the actual email
          profileImage: 'your_image_url_or_path.png',
        ),
      ),
    );
  }

  void navigateToLeaveApplication() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LeaveApplicationPage(
          name: 'Your Name', // Provide the actual name
          email: 'your@email.com', // Provide the actual email
          profileImage: 'your_image_url_or_path.png',
        ),
      ),
    );
  }

  void navigateToReportIssues() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => IssuesPage(
          name: 'Your Name', // Provide the actual name
          email: 'your@email.com', // Provide the actual email
          profileImage: 'your_image_url_or_path.png',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        onMenuPressed: openSideMenu,
        title: 'HostelHive',
      ),
      drawer: SideMenu(
        onMenuItemPressed: (String item) {
          if (item == 'Logout') {
            handleLogOut();
          }
        
        },
        name: widget.name,
        email: widget.email,
        profileImage: widget.profileImage,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Notice Board
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Notice Board',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SingleChildScrollView(
  scrollDirection: Axis.vertical,
  child: Column(
    children: [
      AnnouncementTile(
        title: 'Important Notice',
        content: 'Please be informed about the upcoming hostel maintenance on 15.12.2021',
      ),
      //Inga add karo
    ],
  ),
)
,
                ],
              ),
            ),

            // Hostel Dashboard Tile
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Card(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      
                        Text(
                          'Hostel Dashboard',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Icon(Icons.home, color: Colors.white),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: navigateToHostelDashboard, // Navigate to Hostel Dashboard
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity, 40),
                      ),
                      child: Text('View'),
                    ),
                  ],
                ),
              ),
            ),

            // Meal Management Tile
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Card(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       
                        Text(
                          'Meal Management',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Icon(Icons.restaurant_menu, color: Colors.white),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: navigateToMealManagement, // Navigate to Meal Management
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity, 40),
                      ),
                      child: Text("Today's Meal Schedule"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle Favorite Meal button click
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity, 40),
                      ),
                      child: Text('Favorite Meal'),
                    ),
                  ],
                ),
              ),
            ),

            // Leave Application Tile
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Card(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       
                        Text(
                          'Leave Application',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Icon(Icons.local_activity, color: Colors.white),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: navigateToLeaveApplication, // Navigate to Leave Application
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity, 40),
                      ),
                      child: Text('Apply'),
                    ),
                  ],
                ),
              ),
            ),

            // Report Issues Tile
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Card(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                   
                        Text(
                          'Report Issues',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Icon(Icons.report, color: Colors.white),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: navigateToReportIssues, // Navigate to Report Issues
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity, 40),
                      ),
                      child: Text('Report'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnnouncementTile extends StatelessWidget {
  final String title;
  final String content;

  AnnouncementTile({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
