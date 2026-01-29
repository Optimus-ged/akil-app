import '../../../bloc/cubits/countries/favorites/favorite_countries_cubit.dart';
import '../../../bloc/cubits/countries/favorites/favorite_countries_state.dart';
import '../../home_page/widgets/country_item/country_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/cubits/countries/fetch/load_countries_list_cubit.dart';

class FavoriteTabletBody extends StatefulWidget {
  const FavoriteTabletBody({super.key});

  @override
  State<FavoriteTabletBody> createState() => _FavoriteTabletBody();
}

class _FavoriteTabletBody extends State<FavoriteTabletBody> {
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
                      (context.read<LoadCountriesListCubit>().state.data ?? [])
                          .length,
                  itemBuilder: (context, index) {
                    return CountryItem(
                      country:
                          context
                              .read<LoadCountriesListCubit>()
                              .state
                              .data![index],
                    );
                  },
                )
                : SliverToBoxAdapter(child: Text("No data found")),
          ],
        );
      },
    );
  }
}
