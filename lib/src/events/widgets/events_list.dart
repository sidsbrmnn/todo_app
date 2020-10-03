import 'package:flutter/material.dart';
import 'package:todo_app/src/events/models/event_data.dart';
import '../widgets/events_tile.dart';
import 'package:provider/provider.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EventData>(
      builder: (context, eventData, child) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          itemCount: eventData.eventCount,
          itemBuilder: (BuildContext context, int index) {
            final event = eventData.event[index];
            return EventTile(
              taskTitle: event.task,
              time: event.time,
              category: event.category,
              isComplete: event.isComplete,
              isFirst: index == 0 ?? true,
              isLast: index == eventData.eventCount - 1 ?? true,
              horizontalDragCallback: (onHorizontalDrag) {
                eventData.deleteEvent(event);
              },
              onTapCallback: () {
                eventData.updateEvent(event);
              },
            );
          },
        );
      },
    );
  }
}
