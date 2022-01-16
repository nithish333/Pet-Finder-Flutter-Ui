import 'package:flutter/material.dart';

class RowHeading extends StatelessWidget {
  final String heading;
  const RowHeading({Key? key, required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const Icon(Icons.more_horiz_outlined)
      ],
    );
  }
}
