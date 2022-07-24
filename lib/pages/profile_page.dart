import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_bracket/auth/main_page.dart';
import 'package:e_bracket/pages/home/home_page.dart';
import 'package:e_bracket/pages/notification_page.dart';
import 'package:e_bracket/pages/profile_page.dart';
import 'package:e_bracket/components/navigationbar.dart';
import 'package:e_bracket/pages/wrapper_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(fit: StackFit.expand, children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Profile.jpg'),
                ),
                SizedBox(
                  height: 46,
                  width: 46,
                )
              ]),
            ),
            SizedBox(height: 10),
            Text(
              'Fikriansyah',
              style: GoogleFonts.roboto(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Edit Profile',
              style: GoogleFonts.roboto(fontSize: 15),
            ),
            SizedBox(height: 300),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Color(0xFF79018C),
              padding: EdgeInsets.all(12),
              child: Text(
                'Sign Out',
                style: GoogleFonts.roboto(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
