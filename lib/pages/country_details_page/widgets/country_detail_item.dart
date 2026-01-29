import 'package:flutter/material.dart';

class CountryDetailItem extends StatelessWidget {
  const CountryDetailItem({
    required this.title,
    required this.value,
    super.key,
  });

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextTheme.of(
            context,
          ).bodyMedium?.copyWith(color: Color(0xff61758A)),
        ),
        Text(
          value,
          style: TextTheme.of(context).bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}
