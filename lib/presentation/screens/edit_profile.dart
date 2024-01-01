// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:taxi_app_user/service/repository.dart';
import 'package:taxi_app_user/service/sharedpref.dart';
import 'package:taxi_app_user/service/user.dart';

class EditPage extends StatefulWidget {
  final User user;

   EditPage({super.key, required this.user});

  @override
  EditPageState createState() => EditPageState();
}

class EditPageState extends State<EditPage> {
  late TextEditingController fullNameController;
  late TextEditingController datebirthController;
  late TextEditingController emailController;
  late TextEditingController phonNumberController;
  late TextEditingController genderController;
  late TextEditingController passwordController;

  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with user details
    fullNameController = TextEditingController(text: widget.user.fullname);
    datebirthController = TextEditingController(text: widget.user.birthdate);
    emailController = TextEditingController(text: widget.user.email);
    phonNumberController = TextEditingController(text: widget.user.phonenumber);
    genderController = TextEditingController(text: widget.user.gender);
    passwordController = TextEditingController(text: widget.user.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              TextField(
                controller: fullNameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
              TextField(
                controller: datebirthController,
                decoration: const InputDecoration(labelText: 'Birthdate'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: phonNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
              TextField(
                controller: genderController,
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 12),
              ElevatedButton(
                onPressed: () async {
                  // Update the user object with new details
                  widget.user.fullname = fullNameController.text;
                  widget.user.birthdate = datebirthController.text;
                  widget.user.email = emailController.text;
                  widget.user.phonenumber = phonNumberController.text;
                  widget.user.gender = genderController.text;
                  widget.user.password = passwordController.text;
                  User editedDetails = User(
                      id: await Sharedpref.instence.getId(),
                      fullname: fullNameController.text,
                      birthdate: datebirthController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      phonenumber: phonNumberController.text,
                      gender: genderController.text,
                      image: "");

                  final added = await Repo.updateUserDetails(editedDetails);
                  if (added) {
                    await Sharedpref.instence.setAuthDetaials(
                        emailController.text, passwordController.text);
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          "Failed to Update Data",
                        ),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 3),
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  }
                },
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
