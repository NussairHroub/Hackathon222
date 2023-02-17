import 'package:flutter/material.dart';
import 'package:kfupm_clubs/screens/event_details_page/widgets/date.dart';
import 'package:kfupm_clubs/screens/event_details_page/widgets/details.dart';
import 'package:kfupm_clubs/screens/event_details_page/widgets/location_map.dart';

class EventToggleBar extends StatefulWidget {
  const EventToggleBar({Key? key}) : super(key: key);

  @override
  State<EventToggleBar> createState() => _EventToggleBarState();
}

class _EventToggleBarState extends State<EventToggleBar> {
  List<bool> isSelected = [true, false, false];
  List<String> options = ['Details', 'Dates', 'Map'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ToggleButtons(
            isSelected: isSelected,
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            fillColor: Colors.black,
            selectedColor: Colors.white,
            borderColor: Colors.grey,
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
            children: options.map((e) => Text(e)).toList(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          child: isSelected[0]
              ? const Details()
              : isSelected[1]
                  ? const Date()
                  : const LocationMap(),
        ),
      ],
    );
  }
}
