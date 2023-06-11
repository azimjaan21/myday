import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TimeWidget extends StatelessWidget {
  final Function pickCalendar;
  final DateTime markedDate;
  final Function() scrollPastDate;
  final Function() scrollFutureDate;

  const TimeWidget(
    this.pickCalendar,
    this.markedDate,
    this.scrollPastDate,
    this.scrollFutureDate, {
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            scrollPastDate();
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 40,
          ),
        ),
        TextButton(
          onPressed: () {
            pickCalendar(context);
          },
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 25),
              children: [
                TextSpan(
                  text: "${DateFormat.EEEE().format(markedDate)}, ",
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: DateFormat('d MMMM').format(markedDate),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            scrollFutureDate();
          },
          icon: const Icon(
            Icons.chevron_right,
            size: 40,
          ),
        ),
      ],
    );
  }
}
