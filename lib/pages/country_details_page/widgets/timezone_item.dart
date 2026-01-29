import 'package:flutter/material.dart';

class TimezoneItem extends StatelessWidget {
  const TimezoneItem({required this.value, super.key});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimary,
          width: 0.4,
        ),
      ),
      child: Text(
        value,
        style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
