import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_bracket/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_bracket/auth/main_page.dart';
import 'package:e_bracket/pages/home_page.dart';
import 'package:e_bracket/pages/notification_page.dart';
import 'package:e_bracket/pages/profile_page.dart';
import 'package:e_bracket/components/navigationbar.dart';
import 'package:e_bracket/pages/wrapper_page.dart';

import 'editprofile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String email = "";

  Future getEmail() async {
    String currentEmail = "-";
    if (FirebaseAuth.instance.currentUser != null) {
      currentEmail = FirebaseAuth.instance.currentUser!.email ?? "-";
    }

    email = currentEmail;
    print(email);
  }

  @override
  void initState() {
    getEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Profile",
              style: TextStyle(
                  color: Color(0XFF79018C),
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/Profile.jpg'),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .where("email", isEqualTo: email)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (!snapshot.hasData) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.data!.docs.isEmpty) {
                            return Text('Something went wrong');
                          }

                          print('donee');
                          print(snapshot.data);

                          print(snapshot.data!.docs.first.data());
                          print(FirebaseAuth.instance.currentUser!.email);

                          UserModel userModel = UserModel.fromJson(
                              snapshot.data!.docs.first.data());
                          userModel.id = snapshot.data!.docs.first.id;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  userModel.firstName.toString() +
                                      " " +
                                      userModel.lastName.toString(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0XFF79018C),
                                      fontWeight: FontWeight.bold)),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditProfilePage(
                                                userModel: userModel,
                                              )));
                                },
                                child: Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                    fontSize: 17,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                  ],
                )
              ],
            ),
            Spacer(),
            Center(
              child: InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                      color: Color(0xFF79018C),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
