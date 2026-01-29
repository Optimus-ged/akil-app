import 'package:flutter/material.dart';

import 'responsive/home_mobile_body.dart';
import 'responsive/home_tablet_body.dart';
import 'responsive/responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Countries",
                  style: TextTheme.of(context).displayLarge?.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),

              Expanded(
                child: ResponsiveLayout(
                  mobileBody: MobileBody(),
                  tabletBody: TabletBody(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
