import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CountryItemLoading extends StatelessWidget {
  const CountryItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: skeleton(
              height: 56,
              width: 100,
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.primary,
              shimmerColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                skeleton(
                  height: 16,
                  borderRadius: BorderRadius.circular(4),
                  width: 100,
                  color: Theme.of(context).colorScheme.primary,
                  shimmerColor: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(height: 6),
                skeleton(
                  height: 16,
                  borderRadius: BorderRadius.circular(4),
                  width: 60,
                  color: Theme.of(context).colorScheme.primary,
                  shimmerColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          skeleton(
            height: 30,
            width: 30,
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primary,
            shimmerColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
