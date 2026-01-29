import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../bloc/cubits/countries/fetch/load_countries_list_cubit.dart';
import 'country_item/country_item_loading.dart';

class HomeMobileBodyLoading extends StatelessWidget {
  const HomeMobileBodyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<LoadCountriesListCubit>().loadCountries();
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: skeleton(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              width: double.maxFinite,
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.primary,
              shimmerColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          SliverList.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return CountryItemLoading();
            },
          ),
        ],
      ),
    );
  }
}
