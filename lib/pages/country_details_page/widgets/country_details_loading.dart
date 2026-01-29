import '../../../bloc/cubits/countries/data/models/country_model.dart';
import '../../../widgets/custom_cashed_img.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CountryDetailsLoading extends StatelessWidget {
  const CountryDetailsLoading({required this.country, super.key});

  final CountryData? country;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 20),
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              SizedBox(width: 8),
              skeleton(
                height: 20,
                width: 100,
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).colorScheme.primary,
                shimmerColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                country != null
                    ? Hero(
                      tag: "${country?.flags?.png}",
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .35,
                        width: double.maxFinite,
                        child: CustomCashedImage(imageUrl: country?.flags?.png),
                      ),
                    )
                    : skeleton(
                      height: 200,
                                    width: 300,
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).colorScheme.primary,
                      shimmerColor: Theme.of(context).colorScheme.primary,
                    ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Key statistics",
                        style: TextTheme.of(context).displayLarge?.copyWith(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(height: 20),
                      skeleton(
                        height: 20,
                        width: double.maxFinite,
                        borderRadius: BorderRadius.circular(6),
                        color: Theme.of(context).colorScheme.primary,
                        shimmerColor: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(height: 16),
                      skeleton(
                        height: 20,
                        width: double.maxFinite,
                        borderRadius: BorderRadius.circular(6),
                        color: Theme.of(context).colorScheme.primary,
                        shimmerColor: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(height: 16),
                      skeleton(
                        height: 20,
                        width: double.maxFinite,
                        borderRadius: BorderRadius.circular(6),
                        color: Theme.of(context).colorScheme.primary,
                        shimmerColor: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(height: 16),
                      skeleton(
                        height: 20,
                        width: double.maxFinite,
                        borderRadius: BorderRadius.circular(6),
                        color: Theme.of(context).colorScheme.primary,
                        shimmerColor: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(height: 16),
                      skeleton(
                        height: 20,
                        width: double.maxFinite,
                        borderRadius: BorderRadius.circular(6),
                        color: Theme.of(context).colorScheme.primary,
                        shimmerColor: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
