import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_bracket/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final UserModel userModel;
  const EditProfilePage({Key? key, required this.userModel}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isLoading = false;

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _lastPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstName.text = widget.userModel.firstName.toString();
    _lastName.text = widget.userModel.lastName.toString();
    _email.text = widget.userModel.email.toString();
  }

  _submit() async {
    if (_firstName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("First name can't be empty"),
        backgroundColor: Colors.red,
      ));
    } else if (_lastName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("First name can't be empty"),
        backgroundColor: Colors.red,
      ));
    } else {
      var user = FirebaseAuth.instance.currentUser;
      try {
        if (user != null) {
          await user
              .reauthenticateWithCredential(EmailAuthProvider.credential(
                  email: _email.text, password: _lastPassword.text))
              .then((_)async {
            await user.updateEmail(_email.text).then((_) async {
              await user.updatePassword(_newPassword.text).then((_) async {
                //update firestore
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(widget.userModel.id)
                    .update({
                  "firstName": _firstName.text,
                  "lastName": _lastName.text,
                }).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Success update data"),
                    backgroundColor: Colors.purple,
                  ));
                  Navigator.pop(context);
                }).catchError((e) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Failed"),
                    backgroundColor: Colors.red,
                  ));
                });
              }).catchError((e) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Gagal update password"),
                  backgroundColor: Colors.red,
                ));
              });
            }).catchError((e) {
              print("error");
              print(e);

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Gagal update email"),
                backgroundColor: Colors.red,
              ));
            });
          }).catchError((e) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Gagal update data :Periksa kembali password anda"),
              backgroundColor: Colors.red,
            ));
          });
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Gagal update data"),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF79018C),
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/Profile.jpg'),
              ),
              const SizedBox(height: 20),

              // firstname textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _firstName,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF79018C)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'First Name',
                      label: const Text('First Name')),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _lastName,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF79018C)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Last Name',
                      label: const Text('Last Name')),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _email,
                  readOnly: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF79018C)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      label: const Text('Email')),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _lastPassword,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF79018C)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Old Password',
                      label: const Text('Old Password')),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _newPassword,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF79018C)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'New Password',
                      label: const Text('New Password')),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : InkWell(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await _submit();
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          decoration: BoxDecoration(
                              color: const Color(0xFF79018C),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
