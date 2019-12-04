import 'package:flutter/material.dart';

class Event {
  final String time;
  final String task;
  final String category;
  final bool isComplete;

  Event({this.category, this.time, this.task, this.isComplete});
}

final List<Event> _eventList = [
  new Event(
    time: '08:00',
    task: 'Coffee with Sam',
    category: 'Personal',
    isComplete: true,
  ),
  new Event(
    time: '10:00',
    task: 'Meet with Sales',
    category: 'Work',
    isComplete: true,
  ),
  new Event(
    time: '12:00',
    task: 'Edit API documentation about SSO',
    category: 'Work',
    isComplete: false,
  ),
  new Event(
    time: '18:00',
    task: 'Go to Gym',
    category: 'Personal',
    isComplete: false,
  ),
];

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 24;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      itemCount: _eventList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: <Widget>[
              Container(
                decoration: IconDecoration(
                  iconSize: iconSize,
                  lineWidth: 1,
                  isFirst: index == 0 ?? true,
                  isLast: index == _eventList.length - 1 ?? true,
                ),
                child: Container(
                  decoration: _eventList[index].isComplete
                      ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 3),
                              color: Color(0x20000000),
                              blurRadius: 5,
                            )
                          ],
                        )
                      : null,
                  child: Icon(
                    _eventList[index].isComplete
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    size: iconSize,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              Container(
                foregroundDecoration: BoxDecoration(color: Color(0x60FDFDFD)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(_eventList[index].time),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x20000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _eventList[index].task,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          foregroundDecoration:
                              BoxDecoration(color: Color(0x60FDFDFD)),
                          child: Text(_eventList[index].category),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class IconDecoration extends Decoration {
  final double iconSize;
  final double lineWidth;
  final bool isFirst;
  final bool isLast;

  IconDecoration({
    @required double iconSize,
    @required double lineWidth,
    @required bool isFirst,
    @required bool isLast,
  })  : this.iconSize = iconSize,
        this.lineWidth = lineWidth,
        this.isFirst = isFirst,
        this.isLast = isLast;

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return IconLine(
        iconSize: iconSize,
        lineWidth: lineWidth,
        isFirst: isFirst,
        isLast: isLast);
  }
}

class IconLine extends BoxPainter {
  final double iconSize;
  final bool isFirst;
  final bool isLast;

  final Paint paintLine;

  IconLine({
    @required double iconSize,
    @required double lineWidth,
    @required bool isFirst,
    @required bool isLast,
  })  : this.iconSize = iconSize,
        this.isFirst = isFirst,
        this.isLast = isLast,
        paintLine = Paint()
          ..color = Colors.red
          ..strokeCap = StrokeCap.round
          ..strokeWidth = lineWidth
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final leftOffset = Offset(iconSize / 2, offset.dy);
    final double iconSpace = iconSize / 1.5;

    final Offset top = configuration.size.topLeft(Offset(leftOffset.dx, 0.0));
    final Offset centerTop = configuration.size
        .centerLeft(Offset(leftOffset.dx, leftOffset.dy - iconSpace));

    final Offset centerBottom = configuration.size
        .centerLeft(Offset(leftOffset.dx, leftOffset.dy + iconSpace));
    final Offset end =
        configuration.size.bottomLeft(Offset(leftOffset.dx, leftOffset.dy * 2));

    if (!isFirst) canvas.drawLine(top, centerTop, paintLine);
    if (!isLast) canvas.drawLine(centerBottom, end, paintLine);
  }
}
