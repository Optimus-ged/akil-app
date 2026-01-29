import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubits/principal/principal_cubit.dart';
import '../../bloc/cubits/principal/principal_state.dart';
import '../favorites_page/favorites_page.dart';
import '../home_page/home_page.dart';
import 'widgets/custom_bottom_navigation.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PrincipalCubit, PrincipalState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: state.principalNavIndex,
                  children: [HomePage(), FavoritesPage()],
                ),
              ),
              CustomBottomNavigation(
                callBack: (value) {
                  context.read<PrincipalCubit>().setPrincipalNavIndex = value;
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
