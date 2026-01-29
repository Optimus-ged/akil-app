import '../../../../utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../bloc/cubits/countries/data/models/country_model.dart';
import '../../../../bloc/cubits/countries/favorites/favorite_countries_cubit.dart';
import '../../../../widgets/custom_cashed_img.dart';
import '../../../country_details_page/country_details_page.dart';

class FavoriteCountryItem extends StatelessWidget {
  const FavoriteCountryItem({required this.country, super.key});

  final CountryData country;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(UniqueKey().toString()), // unique key for each item
      direction: DismissDirection.horizontal, // swipe from right to left
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(Icons.delete, color: Colors.white),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "Delete favorite",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        context.read<FavoriteCountriesCubit>().removeFavorite(country);
        ToastUtils.show("Country added to favorites");
      },
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CountryDetailsPage(country: country),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CustomCashedImage(imageUrl: country.flags?.png),
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
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Text(
                      "Capital: ${country.capital?[0]}".capitalized,
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
                },
                icon: Icon(
                  Icons.favorite_border,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
