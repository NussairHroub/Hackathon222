import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kfupm_clubs/screens/profile/widgets/profile_info_button.dart';
import 'package:kfupm_clubs/utils/constant.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  File? poster;
  DateTime? dueDate;
  DateTime? endDate;
  String posterText = "Upload File";
  String dueDateText = "Select Due Date";
  String endDateText = "Select End Date";
  String? eventNameValue;
  int? seatsValue;

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
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Event Name"),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: darkGreyColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          onChanged: ((value) {
                            eventNameValue = value;
                          }),
                          decoration: InputDecoration(
                            hintText: "Enter The Event Name",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Number Of Seats"),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: darkGreyColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          onChanged: (value) => seatsValue = int.parse(value),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                            hintText: "Enter the Number Of Seats",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () async {
                  try {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.image,
                      allowMultiple: false,
                    );
                    posterText = "File Uploaded Successfully";
                    setState(() {});
                    poster = File(result!.paths.toString());
                    print(poster?.path);
                  } catch (e) {
                    print("picking file error: ");
                    print(e.toString());
                  }
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Poster Image"),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 400,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 15),
                          child: Text(posterText),
                        ),
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
            GestureDetector(
                onTap: () async {
                  try {
                    dueDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2025));
                    dueDateText = dueDate.toString();
                    setState(() {});
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Registration Due Date"),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 400,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 15),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month),
                              Text("  ${dueDateText}")
                            ],
                          ),
                        ),
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
            GestureDetector(
                onTap: () async {
                  try {
                    endDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2025));
                    endDateText = dueDate.toString();
                    setState(() {});
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Registration End Date"),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 400,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 15),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month),
                              Text("  ${endDateText}")
                            ],
                          ),
                        ),
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
              height: 20,
            ),
            Center(
                child: ProfileInfoButton(
                    backgroundColor: primaryColor,
                    phrase: "Add Event",
                    onPressed: () {
                      if (eventNameValue != null &&
                          seatsValue != null &&
                          poster != null &&
                          dueDate != null &&
                          endDate != null) {
                        print("All field filled");
                      } else {
                        print("missed field");
                      }
                    }))
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
          // onChanged: onChanged,
          decoration: InputDecoration(
            hintText: "${field}",
            border: InputBorder.none,
          ),
        ),
      ),
    );
