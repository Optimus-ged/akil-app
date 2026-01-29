import 'dart:async';

import 'package:akilapp/pages/country_details_page/country_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/cubits/countries/fetch/load_countries_list_cubit.dart';
import '../../../bloc/cubits/countries/fetch/load_countries_list_state.dart';
import '../../../bloc/cubits/countries/search/search_counbtry_cubit.dart';
import '../../../bloc/cubits/countries/search/search_country_state.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/drawables.dart';
import '../widgets/country_item/country_item.dart';
import '../widgets/home_mobile_body_loading.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  Timer? debounce;
  final searchController = TextEditingController();

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
  void dispose() {
    debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCountryCubit, SearchCountryState>(
      listener: (context, state) {
        if (state.state == AppState.success) {
          context.read<LoadCountriesListCubit>().pushData(state.data ?? []);
        }
        if (state.state == AppState.error) {
          if ((state.data ?? []).isNotEmpty) {
            context.read<LoadCountriesListCubit>().pushData(state.data ?? []);
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
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Image.asset(Drawables.search, height: 24, width: 24),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            onChanged: onSearchChanged,
                            cursorColor:
                                Theme.of(context).colorScheme.onPrimary,
                            decoration: InputDecoration.collapsed(
                              hintText: "Search for a country",
                              hintStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            searchController.clear();
                            context.read<LoadCountriesListCubit>().resetToAll();
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
                                        Theme.of(context).colorScheme.onPrimary,
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
                          (context.read<LoadCountriesListCubit>().state.data ??
                                  [])
                              .length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => CountryDetailsPage(
                                      country:
                                          context
                                              .read<LoadCountriesListCubit>()
                                              .state
                                              .data![index],
                                    ),
                              ),
                            );
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
    );
  }
}
