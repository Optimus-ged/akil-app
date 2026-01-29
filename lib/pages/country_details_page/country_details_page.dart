import '../../bloc/cubits/countries/data/models/country_model.dart';
import 'widgets/country_details_loading.dart';

import 'widgets/country_detail_item.dart';
import 'widgets/timezone_item.dart';
import '../../utils/app_constants.dart';
import '../../utils/format_number.dart';
import '../../widgets/custom_cashed_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits/countries/fetch_details/fetch_country_details_cubit.dart';
import '../../bloc/cubits/countries/fetch_details/fetch_country_details_state.dart';

class CountryDetailsPage extends StatelessWidget {
  const CountryDetailsPage({required this.country, super.key});

  final CountryData country;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              FetchCountryDetailsCubit()
                ..fetchCountryDetails("${country.cca2}"),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: SafeArea(
          child: Scaffold(
            body: BlocBuilder<
              FetchCountryDetailsCubit,
              FetchCountryDetailsState
            >(
              builder: (context, state) {
                if (state.state == AppState.loading) {
                  return CountryDetailsLoading(country: country);
                }
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
                          Text(
                            "${state.data?.name?.common}",
                            style: TextTheme.of(context).displayLarge?.copyWith(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: "${state.data?.flags?.png}",
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .35,
                                width: double.maxFinite,
                                child: CustomCashedImage(
                                  imageUrl: state.data?.flags?.png,
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Key statistics",
                                    style: TextTheme.of(
                                      context,
                                    ).displayLarge?.copyWith(
                                      fontSize: 16,
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CountryDetailItem(
                                    title: "Area",
                                    value: "${state.data?.area}",
                                  ),
                                  SizedBox(height: 16),
                                  CountryDetailItem(
                                    title: "Population",
                                    value: formatNumber(state.data?.population),
                                  ),
                                  SizedBox(height: 16),
                                  CountryDetailItem(
                                    title: "Region",
                                    value: "${state.data?.region}",
                                  ),
                                  SizedBox(height: 16),
                                  CountryDetailItem(
                                    title: "Sub region",
                                    value: "${state.data?.subregion}",
                                  ),
                                  SizedBox(height: 32),
                                  Text(
                                    "Timezones",
                                    style: TextTheme.of(
                                      context,
                                    ).displayLarge?.copyWith(
                                      fontSize: 16,
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Wrap(
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: List.generate(
                                      (state.data?.timezones ?? []).length,
                                      (index) => TimezoneItem(
                                        value:
                                            "${state.data?.timezones?[index]}",
                                      ),
                                    ),
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
              },
            ),
          ),
        ),
      ),
    );
  }
}
