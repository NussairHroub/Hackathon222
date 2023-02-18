import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfupm_clubs/models/event.dart';
import 'package:kfupm_clubs/providers/auth_provider.dart';
import 'package:kfupm_clubs/screens/event_details_page/event_info.dart';
import 'package:kfupm_clubs/screens/event_details_page/widgets/event_picture.dart';
import 'package:kfupm_clubs/screens/event_details_page/widgets/event_toggle_bar.dart';

import '../../services/database.dart';
import '../../utils/constant.dart';

class EventDetailsPage extends ConsumerStatefulWidget {
  const EventDetailsPage({Key? key, required this.event}) : super(key: key);
  final Event event;
  @override
  EventDetailsPageState createState() => EventDetailsPageState();
}

class EventDetailsPageState extends ConsumerState<EventDetailsPage> {
  bool isRegistered = false;
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authStateProvider);
    final registeredEvents = ref.watch(userToEventFutureProvider);
    isRegistered = registeredEvents.asData?.value
            .any((element) => element.id == widget.event.id) ??
        false;

    return registeredEvents.when(
        data: (data) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                    onPressed: (() => Navigator.pop(context)),
                    icon:
                        const Icon(Icons.arrow_back_ios, color: Colors.black)),
              ),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TODO: pass the path of the image here
                    const EventPicture(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('${widget.event.name}', style: sourceCodePro20Font),
                    const SizedBox(
                      height: 20,
                    ),
                    EventInfo(event: widget.event),
                    const SizedBox(
                      height: 20,
                    ),
                    EventToggleBar(event: widget.event),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          //time down counter
                          children: [
                            Text('10', style: sourceCodePro32Font),
                            Text(':', style: sourceCodePro32Font),
                            Text('50', style: sourceCodePro32Font),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            if (!isRegistered) {
                              DB().registerToEvent(
                                  userId: user.asData!.value!.uid,
                                  eventId: widget.event.id);
                            }
                            setState(() {});
                          },
                          child: Container(
                            width: 135,
                            height: 45,
                            decoration: BoxDecoration(
                              color:
                                  isRegistered ? darkGreyColor : primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                isRegistered ? 'Registered' : 'Register Me',
                                style: sourceCodePro16Font,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ));
        },
        error: (error, stack) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
