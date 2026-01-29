import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/cubits/countries/data/models/country_model.dart';
import '../../../bloc/cubits/countries/fetch/load_countries_list_cubit.dart';
import '../../../bloc/cubits/countries/fetch/load_countries_list_state.dart';
import '../../../bloc/cubits/countries/fetch_details/fetch_country_details_cubit.dart';
import '../../../bloc/cubits/countries/fetch_details/fetch_country_details_state.dart';
import '../../../bloc/cubits/countries/search/search_counbtry_cubit.dart';
import '../../../bloc/cubits/countries/search/search_country_state.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/drawables.dart';
import '../../../utils/format_number.dart';
import '../../../widgets/custom_cashed_img.dart';
import '../../country_details_page/widgets/country_detail_item.dart';
import '../../country_details_page/widgets/timezone_item.dart';
import '../widgets/country_item/country_item.dart';
import '../widgets/home_mobile_body_loading.dart';

class TabletBody extends StatefulWidget {
  const TabletBody({super.key});

  @override
  State<TabletBody> createState() => _TabletBodyState();
}

class _TabletBodyState extends State<TabletBody> {
  Timer? debounce;
  final searchController = TextEditingController();

  CountryData? selectedCountry;

  void onSearchChanged(String term) {
    if (debounce?.isActive ?? false) debounce!.cancel();

    debounce = Timer(const Duration(milliseconds: 500), () {
      if (term.isEmpty) {
        context.read<LoadCountriesListCubit>().resetToAll();
      } else {
        // Call your search function here
        context.read<SearchCountryCubit>().searchCountry(term);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 400,
          child: BlocListener<SearchCountryCubit, SearchCountryState>(
            listener: (context, state) {
              if (state.state == AppState.success) {
                context.read<LoadCountriesListCubit>().pushData(
                  state.data ?? [],
                );
              }
              if (state.state == AppState.error) {
                if ((state.data ?? []).isNotEmpty) {
                  context.read<LoadCountriesListCubit>().pushData(
                    state.data ?? [],
                  );
                }
              }
            },
            child: BlocBuilder<LoadCountriesListCubit, LoadCountriesState>(
              builder: (context, state) {
                if (state.state == AppState.loading) {
                  return HomeMobileBodyLoading();
                }

                return RefreshIndicator(
                  color: Theme.of(context).colorScheme.onPrimary,
                  onRefresh: () async {
                    context.read<LoadCountriesListCubit>().loadCountries();
                  },
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                          height: 48,
                          padding: EdgeInsets.only(left: 20, right: 5),
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                Drawables.search,
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: TextField(
                                  controller: searchController,
                                  onChanged: onSearchChanged,

                                  decoration: InputDecoration.collapsed(
                                    hintText: "Search for a country",
                                    hintStyle: TextStyle(
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  searchController.clear();
                                  context
                                      .read<LoadCountriesListCubit>()
                                      .resetToAll();
                                },
                                icon: BlocBuilder<
                                  SearchCountryCubit,
                                  SearchCountryState
                                >(
                                  builder: (context, state) {
                                    if (state.state == AppState.loading) {
                                      return SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.onPrimary,
                                        ),
                                      );
                                    } else {
                                      return Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.grey,
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      (context.read<LoadCountriesListCubit>().state.data ?? [])
                              .isNotEmpty
                          ? SliverList.builder(
                            itemCount:
                                (context
                                            .read<LoadCountriesListCubit>()
                                            .state
                                            .data ??
                                        [])
                                    .length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  selectedCountry =
                                      context
                                          .read<LoadCountriesListCubit>()
                                          .state
                                          .data![index];

                                  context
                                      .read<FetchCountryDetailsCubit>()
                                      .fetchCountryDetails(
                                        "${selectedCountry?.cca2}",
                                      );

                                  setState(() {});
                                },
                                child: CountryItem(
                                  country:
                                      context
                                          .read<LoadCountriesListCubit>()
                                          .state
                                          .data![index],
                                ),
                              );
                            },
                          )
                          : SliverToBoxAdapter(
                            child: Column(
                              children: [
                                SizedBox(height: 100),
                                Icon(Icons.delete),
                                SizedBox(height: 4),
                                Text("No country found"),
                              ],
                            ),
                          ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        if (selectedCountry != null)
          Expanded(
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
                        return Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Text("Loading..."),
                        );
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
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "${state.data?.name?.common}",
                                  style: TextTheme.of(
                                    context,
                                  ).displayLarge?.copyWith(
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
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
                                  AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: CustomCashedImage(
                                      imageUrl: state.data?.flags?.png,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          value: formatNumber(
                                            state.data?.population,
                                          ),
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
                                            (state.data?.timezones ?? [])
                                                .length,
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
          ),
      ],
    );
  }
}
