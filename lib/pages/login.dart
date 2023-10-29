import 'package:flutter/material.dart';
import 'package:tce/pages/register.dart';
import '../components/app_theme.dart';
import 'home.dart';
import 'vendor_home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  void loginWithEmail() {
    final email = emailController.text;

    if (email.isEmpty) {
      // Show "Enter valid email" alert
      showAlertDialog('Enter a valid email');
      return;
    }

    if (email.endsWith('student')) {
      // Navigate to the home page with empty profile information
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomePage(
            name: 'John Doe', // Replace with the user's name
            email: email, // Use the entered email
            profileImage: 'assets/user_avatar.png', // Replace with the profile image path
          ),
        ),
      );
    } else if (email.endsWith('vendor')) {
      // Navigate to the vendor home page
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => VendorHomePage(),
        ),
      );
    } else {
      // Show "Enter valid credentials" alert
      showAlertDialog('Enter valid credentials');
    }
  }

  void showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.notWhite,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              constraints: BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  Text(
                    'TCE HOSTEL APP',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkText,
                    ),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('lib\assets\tcelogo.jpeg'),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: passwordController,
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: loginWithEmail,
                          style: ElevatedButton.styleFrom(
                            primary: AppTheme.darkText,
                            onPrimary: AppTheme.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return RegisterPage();
                                },
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppTheme.darkText,
                            onPrimary: AppTheme.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Login with',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppTheme.darkText,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle Google login logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFDD4B39),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    icon: Icon(
                      IconData(0xe905, fontFamily: 'GFSocialFonts'),
                      color: AppTheme.white,
                      size: 20,
                    ),
                    label: Text(
                      'Google +',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
