import '../../../bloc/cubits/principal/principal_cubit.dart';
import '../../../bloc/cubits/principal/principal_state.dart';
import 'navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigation extends StatelessWidget {
  final Function(int) callBack;

  const CustomBottomNavigation({required this.callBack, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: BlocBuilder<PrincipalCubit, PrincipalState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavigationItem(
                isActive: state.principalNavIndex == 0,
                selectedIcon: Icons.home,
                unSelectedIcon: Icons.home_outlined,
                title: "Home",
                onTap: () {
                  callBack(0);
                },
              ),
              NavigationItem(
                selectedIcon: Icons.favorite,
                unSelectedIcon: Icons.favorite_border_outlined,
                isActive: state.principalNavIndex == 1,
                title: "Favorites",
                onTap: () {
                  callBack(1);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
