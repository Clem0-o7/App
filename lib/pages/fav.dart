// fav.dart
import 'package:flutter/material.dart';

class FavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Items'),
      ),
      body: TabbedFavItems(),
    );
  }
}

class TabbedFavItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                FavTab(),
                FavTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Replace with the actual number of items
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/your_image.jpg'), // Replace with your image path
          ),
          title: Text('Item $index'), // Replace with actual item name
          subtitle: Row(
            children: [
              Icon(Icons.star, color: Colors.amber),
              Text('4.5'), // Replace with the actual rating
            ],
          ),
        );
      },
    );
  }
}
