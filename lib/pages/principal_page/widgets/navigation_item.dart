import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    super.key,
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.title,
    this.onTap,
    this.isActive = false,
  });

  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final String title;
  final VoidCallback? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Icon(
                isActive ? selectedIcon : unSelectedIcon,
                size: 25,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            // const SizedBox(height: 6),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextTheme.of(context).bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
