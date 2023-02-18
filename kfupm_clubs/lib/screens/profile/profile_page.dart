import 'package:flutter/material.dart';
import 'package:kfupm_clubs/models/user.dart';
import 'package:kfupm_clubs/screens/profile/widgets/profile_info_button.dart';
import 'package:kfupm_clubs/screens/profile/widgets/profile_info_row.dart';
import 'package:kfupm_clubs/utils/constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = user != Null;

    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Icon(
                  Icons.person,
                  color: goldColor,
                  size: 100,
                ),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(100)),
                height: 150,
                width: 150,
              ),
            ],
          ),
          const ProfileInfoRow(
              icon: Icons.person_outline, content: "Someone from mars"),
          const ProfileInfoRow(
              icon: Icons.mail_outline, content: "someone@mars.planet"),
          const ProfileInfoRow(
            icon: Icons.stairs_outlined,
            content: "Martian",
          ),
          const SizedBox(
            height: 50,
          ),
          // TODO: create another page for editing by using flags (low)
          ProfileInfoButton(
            backgroundColor: primaryColor,
            phrase: "Edit Profile",
            onPressed: () {
              print("Edit");
            },
          ),
          const SizedBox(
            height: 25,
          ),
          ProfileInfoButton(
            backgroundColor: redColor,
            phrase: "Logout",
            onPressed: () {
              print("logout");
            },
          ),
        ],
      ),
    );
  }
}
