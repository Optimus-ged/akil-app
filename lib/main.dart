import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'bloc/cubits/countries/favorites/favorite_countries_cubit.dart';
import 'bloc/cubits/countries/fetch/load_countries_list_cubit.dart';
import 'bloc/cubits/countries/fetch_details/fetch_country_details_cubit.dart';
import 'bloc/cubits/countries/search/search_counbtry_cubit.dart';
import 'bloc/cubits/principal/principal_cubit.dart';
import 'pages/principal_page/principal_page.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';
import 'utils/app_constants.dart';
import 'utils/system_ui.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // set up hydrated bloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );

  try {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) {
      return runApp(const MyApp());
    });
  } catch (error, stacktrace) {
    debugPrint('Main.Main ::: ERROR: $error & STACKTRACE: $stacktrace');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoadCountriesListCubit()..loadCountries(),
        ),
        BlocProvider(create: (context) => SearchCountryCubit()),
        BlocProvider(create: (context) => PrincipalCubit()),
        BlocProvider(create: (context) => FavoriteCountriesCubit()),
        BlocProvider(create: (context) => FetchCountryDetailsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        title: myAppTitle,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const PrincipalPage(),
        builder: (context, child) {
          final isDark = Theme.of(context).brightness == Brightness.dark;
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: isDark ? AppSystemUi.dark : AppSystemUi.light,
            child: child!,
          );
        },
      ),
    );
  }
}
