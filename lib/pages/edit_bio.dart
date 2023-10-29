import 'package:flutter/material.dart';

class EditBioPage extends StatefulWidget {
  final String name;
  final String registerNumber;
  final String rollNumber;
  final String branch;
  final String block;
  final String room;
  final String studentPhoneNumber;
  final String parentName;
  final String parentPhoneNumber;
  final String address;
  final String dob;
  final String bloodGroup;

  EditBioPage({
    required this.name,
    required this.registerNumber,
    required this.rollNumber,
    required this.branch,
     required this.block,
    required this.room,
    required this.studentPhoneNumber,
    required this.parentName,
    required this.parentPhoneNumber,
    required this.address,
    required this.dob,
    required this.bloodGroup,
  });

  @override
  _EditBioPageState createState() => _EditBioPageState();
}

class _EditBioPageState extends State<EditBioPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController registerNumberController = TextEditingController();
  TextEditingController rollNumberController = TextEditingController();
  TextEditingController blockController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController studentPhoneNumberController = TextEditingController();
  TextEditingController parentNameController = TextEditingController();
  TextEditingController parentPhoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize the text controllers with the current bio information
    nameController.text = widget.name;
    registerNumberController.text = widget.registerNumber;
    rollNumberController.text = widget.rollNumber;
    blockController.text = widget.block;
    roomController.text = widget.room;
    branchController.text = widget.branch;
    studentPhoneNumberController.text = widget.studentPhoneNumber;
    parentNameController.text = widget.parentName;
    parentPhoneNumberController.text = widget.parentPhoneNumber;
    addressController.text = widget.address;
    dobController.text = widget.dob;
    bloodGroupController.text = widget.bloodGroup;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Bio Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: registerNumberController,
                decoration: InputDecoration(labelText: 'Register Number'),
              ),
              TextField(
                controller: rollNumberController,
                decoration: InputDecoration(labelText: 'Roll Number'),
              ),
               TextField(
                controller: blockController,
                decoration: InputDecoration(labelText: 'Block Number'),
              ), TextField(
                controller: roomController,
                decoration: InputDecoration(labelText: 'Room Number'),
              ),
              TextField(
                controller: branchController,
                decoration: InputDecoration(labelText: 'Branch'),
              ),
              TextField(
                controller: studentPhoneNumberController,
                decoration: InputDecoration(labelText: 'Student Phone'),
              ),
              TextField(
                controller: parentNameController,
                decoration: InputDecoration(labelText: 'Parent/Guardian Name'),
              ),
              TextField(
                controller: parentPhoneNumberController,
                decoration: InputDecoration(labelText: 'Parent/Guardian Phone'),
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextField(
                controller: dobController,
                decoration: InputDecoration(labelText: 'DOB'),
              ),
              TextField(
                controller: bloodGroupController,
                decoration: InputDecoration(labelText: 'Blood Group'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Save the updated bio information and return to the previous screen
                  saveUpdatedBio();
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveUpdatedBio() {
    // Get the updated bio information from the text controllers
    final updatedData = {
      'name': nameController.text,
      'registerNumber': registerNumberController.text,
      'rollNumber': rollNumberController.text,
      'block' : blockController.text,
      'room' : roomController.text,
      'branch': branchController.text,
      'studentPhoneNumber': studentPhoneNumberController.text,
      'parentName': parentNameController.text,
      'parentPhoneNumber': parentPhoneNumberController.text,
      'address': addressController.text,
      'dob': dobController.text,
      'bloodGroup': bloodGroupController.text,
    };

    // Return the updated data to the previous screen
    Navigator.of(context).pop(updatedData);
  }
}
