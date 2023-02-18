import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:kfupm_clubs/utils/constant.dart';

class AddEventPage extends StatelessWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Basics",
              style: sourceCodePro32Font.copyWith(color: Colors.black),
            ),
            textFieldWithTitle("Event Name", "Enter The Event Name"),
            SizedBox(
              height: 10,
            ),
            textFieldWithTitle("Number Of Seats", "Enter The Number Of Seats"),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'png'],
                  );
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Poster Image"),
                      SizedBox(height: 5,),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: darkGreyColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              "Dates",
              style: sourceCodePro32Font.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            textFieldWithTitle(
                "Registration Due Date", "Enter The Number Of Seats"),
          ],
        ),
      ),
    ));
  }
}

Widget textFieldWithTitle(String title, String hint) => Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title),
        SizedBox(
          height: 5,
        ),
        fieldContainer(hint),
      ]),
    );

Widget fieldContainer(String field) => Container(
      decoration: BoxDecoration(
        border: Border.all(color: darkGreyColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          decoration: InputDecoration(
            hintText: "${field}",
            border: InputBorder.none,
          ),
        ),
      ),
    );
