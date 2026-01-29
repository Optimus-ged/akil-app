import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../bloc/cubits/countries/data/models/country_model.dart';
import '../../../../bloc/cubits/countries/favorites/favorite_countries_cubit.dart';
import '../../../../utils/format_number.dart';
import '../../../../utils/toast_utils.dart';
import '../../../../widgets/custom_cashed_img.dart';

class CountryItem extends StatelessWidget {
  const CountryItem({required this.country, super.key});

  final CountryData country;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Row(
        children: [
          Hero(
            tag: country.flags!.png!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 56,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CustomCashedImage(imageUrl: country.flags?.png),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${country.name?.common}".capitalized,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextTheme.of(context).displaySmall?.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Population: ${formatNumber(country.population)}",
                  style: TextTheme.of(
                    context,
                  ).bodySmall?.copyWith(color: Color(0xff6B7582)),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          IconButton(
            onPressed: () {
              context.read<FavoriteCountriesCubit>().addFavorite(country);
              ToastUtils.show("Country added to favorites");
            },
            icon: Icon(
              Icons.favorite_border,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            // icon: Image.asset(Drawables.favorites, height: 24, width: 24),
          ),
        ],
      ),
    );
  }
}
