import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo_apexive/bloc/new_timer/new_timer_bloc.dart';
import 'package:odoo_apexive/routes/routes.dart';
import 'package:odoo_apexive/theme/theme_data.dart';
import 'package:odoo_apexive/view/screens/timer_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
/*   HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  ); */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewTimerBloc>(
      create: (context) => NewTimerBloc(tickers: []),
      child: MaterialApp(
        title: 'Odoo Apexive',
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        home: const TimeScreen(),
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
