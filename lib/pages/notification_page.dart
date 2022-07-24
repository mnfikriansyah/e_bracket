import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_bracket/auth/main_page.dart';
<<<<<<< HEAD
import 'package:e_bracket/pages/home/home_page.dart';
=======
import 'package:e_bracket/pages/home_page.dart';
>>>>>>> origin/fikri
import 'package:e_bracket/pages/notification_page.dart';
import 'package:e_bracket/pages/profile_page.dart';
import 'package:e_bracket/components/navigationbar.dart';
import 'package:e_bracket/pages/wrapper_page.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF79018C),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            'There is no notification yet',
            style: GoogleFonts.roboto(),
          )
        ],
=======
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Notifications",
                style: TextStyle(
                    color: Color(0XFF79018C),
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            NotificationCard(
              time: "26 Jun 2022 14:00",
              body: "Navy vs Evos match will start in 10 minutes. Players please enter the room tournament now.",
            ),
            NotificationCard(
              time: "26 Jun 2022 12:00",
              body: "Ciao (2) vs Sekut Esport (0). Ciao advance.",
            ),
            NotificationCard(
              time: "26 Jun 2022 10:00",
              body: "Navy vs Evos match will start in 10 minutes. Players please enter the room tournament now.",
            ),

          ],
        ),
>>>>>>> origin/fikri
      ),
    );
  }
}
<<<<<<< HEAD
=======

class NotificationCard extends StatelessWidget {
  final String time;
  final String body;
  const NotificationCard({Key? key, required this.time,

  required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              time,style:
            TextStyle(fontSize: 14),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
                body, style:
              TextStyle(fontSize: 18),),
          ),
          SizedBox(height: 20,),
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
        ],

    );
  }
}
>>>>>>> origin/fikri
