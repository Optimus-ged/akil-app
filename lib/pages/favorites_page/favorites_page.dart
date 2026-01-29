import 'package:flutter/material.dart';

import '../home_page/responsive/responsive_layout.dart';
import 'responsive/favorite_mobile_body.dart';
import 'responsive/favorite_tablet_body.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

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
                  "Favorites",
                  style: TextTheme.of(context).displayLarge?.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),

              Expanded(
                child: ResponsiveLayout(
                  mobileBody: FavoriteMobileBody(),
                  tabletBody: FavoriteTabletBody(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
