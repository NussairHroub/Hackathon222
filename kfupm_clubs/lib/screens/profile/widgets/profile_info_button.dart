import 'package:flutter/material.dart';
import 'package:kfupm_clubs/utils/constant.dart';

class ProfileInfoButton extends StatefulWidget {
  ProfileInfoButton({
    Key? key,
    required this.backgroundColor,
    required this.phrase,
    required this.onPressed,
  }) : super(key: key);
  final Color backgroundColor;
  final String phrase;
  final VoidCallback onPressed;
  @override
  State<ProfileInfoButton> createState() => _ProfileInfoButtonState();
}

class _ProfileInfoButtonState extends State<ProfileInfoButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          widget.phrase,
          style: sourceCodePro16Font.copyWith(fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
