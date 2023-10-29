import 'package:flutter/material.dart';
import '../components/appbar.dart'; // Import your appbar.dart file
import '../components/side_menu.dart'; // Import your side_menu.dart file
import 'meal_schedule.dart'; // Import your meal schedule page
import 'fav.dart'; // Import your favorite items page
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MealManagementPage extends StatefulWidget {
  final String name;
  final String email;
  final String profileImage;

  MealManagementPage({
    required this.name,
    required this.email,
    required this.profileImage,
  });

  @override
  _MealManagementPageState createState() => _MealManagementPageState();
}

class _MealManagementPageState extends State<MealManagementPage> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onMenuPressed: () {
          Scaffold.of(context).openDrawer();
        },
        title: 'Meal Management', // Set your custom title here
      ),
      drawer: SideMenu(
        onMenuItemPressed: (pageName) {
          // Handle the menu item press, e.g., navigate to a different page
        },
        name: widget.name,
        email: widget.email,
        profileImage: widget.profileImage,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Vendor information and rating
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Vendor Information',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(widget.profileImage),
                        ),
                        SizedBox(height: 20),
                        // Vendor info
                        Text(
                          'Your Vendor Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Your Vendor Number'),
                        Text('Your Vendor Mail ID'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Star rating (use the imported RatingBar widget)
                  Center(
                    child: RatingBar(
                      initialRating: _rating,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                        full: Icon(Icons.star, color: Colors.amber),
                        half: Icon(Icons.star_half, color: Colors.amber),
                        empty: Icon(Icons.star_border, color: Colors.amber),
                      ),
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      onRatingUpdate: (rating) {
                        setState(() {
                          _rating = rating;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Two buttons for Meal Schedule and Favorite Items
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MealSchedulePage(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Change the button color
                      onPrimary: Colors.white, // Change the text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0), // Add rounded corners
                      ),
                    ),
                    child: Text('Meal Schedule', style: TextStyle(fontSize: 16)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FavPage(),
                        ),
                      );
                    },
                    child: Text('Favorite Items', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
