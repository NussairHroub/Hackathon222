import 'package:flutter/material.dart';
import 'package:kfupm_clubs/utils/constant.dart';

class ProfileInfoRow extends StatelessWidget {
  const ProfileInfoRow({Key? key, required this.icon, required this.content})
      : super(key: key);
  final IconData icon;
  final String? content;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: darkGreyColor, width: 0.5))),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          content?? "User",
          style: sourceCodePro14Font,
        ),
      ),
    );
  }
}
