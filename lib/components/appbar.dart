// appbar.dart

import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    required Function onMenuPressed,
    Key? key,
    String title = 'HostelHive', // Default title is 'HostelHive'
  }) : super(
          key: key,
          title: Text(title), // Set the title
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              onMenuPressed();
            },
          ),
        );
}
