import 'package:flutter/material.dart';
import 'package:kfupm_clubs/models/event.dart';
import 'package:kfupm_clubs/screens/event_details_page/widgets/date.dart';
import 'package:kfupm_clubs/screens/event_details_page/widgets/details.dart';
import 'package:kfupm_clubs/screens/event_details_page/widgets/location_map.dart';
import 'package:kfupm_clubs/utils/constant.dart';

class EventToggleBar extends StatefulWidget {
  const EventToggleBar({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  State<EventToggleBar> createState() => _EventToggleBarState();
}

class _EventToggleBarState extends State<EventToggleBar> {
  List<bool> isSelected = [true, false, false];
  List<String> options = ['Details', 'Dates', 'MAP'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 45,
          child: ToggleButtons(
            isSelected: isSelected,
            color: darkGreyColor,
            fillColor: primaryColor,
            selectedColor: whiteColor,
            borderColor: darkGreyColor,
            borderRadius: BorderRadius.circular(10),
            constraints: BoxConstraints(
                minWidth: (MediaQuery.of(context).size.width - 50) / 3),
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < isSelected.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelected[buttonIndex] = true;
                  } else {
                    isSelected[buttonIndex] = false;
                  }
                }
              });
            },
            children: options
                .map((e) => Text(
                      e,
                      style: sourceCodePro14Font,
                    ))
                .toList(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 135,
          child: SingleChildScrollView(
            child: isSelected[0]
                ? Details(details: widget.event.description)
                : isSelected[1]
                    ? Date(event: widget.event,)
                    : const LocationMap(),
          ),
        ),
      ],
    );
  }
}
