import '../models/user.dart';
import '../models/club.dart';
import '../models/event.dart';

import 'package:riverpod/riverpod.dart';
import '../providers/event_provider.dart';
import '../providers/club_provider.dart';

final eventsFutureProvider = FutureProvider.autoDispose<List<Event>>(
  (ref) async {
    final events = await ref.watch(eventsProvider);
    return events.docs.map((e) => Event.fromQuery(e)).toList();
  },
);

final clubsFutureProvider = FutureProvider.autoDispose<List<Club>>(
  (ref) async {
    final clubs = await ref.watch(clubsProvider);
    return clubs.docs.map((e) => Club.fromQuery(e)).toList();
  },
);