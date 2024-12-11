import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_medicine_box/authentication/auth_services.dart';
import 'package:my_medicine_box/presentation/components/profile_buttons.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
              color: Colors.transparent,
              height: 260,
              width: 500,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 30, top: 30, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    CircleAvatar(
                      backgroundImage: user.photoURL != null
                          ? NetworkImage(user.photoURL!)
                          : null,
                      backgroundColor: Colors.grey,
                      maxRadius: 50,
                      child: user.photoURL == null
                          ? const Icon(Icons.person,
                              size: 50, color: Colors.white)
                          : null,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      user.displayName ?? user.email ?? "No Name",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  myButton(
                      text: "theme",
                      onTap: () {},
                      icon: Icons.palette_outlined),
                  myButton(
                      text: "Notifications",
                      onTap: () {},
                      icon: Icons.notifications_active_outlined),
                  myButton(
                      text: "remainder",
                      onTap: () {},
                      icon: Icons.timer_outlined),
                  myButton(
                      text: "settings",
                      onTap: () {},
                      icon: Icons.settings_outlined),
                  myButton(
                      text: "logout",
                      onTap: () => AuthServices().Logout(),
                      icon: Icons.logout_rounded),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
