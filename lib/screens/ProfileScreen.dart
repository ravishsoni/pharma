import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharma/data/ProfileDetails.dart';
import 'package:pharma/utils/AppBarUtil.dart';
import 'package:pharma/utils/ProfileUtils.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileUtils _profileUtils = ProfileUtils();
  ProfileDetails? _profile;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _practitionerIdController =
      TextEditingController();
  final TextEditingController _billingAddressController =
      TextEditingController();
  final TextEditingController _profileImageController = TextEditingController();
  final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  File? _selectedImage;
  bool isInValidate = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Future<void> _loadProfile() async {
    ProfileDetails? profile = await _profileUtils.getProfile();
    if (profile != null) {
      setState(() {
        _selectedImage = File(profile.profilePicUrl);
        _nameController.text = profile.name;
        _phoneController.text = profile.phone;
        _emailController.text = profile.email;
        _practitionerIdController.text = profile.practitionerId;
        _billingAddressController.text = profile.billingAddress;
      });
    }
  }

  void _saveProfile() async {
    ProfileDetails updatedProfile = ProfileDetails(
      name: _nameController.text,
      phone: _phoneController.text,
      email: _emailController.text,
      practitionerId: _practitionerIdController.text,
      billingAddress: _billingAddressController.text,
      profilePicUrl: (_selectedImage == null) ? "" : _selectedImage!.path,
    );
    await _profileUtils.saveProfile(updatedProfile);
    buildSnackBar("Profile updated successfully!");
    setState(() {
      _profile = updatedProfile;
    });
  }

  void buildSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarUtil(
          title: 'Profile',
          actions: [
            Icon(
              Icons.notifications,
              color: Colors.white,
            )
          ],
          isBack: false,
          backgroundColor: Color(0xff00000000),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                buildProfileHeader(),
                buildTextField("Name", _nameController),
                buildTextField("Phone", _phoneController),
                buildTextField("Email", _emailController, readOnly: true),
                buildTextField("Practitioner ID", _practitionerIdController),
                buildTextField("Billing Address", _billingAddressController),
              ],
            ),
          ),
        ));
  }

  Widget buildProfileHeader() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50], // Light background color
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              // Profile Image
              GestureDetector(
                onTap: _pickImageFromGallery,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: ((_selectedImage != null)
                      ? FileImage(_selectedImage!) as ImageProvider
                      : AssetImage("")),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      (_nameController.text == '')
                          ? 'Test Name'
                          : _nameController.text,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8), // Spacing

                    // Edit Details Button
                    OutlinedButton(
                      onPressed: () {
                        validateEditProfileData();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                      child: const Text(
                        "Edit details",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildTextField(String label, TextEditingController controller,
      {bool readOnly = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType:
            (label == 'Phone') ? TextInputType.number : TextInputType.text,
        maxLength: (label == 'Phone') ? 10 : 50,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }

  void validateEditProfileData() {
    if (_phoneController.text.length < 10) {
        buildSnackBar('Phone no length should be 10');
    } else if (!emailRegex.hasMatch(_emailController.text)) {
      buildSnackBar('Please enter valid email address');
    }else {
        _saveProfile();
    }
  }
}
