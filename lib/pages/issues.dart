import 'package:flutter/material.dart';
import '../components/appbar.dart';
import '../components/side_menu.dart';

class IssuesPage extends StatefulWidget {
  final String name;
  final String email;
  final String profileImage;

  IssuesPage({
    required this.name,
    required this.email,
    required this.profileImage,
  });

  @override
  _IssuesPageState createState() => _IssuesPageState();
}

class _IssuesPageState extends State<IssuesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openSideMenu() {
    _scaffoldKey.currentState!.openDrawer();
  }

  String? _selectedCategory;
  TextEditingController _issuesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        onMenuPressed: openSideMenu,
        title: 'Issues',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Issues',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              hint: Text('Select Category'),
              value: _selectedCategory,
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              items: ['Cleanliness', 'Security', 'Food'].map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _issuesController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Type your issues',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
