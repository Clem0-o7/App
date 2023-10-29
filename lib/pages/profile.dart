import 'package:flutter/material.dart';
import 'edit_bio.dart'; // Import the edit_bio.dart file

class BioPage extends StatefulWidget {
  final String name;
  final String email;
  final String profileImage;

  BioPage({
    required this.name,
    required this.email,
    required this.profileImage,
  });

  @override
  _BioPageState createState() => _BioPageState();
}

class _BioPageState extends State<BioPage> {
  // Define variables for student bio information
  String name = 'Sathyavani M';
  String registerNumber = '22C111';
  String rollNumber = '65073';
  String block = 'A';
  String room = '12';
  String branch = 'Computer Science';
  String studentPhoneNumber = '123-456-7890';
  String parentName = 'Amma';
  String parentPhoneNumber = '987-654-3210';
  String address = '123 Main St, City, Country';
  String dob = '01/01/2000';
  String bloodGroup = 'A+';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Bio Information'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Table(
              defaultColumnWidth: IntrinsicColumnWidth(),
              children: [
                buildTableRow('Name', name),
                buildTableRow('Register Number', registerNumber),
                buildTableRow('Roll Number', rollNumber),
                buildTableRow('Block', block),
                buildTableRow('Room', room),
                buildTableRow('Branch', branch),
                buildTableRow('Student Phone', studentPhoneNumber),
                buildTableRow('Parent/Guardian Name', parentName),
                buildTableRow('Parent/Guardian Phone', parentPhoneNumber),
                buildTableRow('Address', address),
                buildTableRow('DOB', dob),
                buildTableRow('Blood Group', bloodGroup),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to the edit bio page and receive the updated data
          final updatedData = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditBioPage(
                name: name,
                registerNumber: registerNumber,
                rollNumber: rollNumber,
                block: block,
                room: room,
                branch: branch,
                studentPhoneNumber: studentPhoneNumber,
                parentName: parentName,
                parentPhoneNumber: parentPhoneNumber,
                address: address,
                dob: dob,
                bloodGroup: bloodGroup,
              ),
            ),
          );

          // Check if updatedData is not null and apply the changes
          if (updatedData != null) {
            setState(() {
              // Update the bio information with the updated data
              name = updatedData['name'];
              registerNumber = updatedData['registerNumber'];
              rollNumber = updatedData['rollNumber'];
              block = updatedData['block'];
              room = updatedData['room'];
              branch = updatedData['branch'];
              studentPhoneNumber = updatedData['studentPhoneNumber'];
              parentName = updatedData['parentName'];
              parentPhoneNumber = updatedData['parentPhoneNumber'];
              address = updatedData['address'];
              dob = updatedData['dob'];
              bloodGroup = updatedData['bloodGroup'];
            });
          }
        },
        child: Icon(Icons.edit),
      ),
    );
  }

  TableRow buildTableRow(String label, String value) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value),
          ),
        ),
      ],
    );
  }
}
