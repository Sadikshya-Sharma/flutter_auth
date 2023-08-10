import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/controllers/editProfile_controller.dart';
import 'package:flutter_auth/login.dart';
import 'package:flutter_auth/profile_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  UserProfileController controller = Get.put(UserProfileController());

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  final TextEditingController _contactcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  File? _image;

  Future _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(27),
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : AssetImage("assets/images/profile.png")
                            as ImageProvider<Object>?,
                  ),
                  Positioned(
                    bottom: -7,
                    right: -9,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Choose an option'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    GestureDetector(
                                      child: Text('Gallery'),
                                      onTap: () {
                                        _getImage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    SizedBox(height: 16),
                                    GestureDetector(
                                      child: Text('Camera'),
                                      onTap: () {
                                        _getImage(ImageSource.camera);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.camera_alt_rounded),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              GetBuilder<UserProfileController>(
                builder: (controller) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              color: Colors.grey.withOpacity(.2),
                              spreadRadius: 5,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _namecontroller,
                                cursorColor: Colors.black87,
                                decoration: InputDecoration(
                                  labelText: "Name",
                                  prefixIcon: Icon(Icons.person_outline),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              color: Colors.grey.withOpacity(.2),
                              spreadRadius: 5,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _emailcontroller,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  prefixIcon: Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              color: Colors.grey.withOpacity(.2),
                              spreadRadius: 5,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _addresscontroller,
                                decoration: InputDecoration(
                                  labelText: "Address",
                                  prefixIcon: Icon(Icons.location_on),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 2),
                              color: Colors.grey.withOpacity(.2),
                              spreadRadius: 5,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _contactcontroller,
                                decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  prefixIcon:
                                      Icon(Icons.phone_android_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Confirmation"),
                                content: Text(
                                    "Are you sure you want to save the changes?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      // Close the dialog
                                      Navigator.of(context).pop();

                                      // Call the controller method to update the profile
                                      await controller.updateUserProfile(
                                        userId: 8, // Provide the user ID
                                        username: _namecontroller.text,
                                        email: _emailcontroller.text,
                                        userImage:
                                            _image != null ? _image!.path : "",
                                        address: _addresscontroller.text,
                                        contactNum: _contactcontroller.text,
                                      );

                                      // You can perform any additional actions here after the update

                                      // For example, you might want to navigate to another screen
                                      // after the update is successful.
                                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
                                    },
                                    child: Text("Save"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text("Save Changes"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: 30, right: 30, bottom: 15, top: 15),
                          backgroundColor: Colors.orange.shade800,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
