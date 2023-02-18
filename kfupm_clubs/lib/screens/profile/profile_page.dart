import 'package:flutter/material.dart';
import 'package:kfupm_clubs/models/user.dart';
import 'package:kfupm_clubs/screens/profile/widgets/profile_info_button.dart';
import 'package:kfupm_clubs/screens/profile/widgets/profile_info_row.dart';
import 'package:kfupm_clubs/utils/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/auth_user_model.dart';
import '../../providers/auth_provider.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key, this.user}) : super(key: key);

  final AuthUserModel? user;

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);

    bool _isLoggedIn = widget.user != Null;

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
          ProfileInfoRow(icon: Icons.person_outline, content: "${widget.user}"),
          ProfileInfoRow(icon: Icons.mail_outline, content: "${widget.user}"),

          SizedBox(
            height: 100,
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
          // TODO: LATER
          ProfileInfoButton(
            backgroundColor: redColor,
            phrase: "Logout",
            onPressed: () {
              auth.signOut();
              print("logged out");
            },
          ),
        ],
      ),
    );
  }
}
