import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  final bool isComplete;
  final String taskTitle;
  final Function onTapCallback;
  final Function horizontalDragCallback;
  final String time;
  final String category;
  final bool isFirst;
  final bool isLast;

  EventTile({
    this.isComplete,
    this.taskTitle,
    this.onTapCallback,
    this.horizontalDragCallback,
    this.time,
    this.category,
    this.isFirst,
    this.isLast,
  });

  double iconSize = 24;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: horizontalDragCallback,
      onTap: onTapCallback,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: <Widget>[
            Container(
              decoration: IconDecoration(
                context: context,
                iconSize: iconSize,
                lineWidth: 1,
                isFirst: isFirst, //index == 0 ?? true,
                isLast:  isLast, //index == eventData.eventCount - 1 ?? true,
              ),
              child: Container(
                decoration: isComplete
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
                  isComplete
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
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Container(
                  padding: EdgeInsets.all(16.0),
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
                        taskTitle,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        foregroundDecoration:
                            BoxDecoration(color: Color(0x60FDFDFD)),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}

class IconDecoration extends Decoration {
  final double iconSize;
  final double lineWidth;
  final bool isFirst;
  final bool isLast;
  final BuildContext context;

  IconDecoration({
    @required this.iconSize,
    @required this.lineWidth,
    @required this.isFirst,
    @required this.isLast,
    @required this.context,
  });

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return IconLine(
      iconSize: iconSize,
      lineWidth: lineWidth,
      isFirst: isFirst,
      isLast: isLast,
      context: context,
    );
  }
}

class IconLine extends BoxPainter {
  final double iconSize;
  final double lineWidth;
  final bool isFirst;
  final bool isLast;
  final BuildContext context;
  final Paint paintLine;

  IconLine({
    @required this.iconSize,
    @required this.lineWidth,
    @required this.isFirst,
    @required this.isLast,
    @required this.context,
  }) : paintLine = Paint()
          ..color = Theme.of(context).accentColor
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
