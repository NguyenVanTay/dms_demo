import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../../models/event.dart';

class DayViewWidget extends StatelessWidget {
  final GlobalKey<DayViewState>? state;
  final double? width;
  // final

  const DayViewWidget({
    Key? key,
    this.state,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: DayView<Event>(
        key: state,
        width: width,
      ),
    );
  }
}
