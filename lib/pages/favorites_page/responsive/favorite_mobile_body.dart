import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/cubits/countries/favorites/favorite_countries_cubit.dart';
import '../../../bloc/cubits/countries/favorites/favorite_countries_state.dart';
import '../../home_page/widgets/country_item/favorite_country_item.dart';

class FavoriteMobileBody extends StatefulWidget {
  const FavoriteMobileBody({super.key});

  @override
  State<FavoriteMobileBody> createState() => _FavoriteMobileBody();
}

class _FavoriteMobileBody extends State<FavoriteMobileBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCountriesCubit, FavoriteCountriesState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            (context.read<FavoriteCountriesCubit>().state.favoriteCountries ??
                        [])
                    .isNotEmpty
                ? SliverList.builder(
                  itemCount:
                      (context
                                  .read<FavoriteCountriesCubit>()
                                  .state
                                  .favoriteCountries ??
                              [])
                          .length,
                  itemBuilder: (context, index) {
                    return FavoriteCountryItem(
                      country:
                          context
                              .read<FavoriteCountriesCubit>()
                              .state
                              .favoriteCountries![index],
                    );
                  },
                )
                : SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      Icon(Icons.delete),
                      SizedBox(height: 4),
                      Text("No favorite countries"),
                    ],
                  ),
                ),
          ],
        );
      },
    );
  }
}
